import 'package:get/get.dart';

class SimpleCRUDController extends GetxController {
  final _list = <String>[].obs;
  List<String> get list => _list;

  add(String n) {
    _list.add(n);
    update(); //setState
  }

  updateItem(int index, String n) {
    _list[index] = n;
    update();
  }

  delete(int index) {
    _list.removeAt(index);
    update();
  }

  clearState() {
    Get.delete<SimpleCRUDController>(force: true);
  }
}
