import 'package:localstorage/localstorage.dart';
import "package:fiveminslearn/contants.dart" as constants;

class LocalStorageUtils {
  final LocalStorage storage = LocalStorage(constants.LOCAL_STORAGE_PATH);

  void setItem(String key, dynamic value) {
    storage.setItem(key, value);
  }

  dynamic getItem(String key) {
    return storage.getItem(key);
  }
}
