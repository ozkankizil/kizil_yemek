import 'package:bitirme_projesi/entity/yemekler.dart';
import 'package:bitirme_projesi/repo/yemekler_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnasayfaCubit extends Cubit<List<Yemekler>>{
  AnasayfaCubit():super(<Yemekler>[]);

  var repo = YemeklerRepo();

  Future <void> yemekleriYukle() async {
    var liste = await repo.tumYemekler();
    emit(liste);
  }

}