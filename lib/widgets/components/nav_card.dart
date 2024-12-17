import 'package:flutter/material.dart';
import 'package:vacalcula/widgets/components/app_icon.dart';
import 'package:vacalcula/widgets/pages/page_controller.dart';
import 'package:vacalcula/widgets/pages/page_state.dart';

class NavCard extends StatelessWidget {
  const NavCard({
    super.key,
    required this.title, 
    required this.icon,
    required this.navState,
    required this.navController
  });

  final String title;
  final IconData icon;
  final PageState navState;
  final PageNavController navController;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(9.0),
      child: InkWell(
        onTap: () => navController.navigate(navState),
        splashColor: const Color.fromARGB(255, 196, 224, 143),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              AppIcon(
                title: title,
                icon: icon,
                iconSize: 50.0
              )
            ],
          ),
        ),
      ),
    );
  }
}