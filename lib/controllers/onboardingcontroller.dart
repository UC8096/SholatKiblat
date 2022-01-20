part of 'controllers.dart';

class OnBoardingController extends GetxController {
  Future<int?> initFirstScreen() async {
    SharedPreferences? preferences;
    preferences = await SharedPreferences.getInstance();
    int? initScreen = preferences.getInt("initScreen");
    await preferences.setInt("initScreen", 1);

    print("initScreen : $initScreen");

    return initScreen;
  }
}
