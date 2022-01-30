import 'package:bitirme_projesi/views/anasayfa.dart';
import 'package:bitirme_projesi/views/profil.dart';
import 'package:bitirme_projesi/views/sepet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnasayfaBottom extends StatefulWidget {
  const AnasayfaBottom({Key? key}) : super(key: key);

  @override
  _AnasayfaBottomState createState() => _AnasayfaBottomState();
}

class _AnasayfaBottomState extends State<AnasayfaBottom> {
  var anaRenk = Colors.yellowAccent;
  int secilenIndeks = 0;
  var sayfaListesi = [Anasayfa(), Sepet(), Profil()];



  @override
  Widget build(BuildContext context) {
    return Scaffold(


      body: sayfaListesi[secilenIndeks],


      bottomNavigationBar: BottomNavigationBar(

        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home,), label: "Anasayfa", ),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_sharp), label: "Sepet"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profil"),

        ],
        currentIndex: secilenIndeks,
        onTap: (index){
          setState(() {
            secilenIndeks = index;
          });
        },
        backgroundColor: Colors.white,
        selectedItemColor: anaRenk,
        unselectedItemColor: Colors.black,
      ),
    );
  }
}
