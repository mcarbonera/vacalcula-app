import 'package:get/get.dart';
import 'package:vacalcula/model/cow_data.dart' as Model;
import 'package:vacalcula/repositories/db_repository.dart';
import 'package:vacalcula/source/local/database.dart';

class DbController extends GetxController with StateMixin<List<CowDataData>> {

  DbController({required this.repository}) {
    change(null, status: RxStatus.empty());
  }

  final DbRepository repository;

  Future<void> getSavedData() async {
    change(null, status: RxStatus.loading());

    await repository.getSavedData()
      .then((value) {
        change(value, status: RxStatus.success());
      })
      .onError((error, stackTrace) {
        change(null, status: RxStatus.error(error.toString()));
      });
  }

  changeRefresh (value) => change(value, status: RxStatus.success());

  Future<int> insertData({Model.CowData? cow}) {
    return repository.insertData(cow: cow);
  }

  Future<bool> updateData({Model.CowData? cow}) {
    return repository.updateData(cow: cow);
  }

  void deleteData({Model.CowData? cow}) {
    return repository.deleteData(cow: cow);
  }
}