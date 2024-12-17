import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:vacalcula/widgets/components/nav_card.dart';
import 'package:vacalcula/widgets/pages/page_controller.dart';
import 'package:vacalcula/widgets/pages/page_state.dart';

class Home extends StatelessWidget {
  Home({super.key});
  
  var navController = Get.find<PageNavController>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(20),
        child: GridView.count(  
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          childAspectRatio: 1,
          crossAxisCount: 2,
          children: [
            NavCard(
              title: "Pasto",
              icon: FontAwesomeIcons.tractor,
              navState: PageState.pasto,
              navController: navController
            ),
            NavCard(
              title: "Bovinos",
              icon: FontAwesomeIcons.cow,
              navState: PageState.bovinos,
              navController: navController
            ),
            NavCard(
              title: "Medicamentos",
              icon: FontAwesomeIcons.pills,
              navState: PageState.medicamentos,
              navController: navController
            ),
            NavCard(
              title: "Prenhez",
              icon: FontAwesomeIcons.arrowTrendUp,
              navState: PageState.prenhez,
              navController: navController
            ),
          ],
        ),
      )
    );
  }
}