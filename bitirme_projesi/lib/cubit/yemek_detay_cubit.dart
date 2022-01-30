import 'package:bitirme_projesi/repo/yemekler_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class YemekDetayCubit extends Cubit<void>{
  YemekDetayCubit():super(0);

  var repo = YemeklerRepo();

  Future<void> sepeteEkleme(String yemek_adi, String yemek_resim_adi, String yemek_fiyat, String yemek_siparis_adet, String kullanici_adi) async{
    await repo.sepeteEkle(yemek_adi, yemek_resim_adi, yemek_fiyat, yemek_siparis_adet, kullanici_adi);

  }
}