import 'package:flutter/material.dart';
import 'package:lifeexpectancy/result.dart';
import 'package:lifeexpectancy/user_data.dart';

class ResultPage extends StatelessWidget {
  final UserData? userData;
  const ResultPage({super.key, this.userData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Sonuç"),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Expanded(
          flex: 8,
          child: Center(
            child: Text(
              "Beklenen Yaşam Süreniz=" +
                  Hesap(userData!).hesaplaOrtalamaYasamBeklentisi().toString(),
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: ElevatedButton(
            child: Text("Geri Dön"),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        )
      ]),
    );
  }
}
