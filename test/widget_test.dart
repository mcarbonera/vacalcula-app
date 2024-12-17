// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:vacalcula/main.dart';

void main() {

  void verificarTelaInicial() {
    expect(find.text('Vacalcula'), findsOneWidget);
    expect(find.text('Pasto'), findsExactly(1));
    expect(find.text('Bovinos'), findsExactly(1));
    expect(find.text('Medicamentos'), findsExactly(1));
    expect(find.text('Prenhez'), findsExactly(1));
  }

  void verificarNavegacao(String telaATestar) {
    expect(find.byIcon(FontAwesomeIcons.arrowLeft), findsOneWidget);
    var telas = ['Pasto', 'Bovinos', 'Medicamentos', 'Prenhez'];
    expect(find.text('Vacalcula'), findsNothing);
    for(var tela in telas) {
      if(telaATestar == tela) {
        expect(find.text(tela), findsOneWidget);
      } else {
        expect(find.text(tela), findsNothing);
      }
    }
  }

  testarNavegarParaTela(WidgetTester tester, String telaATestar) async {
    // Clica no botao:
    var cardParaClicar = find.text(telaATestar);
    await tester.tap(cardParaClicar);
    await tester.pump();
    
    // Verificar mudança de rota:
    verificarNavegacao(telaATestar);
    
    // Retornar para tela anterior
    await tester.tap(find.byIcon(FontAwesomeIcons.house));
    await tester.pump();
  }

  testWidgets('Verificar rotas', (WidgetTester tester) async {
    tester.view.devicePixelRatio = 1.0;
    tester.view.physicalSize = const Size(800,1200);
    addTearDown(tester.view.resetPhysicalSize);

    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verificar tela inicial:
    verificarTelaInicial();

    // Verificar Navegação para tela Pasto:
    await testarNavegarParaTela(tester, 'Pasto');
    verificarTelaInicial();
    // Verificar Navegação para tela Bovinos:
    await testarNavegarParaTela(tester, 'Bovinos');
    verificarTelaInicial();

    // Verificar Navegação para tela Medicamentos:
    await testarNavegarParaTela(tester, 'Medicamentos');
    verificarTelaInicial();
    // Verificar Navegação para tela Prenhez:
    await testarNavegarParaTela(tester, 'Prenhez');
    verificarTelaInicial();
  });
  
}
