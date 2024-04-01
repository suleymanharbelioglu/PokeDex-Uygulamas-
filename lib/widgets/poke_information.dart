import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:v201/constants/constants.dart';
import 'package:v201/constants/ui_helper.dart';
import 'package:v201/model/pokemon_model.dart';

class PokeInformation extends StatelessWidget {
  final PokemonModel pokemon;
  const PokeInformation({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10.w)),
        color: Colors.white,
      ),
      child: Padding(
        padding: UIHelper.getDefultPadding(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildInformationRow("Name", pokemon.name),
            _buildInformationRow("Height", pokemon.height),
            _buildInformationRow("Weight", pokemon.weight),
            _buildInformationRow("Spam Time", pokemon.spawnTime),
            _buildInformationRow("Weakness", pokemon.weaknesses),
            _buildInformationRow("Pre Evolution", pokemon.prevEvolution),
            _buildInformationRow("Next Evolution", pokemon.nextEvolution),
          ],
        ),
      ),
    );
  }

  _buildInformationRow(String label, dynamic value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: Constants.getPokeInfoLabelTextStyle(),
        ),
        if (value is List && value.isNotEmpty)
          Text(value.join(" , "), style: Constants.getPokeInfoTextStyle())
        else if (value == null)
          Text("Not avaible", style: Constants.getPokeInfoTextStyle())
        else
          Text(value.toString(), style: Constants.getPokeInfoTextStyle()),
      ],
    );
  }
}
