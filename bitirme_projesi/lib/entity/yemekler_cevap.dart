import 'package:bitirme_projesi/entity/yemekler.dart';

class YemeklerCevap{
  List<Yemekler> yemeklerListesi;
  int success;

  YemeklerCevap({
    required this.yemeklerListesi,
    required this.success
  });
  factory YemeklerCevap.fromJson(Map<String, dynamic> json){
    var jsonArray = json["yemekler"] as List;
    List<Yemekler> yemeklerListesi = jsonArray.map((jsonArrayNesnesi) => Yemekler.fromJson(jsonArrayNesnesi)).toList();
    return YemeklerCevap(yemeklerListesi: yemeklerListesi, success: json["success"] as int);
  }
}