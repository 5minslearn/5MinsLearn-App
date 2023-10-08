import 'package:localstorage/localstorage.dart';
import 'package:fiveminslearn/constants.dart' as constants;

class LocalStorageUtils {
  final LocalStorage storage = LocalStorage(constants.LOCAL_STORAGE_PATH);

  Future<void> setItem(String key, dynamic value) async {
    await storage.setItem(key, value);
  }

  Future<dynamic> getItem(String key) async {
    await storage.ready;
    return storage.getItem(key);
  }

  Future<void> deleteItem(String key) async {
    await storage.deleteItem(key);
  }
}
