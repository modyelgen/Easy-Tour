import 'package:prepare_project/core/utilities/function/set_app_state.dart';
List<String>signUpTourGuideButton=const ['Next','Next','Sign Up'];
List<String>loginResetPassword=const ['Send','Verify','Update'];
const List<String> genders=<String>['male','female',];
const String kTouristInfoBox='touristInfoBox';
List<String>stepsNamesSignUp=const['Id Verification','Personal Details','Create E-mail'];
List<String>stepsNamesResetPassword=const['Send Email','Otp Code','Reset Password'];
const List<String> languages =<String> [
  "English",
  "Spanish",
  "Mandarin Chinese",
  "Hindi",
  "Arabic",
  "Bengali",
  "Portuguese",
  "Russian",
  "Japanese",
  "Punjabi",
  "German",
  "French",
  "Javanese",
  "Telugu",
  "Marathi",
  "Tamil",
  "Turkish",
  "Urdu",
  "Korean",
  "Italian",
  "Hausa",
  "Dutch",
  "Swahili",
  "Gujarati",
  "Kannada",
  "Odia",
  "Malayalam",
  "Burmese",
  "Thai",
  "Sindhi",
  "Sinhala",
  "Nepali",
  "Kurdish",
  "Tamil",
  "Farsi (Persian)",
  "Malay",
  "Uzbek",
  "Oromo",
  "Maithili",
  "Yoruba",
  "Amharic",
  "Haitian Creole",
  "Armenian",
  "Finnish",
  "Icelandic",
  "Latvian",
  "Lithuanian",
];
const List<String>governments=[
  "beheira",
  "cairo",
  "alexandria",
  "giza",
  "sharqiya",
  "qalyubia",
  "munufia",
  "daqahliya",
  "kafr el-sheikh",
  "ismailia",
  "suez",
  "port said",
  "south sinai",
  "north sinai",
  "red sea",
  "new valley",
  "assiut",
  "sohag",
  "luxor",
  "qena",
  "aswan",
  "fayoum",
  "beni suef",
  "minya",
  "matruh"
];
List<String> prefs = const [
  "Historical and Cultural Tours",
  "Nile River Cruises",
  "Desert Adventures",
  "Beach and Red Sea Resorts",
  "Adventure and Wildlife Tours",
  "Religious and Pilgrimage Trips",
  "Luxury Tours",
  "Food and Culinary Tours",
  "Family-Friendly Trips",
  "Romantic Getaways",
  "Educational and Study Tours",
  "Special Interest Tours",
];
List<String>discoverPlacesCategories=const[
  'Cultural Centers', 'Religious Sites', 'Natural Landmarks',
  'Historical landmark', 'Bazaar', 'Entertainment Centers',
  'Beaches And Water Bodies', 'Malls'];
enum Role{tourist,tourGuide}
const String authTourist='auth/tourist/';
const String authTourGuide='auth/tourGuide/';
const String homeEndPointTourist='home/tourist/';
const String homeCommon='home/common/';
const String homeEndPointTourGuide='home/tourGuide/';
String homeEndMutualPoint='home/${SetAppState.prefs?.get('role')}/';
const String requestNotificationChannel='request_channel_notify';
const String chatNotificationChannel='chat_notification_channel';
const String reminderNotificationChannel='reminder_notification_channel';
const String forecastingWeatherKey='MW0BgPpZeo46MW13eHrMaXM9y2u2c1BJ';
const baseUrl='http://54.237.196.135:8081/';
const chatBotUrl='http://18.212.225.146:8000/chatbot';
const generateTripUrl='$generateTripBaseUrl/generate_trip';
const scanQrUrl='http://18.234.62.97:8000/decrypt/';
const googleNewApiUrl='https://places.googleapis.com/v1/places:';
const String routeApiUrl='https://routes.googleapis.com/directions/v2:computeRoutes';
const searchPlacePhoto='https://places.googleapis.com/v1/';
const String defaultCoverTrip='https://places.googleapis.com/v1/';
const androidApiGoogleMapKey='AIzaSyDjEPGnACyKEPFkkTOzC1ify2x9_MAnltA';
const String fieldMaskForNearbyPlaces='places.displayName,places.rating,places.photos,places.primaryType,places.primaryTypeDisplayName,places.reviews,places.nationalPhoneNumber,places.internationalPhoneNumber,places.regularOpeningHours.openNow,places.websiteUri,places.userRatingCount,places.location,places.priceLevel,places.shortFormattedAddress';
const String fieldMaskForTextSearch='places.displayName,places.rating,places.regularOpeningHours.openNow,places.location,places.shortFormattedAddress';
const String fieldMaskForGetRoute='routes.duration,routes.distanceMeters,routes.polyline.encodedPolyline';
const String fieldMaskForShortNearby='places.displayName,places.primaryTypeDisplayName,places.nationalPhoneNumber,places.internationalPhoneNumber,places.regularOpeningHours.openNow';
const String currencyConverterBaseUrl='https://v6.exchangerate-api.com/v6/$currencyConverterApiKey/';
const String currencyConverterApiKey='9a250bed3ba7c9c8dba370f1';
const generateTripBaseUrl='http://54.196.19.76:8000';
const hotelBookingUrl='https://api.test.hotelbeds.com';