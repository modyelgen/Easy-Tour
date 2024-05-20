import 'package:go_router/go_router.dart';
import 'package:prepare_project/core/utilities/function/set_app_state.dart';
import 'package:prepare_project/features/common_settings/presentation/views/common_setting_view.dart';
import 'package:prepare_project/features/forget_pass/presentation/view/forget_password_view.dart';
import 'package:prepare_project/features/login/presentation/view/login_view.dart';
import 'package:prepare_project/features/sign_up/presentation/views/sign_up_view.dart';
import 'package:prepare_project/features/tour_guide/basic/presentation/view/home_basic_view.dart';
import 'package:prepare_project/features/tour_guide/requested_trips/presentaions/view/requested_trip_for_guide_view.dart';
import 'package:prepare_project/features/tourist/booking_collection/book_with_tour_guide/presentation/views/book_with_tour_guide_view.dart';
import 'package:prepare_project/features/tourist/chat_bot/presentation/views/chat_bot_view.dart';
import 'package:prepare_project/features/tourist/chat_with_other/presentaions/views/chat_with_other_view.dart';
import 'package:prepare_project/features/tourist/currency_converter/presentation/view/currency_converter_view.dart';
import 'package:prepare_project/features/tourist/custom_trip/presentation/views/custom_trip_view.dart';
import 'package:prepare_project/features/tourist/entertainment_places/presentation/views/entertainment_places_view.dart';
import 'package:prepare_project/features/tourist/generate_trip_with_ai/presentation/views/generate_trip_wit_ai.dart';
import 'package:prepare_project/features/tourist/image_classification/presentation/views/image_classificarion_view.dart';
import 'package:prepare_project/features/tourist/tourist_feed/presentation/view/widgets/create_post_view.dart';
import 'package:prepare_project/features/tourist/tourist_home/presentaion/view/home_view.dart';
import 'package:prepare_project/features/tourist/weather_forecast/presentation/views/weather_forecast_view.dart';
import '../../../features/splash/presentation/views/splash_view.dart';
import '../../../features/tourist/profile/presentation/views/profile_view.dart';

 class RouterApp{
  static const kLoginView='/loginView';
  static const kSignUpView='/SignUpView';
  static const kSignUpPages='/SignUpPages';
  static const kHomeView='/HomeView';
  static const kUserInfo='/UserInfo';
  static const kResetPasswordView='/ResetPasswordView';
  static const kCommonSettings='/TouristSettings';
  static const kTourGuideNotifications='/TouristNotifications';
  static const kTestAudio='/TestAudio';
  static const kChatBotView='/ChatBotView';
  static const kWeatherView='/WeatherView';
  static const kCustomTripView='/CustomTripView';
  static const kCurrencyConverter='/CurrencyConverter';
  static const kGenerateTripView='/GenerateTripView';
  static const kTourGuideHome='/TourGuideHomeView';
  static const kImageClassification='/ImageClassification';
  static const kHistoricalPlace='/HistoricalPlaces';
  static const kEntertainmentPlaces='/EntertainmentPlaces';
  static const kChatTouristView='/ChatTouristView';
  static const kTourGuideTripsBooking='/TourGuideBookingTrips';
  static const kTouristCreatePost='/TouristCreatePost';
  static final router=GoRouter(routes:[
   GoRoute(path: '/',builder: (context,state){
   // return const OnBoardingView();
    if(SetAppState.prefs?.getInt('currIndex')==2&&SetAppState.prefs!.getString('token')=='')
    {
     return const LoginScreen();
    }
    else if(SetAppState.prefs!.getString('token')!=''&&SetAppState.prefs!.getString('role')=='tourGuide')
    {
     return const BasicHome();
    }
    else if(SetAppState.prefs!.getString('token')!=''&&SetAppState.prefs!.getString('role')=='tourist')
    {
     return const HomeTouristView();
    }
    else
    {
     return const OnBoardingView();
    }
   }),
   GoRoute(path: kLoginView,builder: (context,state)=>const LoginScreen(),),
   GoRoute(path: kSignUpView,builder: (context,state)=>const SignUpView()),
   GoRoute(path: kHomeView,builder: (context,state)=>const HomeTouristView()),
   GoRoute(path: kUserInfo,builder: (context,state)=>const ProfileView()),
   GoRoute(path: kResetPasswordView,builder: (context,state)=>const ForgetPasswordView(),),
   GoRoute(path: kCommonSettings,builder: (context,state)=>const CommonSettingView(),),
   GoRoute(path: kChatBotView,builder: (context,state){
     return const ChatBotView();
   }),
   GoRoute(path: kGenerateTripView,builder: (context,state){
     return const GenerateAiTrip();
   }),
   GoRoute(path: kTourGuideHome,builder: (context,state)=>const BasicHome(),),
   GoRoute(path: kImageClassification,builder: (context,state)=>const ImageClassificationView(),),
   GoRoute(path: kEntertainmentPlaces,builder: (context,state)=>const EntertainmentPlacesView(),),
   GoRoute(path: kChatTouristView,builder: (context,state)=>const TouristChatWithOtherView(),),
   GoRoute(path: kTourGuideTripsBooking,builder: (context,state)=>const BookTripWithTourGuides(),),
   GoRoute(path: kTourGuideNotifications,builder: (context,state)=>const RequestedTripsTourGuideView(),),
   GoRoute(path: kCurrencyConverter,builder: (context,state)=>const CurrencyConverterView(),),
   GoRoute(path: kWeatherView,builder: (context,state)=>const WeatherForecastView(),),
   GoRoute(path: kCustomTripView,builder: (context,state)=>const CustomTripView(),),
   GoRoute(path: kTouristCreatePost,builder: (context,state)=>const CreatePostView(),),
  ]);
}