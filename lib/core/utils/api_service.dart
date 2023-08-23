import 'package:dio/dio.dart';
import 'package:whats_for_tonight/features/home/data/models/show/show.dart';

class ApiService {
  final _baseUrl = 'https://moviesdatabase.p.rapidapi.com';
  final Dio _dio;

  ApiService(this._dio);
  Future<Map<String, dynamic>> get(
      {Map<String, dynamic>? qParams, required String endPoint}) async {
    setHeaders();
    var respone =
        await _dio.get('$_baseUrl$endPoint', queryParameters: qParams);
    return respone.data;
  }

  Future<Map<String, dynamic>> search(
      {Map<String, dynamic>? qParams, required String showName}) async {
    setHeaders();
    var respone = await _dio.get('$_baseUrl/titles/search/title/$showName',
        queryParameters: {'exact': 'Do not include in request', 'limit': 40});
    return respone.data;
  }

  Future<Show> searchById({required String id}) async {
    setHeaders();
    var response = await _dio.get('$_baseUrl/titles/$id');
    return response.data;
  }

  Future<Map<String, dynamic>> getDetails({required id}) async {
    var respone =
        await _dio.get('https://www.omdbapi.com/?apikey=eeb0cbc1&i=$id');
    return respone.data;
  }

  void setHeaders() {
    _dio.options.headers['X-RapidAPI-Key'] =
        '3cd3e5ad44msh3ef0964c11a79a7p10cb35jsn40763f18fa41';
    _dio.options.headers['X-RapidAPI-Host'] = 'moviesdatabase.p.rapidapi.com';
  }
}
