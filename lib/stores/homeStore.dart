import 'package:mobx/mobx.dart';
import 'package:prova_flutter/models/item.dart';
import 'package:prova_flutter/service/shared_prefererences.dart';

part 'homeStore.g.dart';

class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store {
  @observable
  List<Item> list = <Item>[].asObservable();

  @action
  add({required Item item}) async {
    if (item.id != -1) {
      updateFromList(item);
    } else {
      addToList(item);
    }

    _saveList();
  }

  @action
  updateFromList(Item item) {
    var index = list.indexWhere((element) => element.id == item.id);

    list[index] = Item(text: item.text, id: item.id);
    return;
  }

  addToList(Item item) {
    if (item.text != '') list.add(Item(text: item.text, id: list.length + 1));
  }

  @action
  removeItem(int index) {
    list.removeAt(index);

    _saveList();
  }

  @action
  _saveList() {
    PrefService().save('list', list);
  }

  @action
  getListItems() async {
    var value = await PrefService().get('list');

    if (value != null) {
      for (var item in value) {
        var i = Item.fromJson(item);
        list.add(i);
      }
    }
  }

  @action
  _removeCachedListItems() async {
    await PrefService().remove('list');
  }
}
