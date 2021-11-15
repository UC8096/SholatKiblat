part of 'bindings.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<JadwalController>(() => JadwalController());
    Get.lazyPut<KiblatController>(() => KiblatController());
    Get.lazyPut<KontenController>(() => KontenController());
  }
}
