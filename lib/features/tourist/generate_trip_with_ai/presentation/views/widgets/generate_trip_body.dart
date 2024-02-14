import 'package:flutter/material.dart';
import 'package:prepare_project/features/login/presentation/view/widgets/login_button.dart';
import 'package:prepare_project/features/sign_up/presentation/views/widgets/custom_app_bar_trip_generated.dart';
import 'package:prepare_project/features/tourist/generate_trip_with_ai/presentation/manager/generate_trip_cubit.dart';
import 'package:prepare_project/features/tourist/generate_trip_with_ai/presentation/views/widgets/add_place_type.dart';
import 'package:prepare_project/features/tourist/generate_trip_with_ai/presentation/views/widgets/generated_trip_details.dart';
import 'package:prepare_project/features/tourist/generate_trip_with_ai/presentation/views/widgets/picked_places.dart';
import 'package:prepare_project/features/tourist/generate_trip_with_ai/presentation/views/widgets/select_date.dart';
import 'package:prepare_project/features/tourist/generate_trip_with_ai/presentation/views/widgets/select_type_of_place.dart';

class GenerateTripBody extends StatelessWidget {
  const GenerateTripBody({super.key,required this.height,required this.width,required this.cubit});
  final double height;
  final double width;
  final GenerateAiTripCubit cubit;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset('assets/tourist_home/generate_trip_cover.jpg',fit: BoxFit.fitHeight,height: height*0.4,width: width,),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding:const EdgeInsets.all(20,),
            width: width,
            height: height*0.78,
            decoration:const BoxDecoration(color: Colors.white,borderRadius: BorderRadius.only(topLeft:Radius.circular(40) ,topRight:Radius.circular(40) )),
            child:ListView(
              padding: EdgeInsets.only(bottom:MediaQuery.of(context).viewInsets.bottom),
              children: [
                SelectDateAndViewTripHistory(cubit: cubit, height: height, width: width),
                const SizedBox(height: 12,),
                SelectTypesOfPlaces(height: height, width: width,typeOfTourismList: cubit.typeOfTourismList,changeToggle: (index){
                  cubit.toggleBetweenTypes(index);
                },),
                const SizedBox(height: 12,),
                AddPlaceType(width: width, onSelect: (value){
                  cubit.addToPlaces(value);
                }),
                const SizedBox(height: 12,),
                PlacesWrapWidget(height: height, width: width,places: cubit.pickedPlaces,removeAt: (index){
                  cubit.removeFromPlaces(index);
                },),
                const SizedBox(height: 20,),
                Center(child:  CustomLoginButton(color: Colors.black,label:'Generate A Trip',altWidth: width*0.5,onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const GeneratedTripDetailsView()));
                },)),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0,left: 15),
          child: Align(
              alignment: Alignment.topLeft,
              child: CustomGeneratedAiTripAppBar(height: height, width: width)),
        ),
      ],
    );
  }
}









