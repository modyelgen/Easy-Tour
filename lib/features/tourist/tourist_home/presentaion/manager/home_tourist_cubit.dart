import 'package:flutter/animation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prepare_project/features/tourist/tourist_home/data/repo/home_tourist_repo_impl.dart';
import 'package:prepare_project/features/tourist/tourist_home/presentaion/manager/home_tourist_state.dart';

import '../../../../../core/utilities/function/set_app_state.dart';

class HomeTouristCubit extends Cubit<HomeTouristState>{
  HomeTouristCubit({required this.controller,required this.homeTouristRepoImp}):super(InitialHomeTouristState());
  bool isMenuActive=false;
  final AnimationController? controller;
  final String?touristName= SetAppState.prefs?.getString('name');
  final String?profileUrl= SetAppState.prefs?.getString('profileUrl');
  final HomeTouristRepoImp homeTouristRepoImp;
  int currIndex=0;
  void changeMenuState(){
    isMenuActive=!isMenuActive;
    emit(ChangeHomeTouristMenuState());
  }
  void openSideBar()async
  {
    if(currIndex==0){
    changeMenuState();
    controller?.forward();
    emit(ChangeHomeTouristAnimationState());
    }
  }
  void closeSideBar()
  {
    if(currIndex==0){
    changeMenuState();
    controller?.reverse();
    emit(ChangeHomeTouristAnimationState());
    }
  }
  void changeBottomNavIndex(int index) {
    if(index!=currIndex)
    {
      currIndex=index;
    }
    emit(ChangeHomeTouristNavBottomState());
  }
  Future<void> logOut()async{
    emit(LoadingLogOutState());
    await SetAppState.setToken(token:'');
    emit(SuccessLogOutState());
    var result =await homeTouristRepoImp.logOut();
    result.fold(
        (failure){
          emit(FailureLogOutState(failure.errMessage));
        }, (logOut) async {
          await SetAppState.setToken(token:'');
          emit(SuccessLogOutState());
        }
    );
  }

}
