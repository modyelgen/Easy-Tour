import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:prepare_project/core/utilities/basics.dart';
import 'package:prepare_project/core/utilities/textStyle/font_styles.dart';
import 'package:prepare_project/features/tourist/custom_trip/presentation/manager/custom_trip_cubit.dart';
import 'package:prepare_project/features/tourist/custom_trip/presentation/views/widgets/empty_day_item.dart';
import 'package:prepare_project/features/tourist/generate_trip_with_ai/data/model/generated_trip_model.dart';
import 'package:prepare_project/features/tourist/historical_places/presentation/view/historical_places_view.dart';
import 'package:prepare_project/features/tourist/historical_places/presentation/view/widgets/best_destination_item.dart';

class DaysToAddList extends StatelessWidget {
  const DaysToAddList({super.key,required this.width,required this.height,required this.placesMap,required this.cubit});
  final double width;
  final double height;
  final CustomTripCubit ?cubit;
  final Map<String,List<Place>>placesMap;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Add Trip Days',style: CustomTextStyle.privateTourTitle,),
        SizedBox(
          height: height*0.5,
          child: ListView.separated(
            physics:const BouncingScrollPhysics(),
            itemBuilder: (context,bigIndex){
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment:MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Day${bigIndex+1}',style: CustomTextStyle.commonSignDark,),
                      TextButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return DiscoverPLacesView(enablePicking: true,customTripCubit: cubit,initialList: placesMap['Day${bigIndex+1}'],);
                        }));
                      }, child: const Text('Add More')),
                    ],
                  ),
                  placesMap['Day${bigIndex+1}']!.isEmpty?
                  GestureDetector(
                      onTap:(){
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return DiscoverPLacesView(enablePicking: true,customTripCubit: cubit,initialList: placesMap['Day${bigIndex+1}'],);
                        }));
                      },
                      child: EmptyDayToAddItem(width: width,)) :
                  SizedBox(
                    height: height*0.3,
                    child: ListView.builder(
                      itemCount: placesMap['Day${bigIndex+1}']!.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context,index){
                        return Padding(
                          padding: const EdgeInsets.only(right: 15.0),
                          child: Stack(
                            alignment: Alignment.topRight,
                            children: [
                              BestDestinationItem(height: height, width: width, place: placesMap['Day${bigIndex+1}']![index],),
                              Padding(
                                padding: const EdgeInsets.only(top: 16.0,right: 16),
                                child: CircleAvatar(
                                    radius: 15,
                                    backgroundColor: Colors.white,
                                    child: IconButton(onPressed: (){
                                      cubit?.removeSpecificPlace(bigIndex+1, index);
                                    }, icon: const FaIcon(FontAwesomeIcons.minus,color: closeColor,),)
                                ),
                              ),
                            ],
                          ),
                        );
                      },),
                  ),
                ],
              );
            },
            separatorBuilder: (context,index){
              return const SizedBox(height: 12,);},
            itemCount: placesMap.length,
            padding:const EdgeInsets.symmetric(horizontal: 10),
          ),
        ),
      ],
    );
  }
}