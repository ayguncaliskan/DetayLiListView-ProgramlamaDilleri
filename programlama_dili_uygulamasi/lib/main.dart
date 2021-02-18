import 'package:flutter/material.dart';
import 'package:programlama_dili_uygulamasi/DetaySayfa.dart';

import 'Diller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

Future<List<Diller>> dilleriGetir() async{
var Dillistesi =List<Diller>();

var d1=Diller(1, "Python", "pngegg.png",1991);
var d2=Diller(2, "C++", "pngegg1.png",1983);
var d3=Diller(3, "C#", "pngegg2.png",2000);
var d4=Diller(4, "Java", "pngegg3.png",1995);
var d5=Diller(5, "Javascript", "pngegg4.png",1995);
var d6=Diller(6, "Php", "pngegg5.png",1995);
var d7=Diller(7, "Dart", "pngegg6.png",2013);
Dillistesi.add(d1);
Dillistesi.add(d2);
Dillistesi.add(d3);
Dillistesi.add(d4);
Dillistesi.add(d5);
Dillistesi.add(d6);
Dillistesi.add(d7);
return Dillistesi;
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Programlama Dilleri"),
      ),
      body: FutureBuilder<List<Diller>>(
        future: dilleriGetir(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            var Dillistesi =snapshot.data;
            return ListView.builder(
              itemCount: Dillistesi.length,
              itemBuilder: (context,indeks){
                 var dil = Dillistesi[indeks];
                 return GestureDetector(
                   onTap: (){
                     Navigator.push(context, MaterialPageRoute(builder: (context)=> DetaySayfa(dil: dil,) ));
                   },
                   child: Card(
                     child: Row(
                       children: [
                         SizedBox(width: 150,height: 150,
                           child: Image.asset(
                               "resimler/${dil.dil_resim_adi}",


                           ),
                         ),




                         Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Text(dil.dil_adi,style: TextStyle(fontSize: 25),),
                             SizedBox(height: 50,),
                             Text("${dil.cikis_yili}",style: TextStyle(fontSize: 25,color: Colors.blueAccent),),

                           ],
                         ),
                         Spacer(),
                         Icon(Icons.keyboard_arrow_right),
                       ],
                     ),
                   ),
                 );
              },
            );
          }
          else{
            return Center();
          }
        },
      ),

    );
  }
}
