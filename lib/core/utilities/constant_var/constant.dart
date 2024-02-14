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
enum Role{tourist,tourGuide}
const String authTourist='auth/tourist/';
const String authTourGuide='auth/tourGuide/';
String homeEndPoint='home/${SetAppState.prefs?.get('role')}/';
const baseUrl='http://54.162.144.241:8081/';

const chatBotUrl='http://184.73.59.25:8000/chatbot';
