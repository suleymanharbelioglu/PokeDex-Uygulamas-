import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:v201/model/pokemon_model.dart';
import 'package:v201/services/pokedex_api.dart';
import 'package:v201/widgets/pokelist_item.dart';

class PokemonList extends StatefulWidget {
  const PokemonList({super.key});

  @override
  State<PokemonList> createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  late Future<List<PokemonModel>> _pokemonListFuture;
  @override
  void initState() {
    _pokemonListFuture = PokeApi.getPokemonData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _pokemonListFuture,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          // return Center(
          //   child: Text("veri geldi"),
          // );
          List<PokemonModel> _listem = snapshot.data!;
          return GridView.builder(
            itemCount: _listem.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:
                    (ScreenUtil().orientation == Orientation.portrait ? 2 : 3)),
            itemBuilder: (context, index) {
              return PokeListItem(pokemon: _listem[index]);
            },
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text("hata oluştu"),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
