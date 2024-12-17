import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:vacalcula/controllers/db_controller.dart';

import 'package:vacalcula/source/local/database.dart';
import 'package:vacalcula/model/cow_data.dart' as Model;

class CheckboxControllerClass extends GetxController{
  RxBool checkbox = false.obs;
  Rx<String> name = "".obs;
  Rx<DateTime> date = DateTime.now().obs;
}

class Bovinos extends GetView<DbController> {
  const Bovinos({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(20),
        child: listCows(context)
      ),
    );
  }

  Widget buildCreateButton(BuildContext context, Function() addEmptyItem) {
    return RawMaterialButton(
      elevation: 2.0,
      fillColor: Theme.of(context).colorScheme.inversePrimary,
      constraints: const BoxConstraints(minWidth: 0.0),
      padding: const EdgeInsets.all(8.0),
      shape: const CircleBorder(),
      onPressed: addEmptyItem,
      child: Container(
        child: Icon(
          FontAwesomeIcons.plus,
          color: Theme.of(context).colorScheme.primary,
          size: 23,
        )
      ),
    );
  }

  Widget listCows(BuildContext context) {
    controller.getSavedData();
    return controller.obx((allItems) {
      print(allItems);
      return Column(
        children: [
          buildCreateButton(context, () {
            List<CowDataData> allItems2 = allItems ?? List.empty();
            allItems2.insert(0, CowDataData(
              id: 0,
              name: '',
              sex: 0,
              birth: DateTime.now(),
            ));
            controller.changeRefresh(allItems2);
          }),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) => cowRegister(context, allItems![index], index, false),
              separatorBuilder: (context, index) => const Divider(
                height: 1,
              ),
              itemCount: (allItems ?? List.empty()).length
            ),
          )
        ]
      );
    },
    onError: (error) => Text(error.toString()),
    onLoading: const CircularProgressIndicator());
  }

  Widget cowRegister(BuildContext context, CowDataData cow, int index, bool createEdit) {
    bool itemCreateEditState = createEdit || cow.id == 0;
    var cowModel = Model.CowData(id: cow.id, name: cow.name, sex: cow.sex, birth: cow.birth);

    Widget buildIcon() {
      return Container(
        padding: const EdgeInsets.all(12),
        child: Icon(
          FontAwesomeIcons.cow,
          size: 30.0,
          color: Theme.of(context).colorScheme.primary,
        ),
      );
    }

    Widget buildSexIcon(int sex) {
      if(sex == 0) {
        return const Icon(
          size: 22,
          color: Color.fromARGB(255, 61, 139, 255),
          FontAwesomeIcons.mars
        );
      } else {
        return const Icon(
          size: 22,
          color: Color.fromARGB(255, 255, 61, 245),
          FontAwesomeIcons.venus
        );
      }
    }

    Widget buildDescription(String name, int sex, DateTime birth) {
      CheckboxControllerClass checkboxController = Get.put(CheckboxControllerClass());
      getMonths() {
        var hoje = DateTime.now();
        int diferencaDias = hoje.difference(birth).inDays;
        var meses = ((diferencaDias ~/ 30));
        if(meses >= 12) {
          var anos = meses ~/ 12;
          meses = meses % 12;
          return '$anos anos e $meses meses';
        } else {
          return '$meses meses';
        }
      }

      List<Widget> resolveContent() {
        if(itemCreateEditState) {
          return [
            const TextField(
              textAlign: TextAlign.center,
              keyboardType: TextInputType.text,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                hintText: 'Nome',
                isDense: true,
                constraints: BoxConstraints(
                  maxWidth: 180
                )
              ),
            ),

            Container(
              padding: const EdgeInsets.only(top: 12),
              child: Row(
                children: [
                  Obx(()=> Checkbox(
                    value: !checkboxController.checkbox.value,
                    tristate: false,
                    onChanged: (value) {
                      checkboxController.checkbox.value = !checkboxController.checkbox.value;
                      cowModel.sex = checkboxController.checkbox.value ? 1 : 0;
                    },
                  )),
                  buildSexIcon(0),
                  Obx(()=> Checkbox(
                    value: checkboxController.checkbox.value,
                    tristate: false,
                    onChanged: (value) {
                      checkboxController.checkbox.value = !checkboxController.checkbox.value;
                      cowModel.sex = checkboxController.checkbox.value ? 1 : 0;
                    },
                  )),
                  buildSexIcon(1)
                ]
              ),
            ),
            TextField(
              onTap: () async {
                // Below line stops keyboard from appearing
                FocusScope.of(context).requestFocus(new FocusNode());
                
                // Show Date Picker Here
                final DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: checkboxController.date.value,
                  firstDate: DateTime(2015, 8),
                  lastDate: DateTime(2101));
                if (picked != null && picked != checkboxController.date.value) {
                  checkboxController.date.value = picked;
                }
              },
              textAlign: TextAlign.center,
              keyboardType: TextInputType.text,
              style: const TextStyle(color: Colors.black),
              decoration: const InputDecoration(
                hintText: 'Nascimento',
                isDense: true,
                constraints: BoxConstraints(
                  maxWidth: 180
                )
              ),
            ),
          ];
        } else {
          return [
            Text(name, style: Theme.of(context).textTheme.displayMedium),
            Row(
              children: [
                buildSexIcon(sex),
                Container(
                  padding: const EdgeInsets.only(left: 5),
                  child: Text(getMonths(), style: Theme.of(context).textTheme.displaySmall),
                )
              ]
            )
          ];
        }
      }

      return Container(
        padding: const EdgeInsets.only(left: 12, top: 12, bottom: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: resolveContent()
        ),
      );
    }

    Widget buildButtons(
        Function({Model.CowData? cow}) saveFun, 
        Function({Model.CowData? cow}) updateFun, 
        Function({Model.CowData? cow}) deleteFun) {
      saveEditButton() {
        if(itemCreateEditState) {
          return Icon(
            size: 22,
            color: Theme.of(context).colorScheme.primary,
            FontAwesomeIcons.solidFloppyDisk
          );
        } else {
          return Icon(
            size: 22,
            color: Theme.of(context).colorScheme.primary,
            FontAwesomeIcons.pencil
          );
        }
      }

      deleteButton() {
        return Icon(
          size: 28,
          color: Theme.of(context).colorScheme.primary,
          FontAwesomeIcons.xmark
        );
      }

      return Container(
        padding: const EdgeInsets.only(right: 12),
        child: Row(
          children: [
            IconButton(
              icon: Container(
                child: saveEditButton()
              ),
              onPressed: () {
                if(itemCreateEditState == true) {
                  cowModel.id = null;
                  saveFun(cow: cowModel);
                } else {
                  updateFun(cow: cowModel);
                }
              }
            ),
            IconButton(
              icon: Container(
                child: deleteButton()
              ),
              onPressed: () {
                deleteFun(cow: cowModel);
              }
            )
          ],
        ),
      );
    }

    return Card(
      child: Center(
        child: Row(
          children: <Widget>[
            buildIcon(),
            buildDescription(cow.name, cow.sex, cow.birth),
            const Spacer(),
            buildButtons(controller.insertData, controller.updateData, controller.deleteData)
          ],
        ),
      ),
    );
  }
}