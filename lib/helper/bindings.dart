import 'package:get/get.dart';
import '../core/view_model/auth_view_model.dart';
import '../core/view_model/control_view_model.dart';
import '../core/view_model/network_view_model.dart';




class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NetworkViewModel());
    Get.lazyPut(() => AuthViewModel());
    Get.lazyPut(() => ControlViewModel());
  }
}
