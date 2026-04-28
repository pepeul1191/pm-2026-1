import 'package:get/get.dart';

class HomeController extends GetxController {
// índice reactivo
  var selectedIndex = 0.obs;

  // cambiar de tab
  void changeTab(int index) {
    selectedIndex.value = index;
  }

}
