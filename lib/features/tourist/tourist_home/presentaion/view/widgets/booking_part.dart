import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:prepare_project/core/utilities/go_router/go_router.dart';
import 'package:prepare_project/core/utilities/textStyle/font_styles.dart';
import 'package:prepare_project/features/tourist/tourist_home/data/model/home_data.dart';
import 'package:prepare_project/features/tourist/tourist_home/presentaion/view/widgets/card_element.dart';
class BookingPart extends StatelessWidget {
  const BookingPart({
    super.key,
    required this.height,
    required this.width,
    required this.isMenuActive,
  });

  final double height;
  final bool isMenuActive;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height*0.24,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Booking',style: CustomTextStyle.homePartTitle,),
          SizedBox(
              height: height*0.18,
              child: ListView.separated(
                clipBehavior: Clip.none,
                physics: isMenuActive?const NeverScrollableScrollPhysics():const BouncingScrollPhysics(),
                separatorBuilder: (context,index)=>const SizedBox(width: 20,),
                itemBuilder:(context,index){
                  return GestureDetector(
                      onTap:  [
                            (){
                          context.push(RouterApp.kTourGuideTripsBooking);
                        },
                            (){
                        context.push(RouterApp.kTouristHotelBooking);
                            },
                            (){
                              context.push(RouterApp.kTouristFlightTicketBooking);
                            },
                            (){

                            },
                      ][index],
                      child: CardElement(height: height,width: width,cardModel: bookingItems[index],));
                  }
                ,scrollDirection: Axis.horizontal,itemCount: bookingItems.length,)),
        ],
      ),
    );
  }
}