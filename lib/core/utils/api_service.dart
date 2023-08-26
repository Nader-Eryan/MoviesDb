import 'package:dio/dio.dart';

class ApiService {
  final _baseUrl = 'https://moviesdatabase.p.rapidapi.com';
  final Dio _dio;

  ApiService(this._dio);
  Future<Map<String, dynamic>> get(
      {Map<String, dynamic>? qParams, required String endPoint}) async {
    var respone =
        await _dio.get('$_baseUrl$endPoint', queryParameters: qParams);
    return respone.data;
  }

  Future<Map<String, dynamic>> search(
      {Map<String, dynamic>? qParams, required String showName}) async {
    var respone = await _dio.get('$_baseUrl/titles/search/title/$showName',
        queryParameters: {'exact': 'Do not include in request', 'limit': 12});
    return respone.data;
  }

  Future<Map<String, dynamic>> searchById({required String id}) async {
    var response = await _dio.get('$_baseUrl/titles/$id');
    return response.data;
  }

  void setHeaders() {
    _dio.options.headers['X-RapidAPI-Key'] =
        '3cd3e5ad44msh3ef0964c11a79a7p10cb35jsn40763f18fa41';
    _dio.options.headers['X-RapidAPI-Host'] = 'moviesdatabase.p.rapidapi.com';
  }
}
