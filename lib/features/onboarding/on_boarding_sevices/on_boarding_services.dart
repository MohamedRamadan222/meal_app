import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingServices {
  static late SharedPreferences sharedPreferences;

  static Future initializeLocalStorage() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static bool isFirstTime() {
    bool isFirstTime = sharedPreferences.getBool('isFirstTime') ?? true;
    return isFirstTime;
  }

  static setFirstTimeWithFalse() {
    sharedPreferences.setBool('isFirstTime', false);
  }
}
