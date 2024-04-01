import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:v201/constants/constants.dart';
import 'package:v201/constants/ui_helper.dart';
import 'package:v201/model/pokemon_model.dart';
import 'package:v201/pages/detail_page.dart';
import 'package:v201/widgets/poke_img_and_ball.dart';

class PokeListItem extends StatelessWidget {
  const PokeListItem({super.key, required this.pokemon});
  final PokemonModel pokemon;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => DetailPage(pokemon: pokemon),
        ));
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.w),
        ),
        elevation: 3,
        shadowColor: Colors.white,
        color: UIHelper.getColorFromType(pokemon.type![0]),
        child: Padding(
          padding: UIHelper.getDefultPadding(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                pokemon.name.toString(),
                style: Constants.getPokemonNameTextStyle(),
              ),
              Chip(
                  label: Text(
                pokemon.type![0].toString(),
                style: Constants.getTypeChipTextStyle(),
              )),
              Expanded(child: PokeImgAndBall(pokemon: pokemon)),
            ],
          ),
        ),
      ),
    );
  }
}
