import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'opening_hours_store.g.dart';

class OpeningHoursStore = _OpeningHoursStore with _$OpeningHoursStore;

abstract class _OpeningHoursStore with Store {
  @observable
  int idEmployee = 0;

  @action
  Future<void> setIdEmployee() async {
    idEmployee = await getIdEmployee();
  }

  @action
  Future<int> getIdEmployee() async {
    var prefs = await SharedPreferences.getInstance();
    int id = (prefs.getInt("idEmployee"));
    return id;
  }
}
