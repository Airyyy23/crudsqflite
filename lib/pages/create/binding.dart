import 'package:get/get.dart';
import 'package:latihan_local_db/pages/create/controller.dart';

class CreateBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreateController());
  }
}