import 'package:get/get.dart';


// import '../../../data/repository/auth_rep/auth_rep.dart';

class HomeController extends GetxController {
  final count = 0.obs;

  static HomeController get instance => Get.find();
  // final _authRepo = AuthRepository.instance;
  // final BookRepository repository;
  HomeController(/* this.repository */);

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  void logout() {
    // _authRepo.logout();
  }

  //overview
}
