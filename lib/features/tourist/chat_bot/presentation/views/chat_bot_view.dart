import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prepare_project/core/utilities/function/service_locator.dart';
import 'package:prepare_project/features/tourist/chat_bot/data/repo/chat_bot_repo_impl.dart';
import 'package:prepare_project/features/tourist/chat_bot/presentation/manager/chat_bot_cubit.dart';
import 'package:prepare_project/features/tourist/chat_bot/presentation/manager/chat_bot_states.dart';
import 'package:prepare_project/features/tourist/chat_bot/presentation/views/widgets/chat_bot_body.dart';

import '../../../../../core/widget/custom_alert_widget/alert_container.dart';
import '../../../../../core/widget/custom_alert_widget/alert_types.dart';
class ChatBotView extends StatelessWidget {
  const ChatBotView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>ChatBotCubit(chatBotRepo: getIt.get<ChatBotRepoImp>()),
      child:BlocConsumer<ChatBotCubit,ChatBotState>(builder:(context,state)
      {
        return ChatBotBody(cubit: BlocProvider.of<ChatBotCubit>(context),);
      } ,listener: (context,state)
      {
        if(state is FailureSendRequestChatBotState) {
          showDialog(context: context, builder: (context)=> ContainerAlertWidget(
            types: AlertTypes.failed,
            onTap: (){
              Navigator.pop;
              },
            content: '${state.errMessage}',));
        }
      },),
    );
  }
}

