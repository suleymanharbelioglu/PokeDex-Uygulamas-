import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:v201/constants/ui_helper.dart';
import 'package:v201/model/pokemon_model.dart';

class PokeImgAndBall extends StatelessWidget {
  const PokeImgAndBall({super.key, required this.pokemon});
  final PokemonModel pokemon;
  @override
  Widget build(BuildContext context) {
    String pokeballImageUrl = "images/pokeball.png";

    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomRight,
          child: Image.asset(
            pokeballImageUrl,
            width: UIHelper.calculatePokeImgAndBallSize(),
            height: UIHelper.calculatePokeImgAndBallSize(),
            fit: BoxFit.fitHeight,
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Hero(
            tag: pokemon.img!,
            child: CachedNetworkImage(
              imageUrl: pokemon.img!,
              errorWidget: (context, url, error) => Icon(Icons.ac_unit),
              width: UIHelper.calculatePokeImgAndBallSize(),
              height: UIHelper.calculatePokeImgAndBallSize(),
              fit: BoxFit.fitHeight,
              placeholder: (context, url) => CircularProgressIndicator(
                color: UIHelper.getColorFromType(pokemon.type![0]),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
