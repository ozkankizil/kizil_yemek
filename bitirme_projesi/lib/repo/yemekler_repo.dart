import 'package:bitirme_projesi/entity/sepet_yemekler.dart';
import 'package:bitirme_projesi/entity/yemekler.dart';
import 'package:bitirme_projesi/entity/yemekler_cevap.dart';
import 'package:bitirme_projesi/entity/sepet_yemekler_cevap.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class YemeklerRepo {

  List<Yemekler> parseYemeklerCevap(String cevap) {
    return YemeklerCevap.fromJson(json.decode(cevap)).yemeklerListesi;

  }
  List<SepetYemekler> parseSepetYemeklerCevap(String cevap) {
    if(cevap.isNotEmpty){
      return SepetYemeklerCevap.fromJson(json.decode(cevap)).sepetYemeklerListesi;
    }else{
      return [];
    }
  }

  Future<List<SepetYemekler>> tumSepet(String kullanici_adi) async {
    var url = Uri.parse("http://kasimadalan.pe.hu/yemekler/sepettekiYemekleriGetir.php");
    var veri = {"kullanici_adi": kullanici_adi};
    var cevap = await http.post(url, body: veri);
    if(cevap.body.isNotEmpty){
      return parseSepetYemeklerCevap(cevap.body);
    }else{
      return [];
    }
  }
  Future<void> sepettenSil(String sepet_yemek_id, String kullanici_adi) async {
    var url = Uri.parse("http://kasimadalan.pe.hu/yemekler/sepettenYemekSil.php");
    var veri = {"sepet_yemek_id": sepet_yemek_id.toString(), "kullanici_adi":kullanici_adi.toString()};
    var cevap = await http.post(url, body: veri);
    print("Sepetten sil: ${cevap.body}");
  }

  Future<List<Yemekler>> tumYemekler() async {
    var url = Uri.parse("http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php");
    var cevap = await http.get(url);

    return parseYemeklerCevap(cevap.body);
  }

  Future<void> sepeteEkle(String yemek_adi, String yemek_resim_adi, String yemek_fiyat, String yemek_siparis_adet, String kullanici_adi) async {
    var url = Uri.parse("http://kasimadalan.pe.hu/yemekler/sepeteYemekEkle.php");
    var veri = {"yemek_adi": yemek_adi, "yemek_resim_adi": yemek_resim_adi, "yemek_fiyat": yemek_fiyat, "yemek_siparis_adet": yemek_siparis_adet, "kullanici_adi": kullanici_adi};
    var cevap = await http.post(url, body: veri);
    print("Sepete ekleme: ${cevap.body}");
  }

}