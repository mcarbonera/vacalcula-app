import 'package:flutter/material.dart';
import 'package:vacalcula/widgets/pages/page_state.dart';

class NotImplemented extends StatelessWidget {
  const NotImplemented({super.key, required this.paginaAtual});

  final PageState paginaAtual;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Not yet Implemented - ${paginaAtual.name}'),
    );
  }
}