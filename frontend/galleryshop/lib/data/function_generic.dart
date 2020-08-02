import 'package:shared_preferences/shared_preferences.dart';

Future<String> get_token() async {
  var prefs = await SharedPreferences.getInstance();
  String token = (prefs.getString("tokenjwt") ?? "");
  return token;
}