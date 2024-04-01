import 'package:flutter/material.dart';
import 'package:v201/widgets/app_title.dart';
import 'package:v201/widgets/pokemon_list_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrientationBuilder(
        builder: (context, orientation) => Column(
          children: [
            AppTitle(),
            Expanded(child: PokemonList()),
          ],
        ),
      ),
    );
  }
}
