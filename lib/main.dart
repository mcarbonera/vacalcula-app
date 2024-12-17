import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vacalcula/routes.dart';
import 'package:vacalcula/widgets/layout/app_bar_layout.dart';
import 'package:vacalcula/widgets/layout/bottom_nav_bar_layout.dart';
import 'package:vacalcula/widgets/layout/floating_action_button_layout.dart';
import 'package:vacalcula/widgets/pages/bovinos.dart';
import 'package:vacalcula/widgets/pages/home.dart';
import 'package:vacalcula/widgets/pages/not_implemented.dart';
import 'package:vacalcula/widgets/pages/page_controller.dart';
import 'package:vacalcula/widgets/pages/page_state.dart';
import 'package:vacalcula/widgets/styles/vacalcula_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Vacalcula',
      theme: VacalculaTheme.getTheme(),
      initialRoute: Routes.homeRoute,
      getPages: Routes.getPages()
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Usar estado como singleton.
  PageNavController paginaAtual = Get.put(PageNavController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarLayout(),
      body: PopScope(
        canPop: false,
        onPopInvokedWithResult: onPopInvoke,
        child: Obx(() => getCurrentWidget())
      ),
      bottomNavigationBar: BottomNavBarLayout(),
      floatingActionButton: const FloatingActionButtonLayout(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }

  Widget getCurrentWidget() => switch (paginaAtual.page) {
    PageState.home => Home(),
    PageState.pasto => NotImplemented(paginaAtual: paginaAtual.page),
    PageState.bovinos => Bovinos(),
    PageState.medicamentos => NotImplemented(paginaAtual: paginaAtual.page),
    PageState.prenhez => NotImplemented(paginaAtual: paginaAtual.page)
  };

  void onPopInvoke(bool didPop, Object? result) {
    if (didPop) {
      return;
    }
    if(paginaAtual.page != PageState.home) {
      paginaAtual.navigate(PageState.home);
    } else {
      exit(0);
    }
  }
}
