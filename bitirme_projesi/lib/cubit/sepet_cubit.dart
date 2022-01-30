import 'package:bitirme_projesi/entity/sepet_yemekler.dart';
import 'package:bitirme_projesi/repo/yemekler_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SepetCubit extends Cubit<List<SepetYemekler>>{
  SepetCubit():super(<SepetYemekler>[]);
  var repo = YemeklerRepo();
  var s = 0;

  Future <void> sepettekiYemekleriYukle() async {
    var liste = await repo.tumSepet("ozkankizil");

    if(liste.length==0){
      emit([]);
    }else{
      for (var i = 0; i < liste.length; i++) {
        for(var j = 0; j < liste.length; j++){
          if(i!=j){
            if (liste[i].yemek_adi == liste[j].yemek_adi) {
              s++;
              liste[i].yemek_siparis_adet =
                  (int.parse(liste[i].yemek_siparis_adet)
                      + int.parse(liste[j].yemek_siparis_adet)).toString();

              liste.remove(liste[j]);
              if(s!=0){
                i=0;
                j=0;
              }
            }
          }
        }
      }
      if(liste.length!=0){
        emit(liste);
      }else{
        emit([]);
      }
    }
  }
  Future<void> sepetiBosalt() async{
    var liste = await repo.tumSepet("ozkankizil");
    for(var i = 0; i<liste.length; i++) {
      await repo.sepettenSil(liste[i].sepet_yemek_id, "ozkankizil");

    }
    emit([]);

  }
  Future<void> yemekSil(String yemek_adi) async{
    var liste = await repo.tumSepet("ozkankizil");
    if(liste.isNotEmpty){
      for(var i = 0; i<liste.length; i++) {
        if(liste[i].yemek_adi == yemek_adi){
          await repo.sepettenSil(liste[i].sepet_yemek_id, "ozkankizil");
        }
      }
      sepettekiYemekleriYukle();
    }else{
      emit([]);
    }

  }
  Future<void> sepeteEkleme(String yemek_adi, String yemek_resim_adi, String yemek_fiyat, String yemek_siparis_adet, String kullanici_adi) async{
    await repo.sepeteEkle(yemek_adi, yemek_resim_adi, yemek_fiyat, yemek_siparis_adet, kullanici_adi);

  }

  Future <void> adetEksiltme(String yemek_adi) async {
    var liste = await repo.tumSepet("ozkankizil");
    var y = 0;
    var yemek_resim_adi = "";
    var yemek_fiyat = "";
    for(var i = 0; i<liste.length; i++){
      if(liste[i].yemek_adi==yemek_adi){
        y += int.parse(liste[i].yemek_siparis_adet);
        yemek_resim_adi = liste[i].yemek_resim_adi;
        yemek_fiyat = liste[i].yemek_fiyat;
      }
    }
    if(liste.length>1){
      if(y>1){
        yemekSil(yemek_adi);
        sepeteEkleme(yemek_adi, yemek_resim_adi, yemek_fiyat, (y-1).toString(), "ozkankizil");
      }else{
        yemekSil(yemek_adi);
      }
    }else{
      if(y>1){
        yemekSil(yemek_adi);
        sepeteEkleme(yemek_adi, yemek_resim_adi, yemek_fiyat, (y-1).toString(), "ozkankizil");
      }else{
        sepetiBosalt();
      }
    }







  }

}
