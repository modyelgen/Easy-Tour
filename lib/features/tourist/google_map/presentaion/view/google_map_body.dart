import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:prepare_project/core/utilities/basics.dart';
import 'package:prepare_project/core/utilities/function/decode_poly_lines.dart';
import 'package:prepare_project/core/utilities/textStyle/font_styles.dart';
import 'package:prepare_project/core/widget/tour_guide/custom_border_raduis.dart';
import 'package:prepare_project/features/tourist/google_map/presentaion/manager/map_cubit/google_map_cubit.dart';
import 'package:prepare_project/features/tourist/google_map/presentaion/view/bottom_sheet_for_initial_lat_lng.dart';
import 'package:prepare_project/features/tourist/google_map/presentaion/view/text_search_with_result.dart';
class GoogleMapBody extends StatefulWidget {
  const GoogleMapBody({
    super.key,
    required this.cubit,
    this.initialMarkers,
    this.initialPolyLines,
    this.initialLatLng,

  });

  final GoogleMapCubit cubit;
  final Set<Marker>?initialMarkers;
  final Set<Polyline>?initialPolyLines;
  final LatLng? initialLatLng;

  @override
  State<GoogleMapBody> createState() => _GoogleMapBodyState();
}

class _GoogleMapBodyState extends State<GoogleMapBody> {
  @override
  void initState() {
    super.initState();
  }
  @override
  void dispose(){
    super.dispose();
    googleMapController?.dispose();
  }
  GoogleMapController? googleMapController;
  Set<Marker>markers={};
  bool isFirstCall=true;
  @override
  Widget build(BuildContext context) {
    final double width=BasicDimension.screenWidth(context);
    final double height=BasicDimension.screenHeight(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomSheet: widget.cubit.showInitialBottomSheet?BottomSheetForInitial(height: height, width: width, cubit: widget.cubit,):null,
      body:
      widget.cubit.myLocation==null?
      const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Center(child: CircularProgressIndicator(),)
      ],):
      Stack(
        children: [
          GoogleMap(
            onTap: (latLng){
              widget.cubit.getMarkAtSpecificLatLng(markers,latLng);
            },
              zoomControlsEnabled: false,
              polylines: widget.initialPolyLines??widget.cubit.polyLinesSets,
              onMapCreated:(controller){
                googleMapController=controller;
              },
              markers:widget.initialMarkers??markers,
              initialCameraPosition: CameraPosition(zoom: 14,target:widget.initialLatLng??LatLng(widget.cubit.myLocation!.latitude ,widget.cubit.myLocation!.longitude),)
          ),
          TextSearchWithResultList(width: width, height: height, cubit: widget.cubit, markers: markers,controller: googleMapController,),
          Positioned(
            bottom: height*0.05,
              left: width*0.85,
              child: Container(
                  decoration:const BoxDecoration(color: Colors.white,shape: BoxShape.circle),
                  child: IconButton(onPressed: (){
                    widget.cubit.enableLiveLocationMethod();
                    updateMyLocation(enableLiveLocation: widget.cubit.enableLiveLocation);
                    setState(() {
                    });
                  }, icon: const Icon(Icons.my_location_outlined,color: basicColor,size: 40,)))),
          widget.cubit.enableRequest?Align(
              alignment: Alignment.center,
              child: OptionToPickLocation(height: height, width: width,cubit: widget.cubit,)):SizedBox(),
        ],
      ),
    );
  }
  void updateMyLocation({required bool enableLiveLocation}) async {
    if(await widget.cubit.askToEnableMyLocation()){
      getPositionStream(enableLiveLocation: enableLiveLocation);
    }
  }
  void getPositionStream({required bool enableLiveLocation})async{
    LocationSettings locationSetting=const LocationSettings(distanceFilter: 2,);
    BitmapDescriptor iconImage=BitmapDescriptor.fromBytes(await getImageFormRawData('assets/google_map_assets/location_arrow.png', 100));
    if(enableLiveLocation){
      Geolocator.getPositionStream(locationSettings: locationSetting).listen((locationData)
      {
        markers.add(Marker(infoWindow: const InfoWindow(title: 'My Location'),icon:iconImage,markerId: const MarkerId('liveMarker'),position: LatLng(locationData.latitude, locationData.longitude)));
        if(mounted){
          setState(() {
          });
          if(isFirstCall){
            googleMapController?.animateCamera(CameraUpdate.newCameraPosition(
                CameraPosition(zoom: 17,target: LatLng(locationData.latitude,locationData.longitude,))));
          }
          else
          {
            googleMapController?.animateCamera(CameraUpdate.newLatLng(LatLng(locationData.latitude,locationData.longitude,)));
          }
        }

      });
    }


  }
}
class OptionToPickLocation extends StatelessWidget {
  const OptionToPickLocation({super.key,required this.height,required this.width,required this.cubit});
final double width;
final double height;
final GoogleMapCubit cubit;
  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.all(10),
      width: width,
      height: height*0.2,
      decoration:BoxDecoration(
        color: thirdColor,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: entertainmentColor,width: 2)
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: IconButton(onPressed: (){
              cubit.closeRequestLatLng();
            }, icon: Icon(Icons.close)),
          ),

          Text('Send This Location ?',style: CustomTextStyle.fontBold14,),
          SizedBox(height: height*0.02,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: width*0.35,
                decoration: BoxDecoration(
                  color: closeColor,
                  borderRadius: commonBorderRadius()
                ),
                child: TextButton(onPressed: (){
                  cubit.closeRequestLatLng();
                }, child: Text("cancel",style: CustomTextStyle.font16NormalWhite,)),
              ),
              Container(
                width: width*0.35,
                decoration: BoxDecoration(
                  color: forthColor,
                  borderRadius: commonBorderRadius()
                ),
                child: TextButton(onPressed: (){
                  Navigator.pop(context,cubit.requestLatLng);
                }, child: Text("Send",style: CustomTextStyle.font16NormalWhite,)),
              ),
            ],
          )
        ],
      ),
    );
  }
}


