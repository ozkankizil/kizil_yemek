import 'package:bitirme_projesi/cubit/yemek_detay_cubit.dart';
import 'package:bitirme_projesi/entity/sepet_yemekler.dart';
import 'package:bitirme_projesi/entity/yemekler.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SepetYemekDetay extends StatefulWidget {
  SepetYemekler yemek;
  SepetYemekDetay({required this.yemek});

  @override
  _SepetYemekDetayState createState() => _SepetYemekDetayState();
}

class _SepetYemekDetayState extends State<SepetYemekDetay> {
  var adet = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.yemek.yemek_adi),),
      body: Center(
        child: Column(
          children: [
            Text(widget.yemek.yemek_adi),
            Image.network("http://kasimadalan.pe.hu/yemekler/resimler/${widget.yemek.yemek_resim_adi}"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: (){
                    setState(() {
                      adet-=1;
                    });
                  },
                  child: Icon(
                    Icons.remove,
                    color: Colors.black,
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.yellowAccent),
                  ),
                ),
                Text("$adet", style: TextStyle(fontSize: 20),),
                ElevatedButton(
                  onPressed: (){
                    setState(() {
                      adet+=1;
                    });
                  },
                  child: Icon(
                    Icons.add,
                    color: Colors.black,
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.yellowAccent),
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: (){
                context.read<YemekDetayCubit>().sepeteEkleme(widget.yemek.yemek_adi, widget.yemek.yemek_resim_adi, widget.yemek.yemek_fiyat, adet.toString(), "ozkankizil");
              },
              child: Icon(
                Icons.shopping_bag_sharp,
                color: Colors.black,
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.yellowAccent),
              ),
            ),


          ],
        ),
      ),
    );
  }
}
