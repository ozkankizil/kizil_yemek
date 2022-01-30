import 'package:bitirme_projesi/cubit/sepet_cubit.dart';
import 'package:bitirme_projesi/cubit/yemek_detay_cubit.dart';
import 'package:bitirme_projesi/entity/sepet_yemekler.dart';
import 'package:bitirme_projesi/views/sepet_yemek_detay.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Sepet extends StatefulWidget {
  @override
  _SepetState createState() => _SepetState();
}

class _SepetState extends State<Sepet> {
  var anaRenk = Colors.yellowAccent;
  var selectedItem;
  var tTutar = 0;
  bool ttc = false;

  @override
  void initState() {
    super.initState();
    context.read<SepetCubit>().sepettekiYemekleriYukle();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [

          Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text("Sepet",
                style: TextStyle(
                    fontSize: 35,
                    fontStyle: FontStyle.italic,
                    color: anaRenk
                ),
              )
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.0),),
                color: Colors.white70,
              ),
              height: 50,
              width: double.maxFinite,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    const Text("Adres: ", style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17
                    ),
                    ),
                    DropdownButton(

                      hint: Text("Adres Seçin"),
                      value: selectedItem,
                      items: ['Ev Adresim', 'İş'].map((String value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (nValue) {
                        setState(() {
                          selectedItem = nValue;
                        });
                      },
                    ),
                    Spacer(),
                    Text("Sepeti Boşalt", style: TextStyle(color: Colors.red),),
                    IconButton(
                        onPressed: (){
                          context.read<SepetCubit>().sepetiBosalt();
                          Fluttertoast.showToast(
                              msg: "Sepet Temizlendi.",
                              backgroundColor: Colors.greenAccent
                          );
                        },
                        icon: Icon(Icons.delete_forever, color: Colors.red,)
                    ),
                  ],
                ),
              ),
            ),
          ),
          Flexible(
            child: BlocBuilder<SepetCubit, List<SepetYemekler>>(
              builder: (context, sepettekiYemeklerListesi){
                if(sepettekiYemeklerListesi.isNotEmpty){
                  tTutar = 0;
                  ttc = true;
                  var liste = sepettekiYemeklerListesi;
                  for (var i = 0; i < liste.length; i++) {
                    tTutar += int.parse(liste[i].yemek_fiyat) * int.parse(liste[i].yemek_siparis_adet);
                  }
                  return ListView.builder(
                    itemCount: sepettekiYemeklerListesi.length,
                    itemBuilder: (context, indeks){
                      var yemek = sepettekiYemeklerListesi[indeks];
                      return Slidable(
                          key: UniqueKey(),
                            endActionPane: ActionPane(
                              motion: const BehindMotion(),
                              dismissible: DismissiblePane(
                                onDismissed: (){
                                  if(sepettekiYemeklerListesi.length>1){
                                    context.read<SepetCubit>().yemekSil(yemek.yemek_adi);
                                  }else{
                                    context.read<SepetCubit>().sepetiBosalt();
                                  }
                                },
                              ),
                              children: [
                                SlidableAction(
                                    onPressed: (context){
                                    if(sepettekiYemeklerListesi.length>1){
                                      context.read<SepetCubit>().yemekSil(yemek.yemek_adi);
                                    }else{
                                      context.read<SepetCubit>().sepetiBosalt();
                                    }
                                  },
                                  backgroundColor: Colors.red,
                                  foregroundColor: Colors.white,
                                  icon: Icons.delete,
                                  label: "Yemeği sil"
                                )
                              ],
                            ),
                            child:Padding(
                              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                              child: GestureDetector(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => SepetYemekDetay(yemek: yemek,)));

                                },
                                child: Card(
                                  elevation: 0,
                                  child: SizedBox(height: 110,
                                    child: Row(
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(10.0),
                                          child: Image.network(
                                            "http://kasimadalan.pe.hu/yemekler/resimler/${yemek.yemek_resim_adi}",
                                            height: 70.0, width: 70.0,
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(left: 10.0),
                                              child: Text("${yemek.yemek_adi}",
                                                style: const TextStyle(fontSize: 17,
                                                    fontFamily: "FiraSans"
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(left: 10.0),
                                              child: Text("₺ ${yemek.yemek_fiyat},00",
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.green,
                                                    fontFamily: "FiraSans"
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const Spacer(),
                                        Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: ElevatedButton(
                                                onPressed: (){
                                                  context.read<SepetCubit>().adetEksiltme(yemek.yemek_adi);
                                                },
                                                child: const Icon(
                                                  Icons.remove,
                                                  color: Colors.black,
                                                ),
                                                style: ButtonStyle(
                                                  backgroundColor: MaterialStateProperty.all(anaRenk),
                                                ),
                                              ),
                                            ),
                                            Text(yemek.yemek_siparis_adet,
                                              style: const TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: ElevatedButton(
                                                onPressed: (){
                                                  context.read<YemekDetayCubit>().sepeteEkleme(yemek.yemek_adi, yemek.yemek_resim_adi, yemek.yemek_fiyat, "1", "ozkankizil");
                                                  context.read<SepetCubit>().sepettekiYemekleriYukle();
                                                },
                                                child: const Icon(
                                                  Icons.add,
                                                  color: Colors.black,
                                                ),
                                                style: ButtonStyle(
                                                  backgroundColor: MaterialStateProperty.all(anaRenk),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),

                            ),
                        );

                    },
                  );
                }else{
                  ttc = false;
                  return Center(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.asset("images/sepet.jpg"),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(height: 60,),
                            const Text("Sepetin şu an boş!",
                              style: TextStyle(
                                  fontSize: 30,
                              color: Colors.white70),
                            ),
                          ],
                        ),
                      ],
                    )
                  );
                }
              },
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BlocBuilder<SepetCubit, dynamic>(
                  builder: (context, x){
                return Text("Toplam: ₺ ${ttc? tTutar : "0"},00",
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                );
              }),


              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child:  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.yellowAccent),
                    ),
                    onPressed: (){},
                    child: Row(mainAxisSize:MainAxisSize.min,
                        children:
                        const [
                          Text("Ödemeye Geç", style: TextStyle(fontSize: 17),),
                          SizedBox.square(dimension: 4),
                          Icon(Icons.arrow_forward_ios_sharp),
                        ]
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
