import 'package:shared_preferences/shared_preferences.dart';
import 'package:whats_for_tonight/core/utils/service_locator.dart';

Future<void> safeImagelocally({required String path}) async {
  SharedPreferences prefs = await getIt.get<Future<SharedPreferences>>();
  prefs.setString('imagePath', path);
}
