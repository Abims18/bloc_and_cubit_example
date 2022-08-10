import 'package:bloc_sample/model/response_model.dart';
import 'package:dio/dio.dart';

class SampleProvider {

  Future<ResponseModel> fetchData() async {
    try {
      final response = await Dio().get('https://reqres.in/api/users/2');

      if (response.statusCode == 200) {
        print(response.data);
        ResponseModel itemList = ResponseModel.fromJson(response.data);
        return itemList;
      } else {
        throw Exception('Failed to load album');
      }
    } catch (e, s) {
      print(e);
      print(s);
      return ResponseModel();
    }
  }
}