import 'package:shared_preferences/shared_preferences.dart';

Future<String> getToken() async {
  var prefs = await SharedPreferences.getInstance();
  String token = (prefs.getString("tokenjwt") ?? "");
  return token;
}

String convertData(String data) {
  String nwdata = data.substring(0, 10);
  return nwdata;
}
