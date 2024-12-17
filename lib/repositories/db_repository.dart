import 'package:get/get.dart';
import 'package:vacalcula/model/cow_data.dart' as Model;
import 'package:vacalcula/source/local/database.dart';

class DbRepositoryImpl implements DbRepository {
  @override
  Future<List<CowDataData>> getSavedData() {
    AppDatabase appDatabase = Get.find<AppDatabase>();
    return appDatabase.select(appDatabase.cowData).get();
  }

  @override
  Future<int> insertData({Model.CowData? cow}) {
    AppDatabase appDatabase = Get.find<AppDatabase>();
    return appDatabase
      .into(appDatabase.cowData)
      .insert(CowDataCompanion.insert(
        name: cow?.name ?? "",
        sex: cow?.sex ?? 0,
        birth: cow?.birth ?? DateTime.now(),
      )
    );
  }

  @override
  Future<bool> updateData({Model.CowData? cow}) {
    AppDatabase appDatabase = Get.find<AppDatabase>();
    return appDatabase
      .update(appDatabase.cowData)
      .replace(CowDataData(
        id: cow?.id ?? 0,
        name: cow?.name ?? "",
        sex: cow?.sex ?? 0,
        birth: cow?.birth ?? DateTime.now(),
      ));
  }

  @override
  void deleteData({Model.CowData? cow}) {
    AppDatabase appDatabase = Get.find<AppDatabase>();
    if(cow == null || cow.id == null) return;
    appDatabase
      .delete(appDatabase.cowData)
      .where((entity) => entity.id.equals(cow.id!));
  }
}

abstract class DbRepository {
  Future<List<CowDataData>> getSavedData();
  Future<int> insertData({Model.CowData? cow});
  Future<bool> updateData({Model.CowData? cow});
  void deleteData({Model.CowData? cow});
}