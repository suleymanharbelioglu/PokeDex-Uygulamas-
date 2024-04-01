import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:v201/constants/ui_helper.dart';
import 'package:v201/model/pokemon_model.dart';
import 'package:v201/widgets/poke_information.dart';
import 'package:v201/widgets/poke_type_name.dart';

class DetailPage extends StatelessWidget {
  final PokemonModel pokemon;
  const DetailPage({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    String pokeballImageUrl = "images/pokeball.png";

    return (ScreenUtil().orientation == Orientation.portrait)
        ? _buildPortraitBody(context, pokeballImageUrl)
        : _buildLandScapeBody(context, pokeballImageUrl);
  }

  Scaffold _buildLandScapeBody(BuildContext context, String pokeballImageUrl) {
    return Scaffold(
      backgroundColor: UIHelper.getColorFromType(pokemon.type![0]),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: UIHelper.getIconPadding(),
              child: IconButton(
                iconSize: 24.w,
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(Icons.arrow_back_ios),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        PokeTypeName(pokemon: pokemon),
                        Expanded(
                          child: Hero(
                            tag: pokemon.img!,
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: CachedNetworkImage(
                                imageUrl: pokemon.img!,
                                height: 0.25.sw,
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                      flex: 5,
                      child: Padding(
                        padding: UIHelper.getDefultPadding(),
                        child: PokeInformation(pokemon: pokemon),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Scaffold _buildPortraitBody(BuildContext context, String pokeballImageUrl) {
    return Scaffold(
      backgroundColor: UIHelper.getColorFromType(pokemon.type![0]),
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: UIHelper.getIconPadding(),
            child: IconButton(
              iconSize: 24.w,
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.arrow_back_ios),
            ),
          ),
          PokeTypeName(pokemon: pokemon),
          SizedBox(
            height: 20.h,
          ),
          Expanded(
              child: Stack(
            children: [
              Positioned(
                right: 0,
                top: 0,
                child: Image.asset(
                  pokeballImageUrl,
                  height: 0.15.sh,
                  fit: BoxFit.fitHeight,
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                top: 0.12.sh,
                child: PokeInformation(pokemon: pokemon),
              ),
              Hero(
                tag: pokemon.img!,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: CachedNetworkImage(
                    imageUrl: pokemon.img!,
                    height: 0.25.sh,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ],
          )),
        ],
      )),
    );
  }
}
