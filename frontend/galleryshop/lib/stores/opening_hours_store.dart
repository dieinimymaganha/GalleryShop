import 'package:galleryshop/http/webclients/webclient_opening_hours.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'opening_hours_store.g.dart';

class OpeningHoursStore = _OpeningHoursStore with _$OpeningHoursStore;

abstract class _OpeningHoursStore with Store {
  OpeningHoursWebClient openingHoursWebClient = OpeningHoursWebClient();

  @observable
  int idEmployee = 0;

  @observable
  List<dynamic> listOpeningHours = List();

  @action
  Future<void> setList() async {
    listOpeningHours =
        await openingHoursWebClient.findListOpeningHoursId(idEmployee);
  }

  @action
  Future<void> setIdEmployee() async {
    idEmployee = await getIdEmployee();
    await setList();
  }

  @action
  Future<int> getIdEmployee() async {
    var prefs = await SharedPreferences.getInstance();
    int id = (prefs.getInt("idEmployee"));
    return id;
  }
}
