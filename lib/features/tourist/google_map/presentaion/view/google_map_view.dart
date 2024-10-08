import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:prepare_project/core/utilities/function/service_locator.dart';
import 'package:prepare_project/features/tourist/google_map/data/repo/text_search_repo/text_search_repo_imp.dart';
import 'package:prepare_project/features/tourist/google_map/presentaion/manager/map_cubit/google_map_cubit.dart';
import 'package:prepare_project/features/tourist/google_map/presentaion/manager/map_cubit/google_map_states.dart';
import 'package:prepare_project/features/tourist/google_map/presentaion/view/google_map_body.dart';
class GoogleMapView extends StatelessWidget {
  const GoogleMapView({super.key,this.initialLatLng,this.initialInfo,this.markers,this.polyLines,this.requestLat});
final LatLng? initialLatLng;
final String? initialInfo;
final Set<Marker>?markers;
final Set<Polyline>?polyLines;
final LatLng? requestLat;
  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context)=>GoogleMapCubit(textSearchRepoImp: getIt.get<GoogleSearchRepoImp>(),initialLatLng: initialLatLng,initialLatLngInfo: initialInfo,requestLatLng: requestLat)..determinePosition(),
      child:BlocConsumer<GoogleMapCubit,GoogleMapStates>(builder:(context,state){
        var cubit=BlocProvider.of<GoogleMapCubit>(context);
        return GoogleMapBody(cubit: cubit,initialMarkers: markers,initialPolyLines:polyLines,initialLatLng:initialLatLng);
      } ,listener: (context,state){
      },),
    );
  }
}




