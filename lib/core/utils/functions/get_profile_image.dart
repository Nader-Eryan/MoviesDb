import 'package:shared_preferences/shared_preferences.dart';

import '../service_locator.dart';

Future<String?> getProfileImage() async {
  SharedPreferences prefs = await getIt.get<Future<SharedPreferences>>();
  String? profilePicPath = prefs.getString('imagePath');
  return profilePicPath;
}
