import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:prepare_project/core/utilities/function/set_app_state.dart';
import 'package:prepare_project/features/tourist/chat_bot/data/model/chat_bot_model.dart';
import 'package:prepare_project/features/tourist/chat_bot/presentation/manager/chat_bot_states.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

import '../../data/repo/chat_bot_repo.dart';

class ChatBotCubit extends Cubit<ChatBotState>{
  ChatBotCubit({required this.chatBotRepo,this.initialMessage}):super(InitialChatBotState());
  final ChatBotRepo chatBotRepo;
  final String?initialMessage;
  final TextEditingController messageController=TextEditingController();
  final ScrollController scrollController=ScrollController();
  List<ChatBotModel>messages=[];
  String? requestMessage;
  bool enableSend=false;
  SpeechToText speechToText = SpeechToText();
  bool enableSpeech=false;
  bool enableMic=false;
  bool voiceIsPlaying=false;
  List<LocaleName>localsExist=[];
  FlutterTts flutterTts = FlutterTts();
  String?localId;
  bool showListLang=true;
  bool showChangeLangWidget=false;
  TextEditingController langController=TextEditingController();
  List<LocaleName>searchedList=[];
  int chatBotCurrentPage=SetAppState.prefs?.getInt('pageIndex')??0;

  void changeShowListOfLang(){
    showListLang=!showListLang;
    emit(ChangeShowLanguageOfChatState());
  }

  void openOrCloseChangeWidget(bool open){
    if(open){
      showChangeLangWidget=true;
    }
    else{
      showChangeLangWidget=false;
    }
    emit(OpenOrCloseChangeLangState());
  }

  void getFromBot(String response){
    ChatBotModel model=ChatBotModel(message: '');
    response='$response<bot>';
    model.message=response;
    model.messageDateTime=DateTime.now();
    Future.delayed(const Duration(seconds: 2),() {
      messages.add(model);
      emit(AddedToListMessagesChatBotState());
      sortMessages();
    });
  }
  void setLocalId(LocaleName localeName){
    langController.text=localeName.name;
    localId=localeName.localeId;
    emit(ChangeLocalIdOfChatState());
  }

  void changePageIndex()async{
    chatBotCurrentPage=1;
    await SetAppState.prefs?.setInt('pageIndex', 1);
    emit(ChangePageCurrentState());
  }
  void initChatBot(){
    if(initialMessage!=null){
      enableSend=true;
      messageController.text=initialMessage??'';
      emit(InitialChatBotMessagesState());
    }
  }
  Future<void> sendQuestion()async{
    if(messageController.text.isNotEmpty)
    {
      addToMessageModel();
      emit(LoadingSendRequestChatBotState());
      var result=await chatBotRepo.sendRequest(data: ChatBotModel(message:requestMessage).toJson());
      messages.first.sent=true;
      return result.fold(
              (failure) {
            emit(FailureSendRequestChatBotState(errMessage: failure.errMessage));
          },
              (response) {
            emit(SuccessSendRequestChatBotState());
            getFromBot(response.message??"");
          }
      );
    }
}
void pauseTts()async{
    await flutterTts.stop();
    voiceIsPlaying=false;
    emit(ChangeEnableVoiceState());
}
void textToSpeech(String text)async{

      await flutterTts.setLanguage(localId!);
      voiceIsPlaying=true;
      emit(ChangeEnableVoiceState());
      await flutterTts.speak(text);


}

void searchForLocalId(String value){
    searchedList=localsExist.where((element) => element.name.toLowerCase().contains(value.toLowerCase())).toList();
    emit(ChangeLocalIdOfChatState());
}
   void addToMessageModel(){
     ChatBotModel model=ChatBotModel(message: '');
     model.message=messageController.text;
     model.messageDateTime=DateTime.now();
     requestMessage=messageController.text;
     messageController.clear();
     messages.add(model);
     emit(AddedToListMessagesChatBotState());
     sortMessages();
   }
   void sortMessages(){
     messages.sort((a, b) => b.messageDateTime!.compareTo(a.messageDateTime!));
   }
   void deleteChat(){
    messages.clear();
    emit(DeleteChatBotMessagesState());
   }
   void checkExistOfText(){
    if(messageController.text.trim()!=""){
      enableSend=true;
    }
    else{
      enableSend=false;
    }
    emit(EnableSendRequestState());
   }
  void initSpeech() async {
    enableSpeech = await speechToText.initialize(
    );
    localsExist=await speechToText.locales();
    localId=localsExist.first.localeId;
    searchedList=localsExist;
    langController.text='${searchedList[0].name}-${searchedList[0].localeId}';
    if(enableSpeech){
      emit(InitializeSpeechToTextRecognition());
    }
    else{
      emit(FailureSendRequestChatBotState(errMessage: 'Cant Initialise Text To Speech'));
    }

  }

  void startListening() async {
    enableMic=true;
    if(!enableSpeech){
      emit(FailureSendRequestChatBotState(errMessage: 'You don\'t Allow The Mic Permissions'));
    }
    else{
      await speechToText.listen(onResult: onSpeechResult,localeId: localId);
      emit(StartListeningToVoiceState());
    }
  }

  void stopListening() async {
    enableMic=false;
    await speechToText.stop();
    emit(StopListeningToVoiceState());
  }

  void onSpeechResult(SpeechRecognitionResult result) {
    messageController.text=result.recognizedWords;
    checkExistOfText();
    emit(ChangeVoiceToTextState());
  }
}