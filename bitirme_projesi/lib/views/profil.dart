import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Profil extends StatefulWidget {
  const Profil({Key? key}) : super(key: key);

  @override
  _ProfilState createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text("Profil",
                style: TextStyle(
                    fontSize: 35,
                    fontStyle: FontStyle.italic,
                    color: Colors.yellowAccent),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                  width: 80.0,
                  height: 80.0,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(
                            "images/profil.jpg",)
                      )
                  )
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text("Özkan KIZIL", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10, top: 15),
              child: Container(
                  width: double.maxFinite,
                  height: 50.0,
                decoration: const BoxDecoration(
                    color: Color(0xffE0DFF0),
                    borderRadius: BorderRadius.all(
                      Radius.circular(15.0),
                    )
              ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: const [
                      Icon(Icons.person),
                      Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Text("Kişisel Bilgiler"),
                      ),
                    ],
                  ),
                ),
              ),
            ),Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10, top: 15),
              child: Container(
                width: double.maxFinite,
                height: 50.0,
                decoration: const BoxDecoration(
                    color: Color(0xffE0DFF0),
                    borderRadius: BorderRadius.all(
                      Radius.circular(15.0),
                    )
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: const [
                      Icon(Icons.where_to_vote),
                      Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Text("Adreslerim"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10, top: 15),
              child: Container(
                width: double.maxFinite,
                height: 50.0,
                decoration: const BoxDecoration(
                    color: Color(0xffE0DFF0),
                    borderRadius: BorderRadius.all(
                      Radius.circular(15.0),
                    )
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: const [
                      Icon(Icons.workspaces_outline),
                      Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Text("Favori Yemeklerim"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10, top: 15),
              child: Container(
                width: double.maxFinite,
                height: 50.0,
                decoration: const BoxDecoration(
                    color: Color(0xffE0DFF0),
                    borderRadius: BorderRadius.all(
                      Radius.circular(15.0),
                    )
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: const [
                      Icon(Icons.workspaces_filled),
                      Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Text("Geçmiş Siparişlerim"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10, top: 15),
              child: Container(
                width: double.maxFinite,
                height: 50.0,
                decoration: const BoxDecoration(
                    color: Color(0xffE0DFF0),
                    borderRadius: BorderRadius.all(
                      Radius.circular(15.0),
                    )
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: const [
                      Icon(Icons.help),
                      Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Text("Yardım"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10, top: 15),
              child: Container(
                width: double.maxFinite,
                height: 50.0,
                decoration: const BoxDecoration(
                    color: Color(0xffE0DFF0),
                    borderRadius: BorderRadius.all(
                      Radius.circular(15.0),
                    )
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: const [
                      Icon(Icons.settings),
                      Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Text("Ayarlar"),
                      ),
                    ],
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
