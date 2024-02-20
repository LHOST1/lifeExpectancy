import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/src/font_awesome_icon_class.dart';
import 'package:lifeexpectancy/cinsiyetWidget.dart';
import 'package:lifeexpectancy/customContainer.dart';
import 'package:lifeexpectancy/resultPage.dart';
import 'package:lifeexpectancy/user_data.dart';

class lifeExpectancy extends StatefulWidget {
  const lifeExpectancy({super.key});

  @override
  State<lifeExpectancy> createState() => _lifeExpectancyState();
}

class _lifeExpectancyState extends State<lifeExpectancy> {
  Color Buttonrenk = Colors.white;
  int durum = 3;
  int sigarasayisi = 0;
  int sporSayisi = 0;
  double boy = 1.70;
  double kilo = 70;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Center(
        child: Text("YAŞAM BEKLENTİSİ"),
      )),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(children: [
            Expanded(
              child: customContainer(
                child: BoyKilo("Boy"),
              ),
            ),
            Expanded(
              child: customContainer(
                child: BoyKilo("Kilo"),
              ),
            ),
          ]),
          Expanded(
              child: customContainer(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Haftada kaç gün spor yapıyorsunuz ?",
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  sporSayisi.toString(),
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54),
                ),
                sliderWidget(
                  sporSayisi.toDouble(),
                  0.0,
                  7.0,
                  (double newValue) {
                    setState(() {
                      sporSayisi = newValue.round();
                    });
                  },
                ),
              ],
            ),
          )),
          Expanded(
              child: customContainer(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                "Günde kaç adet sigara içiyorsunuz ?",
                style: TextStyle(fontSize: 18),
              ),
              Text(
                sigarasayisi.toString(),
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54),
              ),
              sliderWidget(
                sigarasayisi.toDouble(),
                0.0,
                30.0,
                (double newValue) {
                  setState(() {
                    sigarasayisi = newValue.round();
                  });
                },
              ),
            ]),
          )),
          Row(children: [
            Expanded(
              child: customContainer(
                child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        durum = 1;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: durum == 1
                          ? Buttonrenk = Colors.pink
                          : Buttonrenk = Colors.white,
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: CinsiyetWidget(
                      iconColor: durum == 1
                          ? Buttonrenk = Colors.white
                          : Buttonrenk = Colors.pink,
                      textColor: durum == 1
                          ? Buttonrenk = Colors.white
                          : Buttonrenk = Colors.pink,
                    )),
              ),
            ),
            Expanded(
              child: customContainer(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: durum == 2
                        ? Buttonrenk = Colors.blue
                        : Buttonrenk = Colors.white,
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      durum = 2;
                    });
                  },
                  child: CinsiyetWidget(
                    textColor: durum == 2
                        ? Buttonrenk = Colors.white
                        : Buttonrenk = Colors.blue,
                    cinsiyetText: "Erkek",
                    cinsiyet: FontAwesomeIcons.mars,
                    iconColor: durum == 2
                        ? Buttonrenk = Colors.white
                        : Buttonrenk = Colors.blue,
                  ),
                ),
              ),
            ),
          ]),
          ElevatedButton(
              style: ElevatedButton.styleFrom(minimumSize: Size(20, 40)),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultPage(
                            userData: UserData(
                                kilo: kilo,
                                boy: boy,
                                sporSayisi: sporSayisi,
                                sigarasayisi: sigarasayisi,
                                durum: durum))));
              },
              child: Text(
                "Hesapla",
              )),
        ],
      ),
    );
  }

  Row BoyKilo(String BoyKilo) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: RotatedBox(
            quarterTurns: 3,
            child: Text(
              BoyKilo,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        SizedBox(
          width: 5,
        ),
        Column(
          children: [
            SizedBox(
              height: 50, // Düğmelerin sığacağı yükseklik
              child: RotatedBox(
                quarterTurns: 3,
                child: OutlinedButton(
                  child: Center(child: Icon(FontAwesomeIcons.plus)),
                  onPressed: () {
                    setState(() {
                      if (BoyKilo == "Boy") {
                        boy = boy + 0.01;
                      } else {
                        kilo = kilo + 1;
                      }
                    });
                  },
                ),
              ),
            ),
            Text(
              BoyKilo == "Kilo" ? kilo.toString() : boy.toStringAsFixed(2),
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 50, // Düğmelerin sığacağı yükseklik
              child: RotatedBox(
                quarterTurns: 3,
                child: OutlinedButton(
                  child: Center(child: Icon(FontAwesomeIcons.minus)),
                  onPressed: () {
                    setState(() {
                      if (BoyKilo == "Boy") {
                        boy = boy - 0.01;
                      } else {
                        kilo = kilo - 1;
                      }
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Slider sliderWidget(
      double value, double min, double max, ValueChanged<double> onChanged) {
    return Slider(
      min: min,
      max: max,
      value: value,
      label: value.toString(),
      onChanged: onChanged,
    );
  }
}
