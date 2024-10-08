import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:prepare_project/core/utilities/basics.dart';
import 'package:prepare_project/features/tourist/generate_trip_with_ai/data/model/generated_trip_model.dart';
import 'package:prepare_project/features/tourist/generate_trip_with_ai/presentation/views/widgets/activity_deatils/activity_details_view.dart';
import 'package:prepare_project/features/tourist/historical_places/presentation/view/widgets/best_destination_item.dart';
import 'package:prepare_project/features/tourist/historical_places/presentation/view/widgets/best_destination_with_loading.dart';

class DiscoverPlacesGrid extends StatelessWidget {
  const DiscoverPlacesGrid({
    super.key,
    required this.height,
    required this.width,
    required this.place,
    this.changePicking,
    this.enablePicking=false,
  });

  final double height;
  final double width;
  final List<Place> place;
  final void Function(int index)?changePicking;
  final bool enablePicking;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: height*0.7,
        child: GridView.builder(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            itemCount:place.isEmpty?10:place.length,
            padding:const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
            physics:const BouncingScrollPhysics(),
            gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,crossAxisSpacing:20 ,mainAxisSpacing:20 ,childAspectRatio: .7),
            itemBuilder: (context,index){
              return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return ActivityDetailsView(place:  place[index],);
                    }));
                  },
                  child:place.isEmpty?
                  LoadingBestDestinationItem(height: height, width: width):
                  Stack(
                    alignment: Alignment.topRight,
                    children: [
                      BestDestinationItem(height: height, width: width, place: place[index],),
                      enablePicking?
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0,right: 16),
                        child: CircleAvatar(
                            radius: 15,
                            backgroundColor: Colors.white,
                            child: IconButton(onPressed: (){
                              enablePicking?changePicking!(index):();
                              }, icon:place[index].picked? const FaIcon(FontAwesomeIcons.minus,color: closeColor,):const FaIcon(FontAwesomeIcons.plus,color: basicColor,),)
                        ),
                      ) :
                      const SizedBox(),
                    ],
                  ));
            }
        ),
      ),
    );
  }
}
