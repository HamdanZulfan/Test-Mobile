import 'package:dio/dio.dart';
import 'package:test_flutter/models/data_model.dart';

class RequestData {
  final String baseUrl = 'https://reqres.in/api/users';
  final Dio dio = Dio();

  Future fetchData() async {
    try {
      final response = await dio.get(baseUrl);
      if (response.statusCode == 200) {
        final Data datas = Data.fromJson(response.data);
        return response.data;
      } else {
        return;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future createData({
    required String name,
    required String job,
  }) async {
    try {
      final Response response = await dio.post(
        '$baseUrl/4',
        data: {
          'name': name,
          'job': job,
        },
      );

      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future updateData({
    required String name,
    required String job,
  }) async {
    try {
      final Response response = await dio.put('$baseUrl/4', data: {
        'name': name,
        'job': job,
      });

      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future deleteData() async {
    try {
      final Response response = await dio.delete('$baseUrl/4');

      return response.data;
    } catch (e) {}
  }
}
