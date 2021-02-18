import 'package:flutter/material.dart';
import 'package:programlama_dili_uygulamasi/Diller.dart';
import 'package:programlama_dili_uygulamasi/main.dart';

class DetaySayfa extends StatefulWidget {
  Diller dil;

  DetaySayfa({this.dil});

  @override
  _DetaySayfaState createState() => _DetaySayfaState();
}

class _DetaySayfaState extends State<DetaySayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.dil.dil_adi),
      ),
      body: Center(
        child: Column(
          children: [
            Image.asset(
              "resimler/${widget.dil.dil_resim_adi}",
            ),
            Text(
              "${widget.dil.cikis_yili}",
              style: TextStyle(fontSize: 45, color: Colors.blueAccent),
            ),
            SizedBox(
              width: 200,
              height: 50,
              child: RaisedButton(
                child: Text("GERİ DÖN"),
                color: Colors.pink,
                textColor: Colors.white,
                onPressed: () {
                  Navigator.of(context).popUntil((route) => route.isFirst);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
