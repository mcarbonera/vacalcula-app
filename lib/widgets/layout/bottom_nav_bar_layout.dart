
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:vacalcula/widgets/components/app_icon.dart';
import 'package:vacalcula/widgets/pages/page_controller.dart';
import 'package:vacalcula/widgets/pages/page_state.dart';

class BottomNavBarLayout extends StatelessWidget {
  BottomNavBarLayout({super.key});

  var navController = Get.find<PageNavController>();
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65,
      child: BottomAppBar(
        color: Theme.of(context).colorScheme.inversePrimary,
        child: Row(
          children: [
            IconButton(
              icon: AppIcon(
                title: 'Home',
                icon: FontAwesomeIcons.house,
              ),
              onPressed: () => {navController.navigate(PageState.home)}
            ),
            IconButton(
              icon: AppIcon(
                title: 'Pasto',
                icon: FontAwesomeIcons.tractor,
              ),
              onPressed: () => {navController.navigate(PageState.pasto)}
            ),
            IconButton(
              icon: AppIcon(
                title: 'Bovinos',
                icon: FontAwesomeIcons.cow,
              ),
              onPressed: () => {navController.navigate(PageState.bovinos)}
            ),
            IconButton(
              icon: AppIcon(
                title: 'Medicamentos',
                icon: FontAwesomeIcons.pills,
              ),
              onPressed: () => {navController.navigate(PageState.medicamentos)}
            ),
            IconButton(
              icon: AppIcon(
                title: 'Prenhez',
                icon: FontAwesomeIcons.arrowTrendUp,
              ),
              onPressed: () => {navController.navigate(PageState.prenhez)}
            )
          ],
        )
      )
    );
  }
}