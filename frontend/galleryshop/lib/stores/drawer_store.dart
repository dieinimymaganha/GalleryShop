import 'package:mobx/mobx.dart';

part 'drawer_store.g.dart';

class DrawerStore = _DrawerStore with _$DrawerStore;

abstract class _DrawerStore with Store {
  @observable
  int page = 0;

  @action
  void setPage(int value) => page = value;

  @computed
  Function get buttomPress => setPage;

  @computed
  bool get isHighlighted => page == page;
}
