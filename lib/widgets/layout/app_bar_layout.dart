import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:vacalcula/widgets/pages/page_controller.dart';
import 'package:vacalcula/widgets/pages/page_state.dart';

class AppBarLayout extends StatefulWidget implements PreferredSizeWidget {
  const AppBarLayout({super.key});

  @override
  State<StatefulWidget> createState() => _AppBarLayout();

  @override
  Size get preferredSize => const Size.fromHeight(60);
}

class _AppBarLayout extends State<AppBarLayout> {

  var navController = Get.find<PageNavController>();

  @override
  PreferredSizeWidget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: Obx(() => 
        Container(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Row(
            children: resolveContent()
          ),
        )
      ),
    );
  }

  List<Widget> resolveContent() {
    Widget? icone = resolveIcon();
    if(icone == null) {
      return [
        const Text("Vacalcula")
      ];
    }
    return [
      icone,
      Text(getTitleText())
    ];
  }

  String getTitleText() => switch(navController.page) {
    PageState.home => "Vacalcula",
    PageState.pasto => "Pasto",
    PageState.bovinos => "Bovinos",
    PageState.medicamentos => "Medicamentos",
    PageState.prenhez => "Prenhez",
  };

  Widget? resolveIcon() {
    if(navController.page == PageState.home) {
      return null;
    } else {
      return Container(
        padding: const EdgeInsets.only(top: 7.0),
        child: IconButton(
          icon: Icon(
            FontAwesomeIcons.arrowLeft,
            size: 20.0,
            color: Theme.of(context).colorScheme.primary,
          ),
          onPressed: () => {navController.navigate(PageState.home)}
        ),
      );
    }
  }
}