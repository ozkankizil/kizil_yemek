import 'package:bitirme_projesi/cubit/yemek_detay_cubit.dart';
import 'package:bitirme_projesi/entity/yemekler.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class YemekDetay extends StatefulWidget {
  Yemekler yemek;
  YemekDetay({required this.yemek});

  @override
  _YemekDetayState createState() => _YemekDetayState();
}

class _YemekDetayState extends State<YemekDetay> {
  var adet = 1;
  bool ak = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.yemek.yemek_adi, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),backgroundColor: Colors.yellowAccent,),
        body: Center(
          child: Column(
            children: [
              Hero(
                tag: widget.yemek.yemek_resim_adi,
                  child: Image.network("http://kasimadalan.pe.hu/yemekler/resimler/${widget.yemek.yemek_resim_adi}")),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(widget.yemek.yemek_adi,
                  style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    color: Colors.green
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: (){
                      setState(() {
                        if(adet>1){
                          adet-=1;
                        }else {
                          null;
                        }

                      });
                      },
                    child: const Icon(
                      Icons.remove,
                      color: Colors.black,
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.yellowAccent),
                    ),
                  ),
                  Text("$adet", style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                  ElevatedButton(
                    onPressed: (){
                      setState(() {
                        adet+=1;
                      });
                    },
                    child: const Icon(
                      Icons.add,
                      color: Colors.black,
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.yellowAccent),
                    ),
                  ),
                ],
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
                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: TextField(
                  decoration: InputDecoration(
                  border: InputBorder.none,
                      labelText: 'Sipariş Notu',
                      hintText: 'Sipariş notunuz...'
                  ),
                ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: (){
                  context.read<YemekDetayCubit>().sepeteEkleme(widget.yemek.yemek_adi, widget.yemek.yemek_resim_adi, widget.yemek.yemek_fiyat, adet.toString(), "ozkankizil");
                  Fluttertoast.showToast(
                      msg: "Yemek Sepete Eklendi",
                    backgroundColor: Colors.greenAccent
                  );
                },
                child: const Icon(
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
