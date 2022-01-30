import 'package:bitirme_projesi/cubit/anasayfa_cubit.dart';
import 'package:bitirme_projesi/views/yemek_detay.dart';
import 'package:flutter/material.dart';
import 'package:bitirme_projesi/entity/yemekler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Anasayfa extends StatefulWidget {
  @override
  _AnasayfaState createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  bool aramaYapiliyorMu = false;
  final images = [
    'banner1.png',
    'banner2.png'
  ];
  bool bannerIndex = true;

  @override
  void initState() {
    super.initState();
    context.read<AnasayfaCubit>().yemekleriYukle();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text("Kızıl Yemek",
              style: TextStyle(
                fontSize: 35,
                fontStyle: FontStyle.italic,
                color: Colors.yellowAccent
            ),
            )
          ),
          GestureDetector(
              onPanUpdate: (details) {
                if (details.delta.dx > 0) {
                  setState(() {
                    bannerIndex = true;
                  });
                }
                if (details.delta.dx < 0) {
                  setState(() {
                    bannerIndex = false;
                  });
                }
              },
              child: bannerIndex ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset('images/banner1.png',
                  ),
                ),
              )

              : Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset('images/banner2.png',
                  ),
                ),
              )
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(height: 8, width: 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: bannerIndex ? Colors.black
                        : Colors.grey
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(height: 8, width: 8,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: bannerIndex ? Colors.grey
                          : Colors.black
                  ),
                ),
              ),
            ],
          ),
          Flexible(
            child: BlocBuilder<AnasayfaCubit, List<Yemekler>>(
              builder: (context,yemeklerListesi){
                if(yemeklerListesi.isNotEmpty){
                  return ListView.builder(
                    itemCount: yemeklerListesi.length,
                    itemBuilder: (context, indeks){
                      var yemek = yemeklerListesi[indeks];
                      return Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 10),
                        child: GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => YemekDetay(yemek: yemek,)));
                          },
                          child: Card(
                            elevation: 0,
                            child: SizedBox(height: 70,
                              child: Row(
                                children: [
                                  Hero(
                                    tag: yemek.yemek_adi,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10.0),
                                      child: Image.network(
                                          "http://kasimadalan.pe.hu/yemekler/resimler/${yemek.yemek_resim_adi}",
                                        height: 200.0, width: 100.0,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5.0),
                                    child: Text("${yemek.yemek_adi}",
                                      style: const TextStyle(fontSize: 17,
                                          fontFamily: "FiraSans"
                                      ),
                                    ),
                                  ),
                                  const Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0, right: 10),
                                    child: Text("₺ ${yemek.yemek_fiyat},00",
                                    style: const TextStyle(
                                        fontSize: 16,
                                      color: Colors.green,
                                      fontFamily: "FiraSans"
                                    ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ElevatedButton(
                                      onPressed: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => YemekDetay(yemek: yemek,)));
                                      },
                                      child: const Icon(
                                        Icons.add,
                                        color: Colors.black,
                                      ),
                                      style: ButtonStyle(
                                        backgroundColor: MaterialStateProperty.all(Colors.yellowAccent),
                                      ),
                                    ),
                                  ),

                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }else{
                  return const Center(
                    child: Text("Liste alınamadı!"),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );

  }
}
