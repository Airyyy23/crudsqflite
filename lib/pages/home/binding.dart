import 'package:get/get.dart';
import 'package:latihan_local_db/pages/home/controller.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}