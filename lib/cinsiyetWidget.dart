import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';

class CinsiyetWidget extends StatelessWidget {
  final IconData? cinsiyet;
  final Color? iconColor;
  final String cinsiyetText;
  final Color? textColor;

  const CinsiyetWidget({
    Key? key,
    this.cinsiyet = FontAwesomeIcons.venus,
    this.cinsiyetText = "Kadın",
    this.iconColor,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          cinsiyet,
          color: iconColor ?? Colors.pink,
          size: 50,
        ),
        Text(
          cinsiyetText,
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 25, color: textColor),
        ),
      ],
    );
  }
}
