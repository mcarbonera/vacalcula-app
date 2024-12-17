import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vacalcula/widgets/pages/page_controller.dart';

class AppIcon extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AppIcon(title: title, icon: icon, iconSize: iconSize);

  AppIcon({
    super.key,
    required this.title,
    required this.icon,
    this.iconSize = 0.0,
  });

  final String title;
  final IconData icon;
  double iconSize;
}

class _AppIcon extends State<AppIcon> {
  _AppIcon({
    required this.title,
    required this.icon,
    required this.iconSize,
  });

  final String title;
  final IconData icon;
  final double iconSize;

  PageNavController paginaAtual = Get.find<PageNavController>();

  @override
  Widget build(BuildContext context) {
    var labelWidget = resolveLabel(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: labelWidget==null ? [
        Obx(() => resolveIcon(context))
      ] : [
        resolveIcon(context),
        labelWidget
      ]
    );
  }

  Widget resolveIcon(BuildContext context) {
    if(iconSize == 0.0) {
      return Icon(
        icon,
        size: 20.0,
        color: verifySelected() ? const Color.fromARGB(255, 103, 155, 20) : Theme.of(context).colorScheme.primary,
      );
    } else {
      return Icon(
        icon,
        size: 50.0,
        color: Theme.of(context).colorScheme.primary,
      );
    }
  }

  bool verifySelected() {
    if(title.toLowerCase() == paginaAtual.page.name) {
      return true;
    }
    return false;
  }

  Widget? resolveLabel(BuildContext context) {
    if(iconSize == 0.0) {
      return null;
    } else {
      return Text(title, style: Theme.of(context).textTheme.titleMedium);
    }
  }
}