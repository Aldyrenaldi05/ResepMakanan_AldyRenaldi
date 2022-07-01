import 'package:dio/dio.dart';
import 'package:resep_makanan/models/detail_resep_model.dart';
import 'package:resep_makanan/models/resep_model.dart';

class ResepService {
  //get list resep

  Future<ResepModel> getResep() async {
    var response = await Dio()
        .get('https://masak-apa-tomorisakura.vercel.app/api/recipes/1');
    print(response);
    return ResepModel.fromJson(response.data);
  }

  //get detail resep
  Future<DetailResepModel> getDetailResep({String? key}) async {
    var response = await Dio()
        .get('https://masak-apa-tomorisakura.vercel.app/api/recipe/$key');
    print(key);
    print("response : $response");
    return DetailResepModel.fromJson(response.data);
  }
}
