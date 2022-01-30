import 'package:bitirme_projesi/entity/sepet_yemekler.dart';

class SepetYemeklerCevap{
  List<SepetYemekler> sepetYemeklerListesi;
  int success;

  SepetYemeklerCevap({
    required this.sepetYemeklerListesi,
    required this.success
  });
  factory SepetYemeklerCevap.fromJson(Map<String, dynamic> json){
    var jsonArray = json["sepet_yemekler"] as List;
    List<SepetYemekler> sepetYemeklerListesi = jsonArray.map((jsonArrayNesnesi) => SepetYemekler.fromJson(jsonArrayNesnesi)).toList();
    return SepetYemeklerCevap(sepetYemeklerListesi: sepetYemeklerListesi, success: json["success"] as int);
  }
}