import 'package:get/get.dart';
import 'package:vacalcula/controllers/db_controller.dart';
import 'package:vacalcula/repositories/db_repository.dart';
import 'package:vacalcula/source/local/database.dart';

class MainBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(AppDatabase());
    Get.put(DbController(repository: DbRepositoryImpl()));
  }
}