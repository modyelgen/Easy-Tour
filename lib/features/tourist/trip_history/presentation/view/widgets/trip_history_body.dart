import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:prepare_project/features/sign_up/presentation/views/widgets/custom_app_bar_trip_generated.dart';
import 'package:prepare_project/features/tourist/profile/presentation/views/widgets/pic_profile_widget.dart';
import 'package:prepare_project/features/tourist/settings/presentaion/views/widgets/custom_switch.dart';
import 'package:prepare_project/features/tourist/trip_history/presentation/manager/trip_history_cubit.dart';
import 'package:prepare_project/features/tourist/trip_history/presentation/view/widgets/categories_trip_history.dart';
import 'package:prepare_project/features/tourist/trip_history/presentation/view/widgets/custom_trip_history.dart';
import 'package:prepare_project/features/tourist/trip_history/presentation/view/widgets/empty_history_view.dart';
import 'package:prepare_project/features/tourist/trip_history/presentation/view/widgets/generated_trip_history.dart';
import 'package:prepare_project/features/tourist/trip_history/presentation/view/widgets/history_tour_guide_trips.dart';

class TripHistoryManagerBody extends StatelessWidget {
  const TripHistoryManagerBody({super.key,required this.cubit,required this.height,required this.width});
  final double width;
  final double height;
  final TripManagerCubit cubit;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: CustomGeneratedAiTripAppBar(
            height: height, width: width, appBarTitle: 'Trip History',),
        ),
        ListTile(
          leading: ProfilePicWidget(imageUrl: '', height: height * 0.07,),
          title: const Text('Good Morning,john',),
          subtitle: Text(DateFormat('d MMMM y').format(DateTime.now()).toString()),
          trailing: CustomSwitch(
              active: false, height: height, width: width),
        ),
        const SizedBox(height: 15,),
        CategoryOfTripHistoryTypes(height: height,changeIndex: (int index){
          cubit.changeTripTypeIndex(index);
        },currIndex: cubit.currIndex,),
        const SizedBox(height: 15,),
        cubit.isEmpty?EmptyHistory(width: width, height: height):
        [
          TripHistoryOfGeneratedTrips(
            height: height, width: width,
            currentTrip: cubit.tripHistory.generatedTripsList.where((element) => DateTime.parse(element.endDate??"2024-03-05").isAtSameMomentAs(DateTime.now())).toList(),
            upComing: cubit.tripHistory.generatedTripsList.where((element) => DateTime.parse(element.startDate??"2024-03-05").isAfter(DateTime.now())).toList(),
            finished: cubit.tripHistory.generatedTripsList.where((element) => DateTime.parse(element.endDate??"2024-03-05").isBefore(DateTime.now())).toList(),
          ),
          TripHistoryOfCustomTrips(
            height: height, width: width,
            currentTrip: cubit.tripHistory.customTripsList.where((element) => DateFormat('d MMM y').parse(element.endDate??"2024-03-05").isAtSameMomentAs(DateTime.now())).toList(),
            upComing: cubit.tripHistory.customTripsList.where((element) => DateFormat('d MMM y').parse(element.startDate??"2024-03-05").isAfter(DateTime.now())).toList(),
            finished: cubit.tripHistory.customTripsList.where((element) => DateFormat('d MMM y').parse(element.endDate??"2024-03-05").isBefore(DateTime.now())).toList(),
          ),
          TripHistoryOfTripsWithTourGuide(
            height: height, width: width,
            currentTrip: cubit.tripHistory.tripsWithTourGuideList,
            upComing: const [],
            finished: const [],
          ),][cubit.currIndex]
      ],
    );
  }
}