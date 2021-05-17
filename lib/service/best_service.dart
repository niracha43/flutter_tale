import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart';

class BaseService {
  String _baseUrl;
  final Dio _client = Dio();
  final Dio _clientSecondary = Dio();

  void initial() {
    _baseUrl = 'http://noy.chaiiya.info/json';
    // _baseUrl = FlutterConfig.get(Constants.key_endpoint_service);
    setupClient(_client, baseUrl: _baseUrl);
    setupClient(_clientSecondary, baseUrl: _baseUrl);

  }

  void setupClient(
    Dio client, {
    @required String baseUrl,
    int connectTimeout = 60000,
    int receiveTimeout = 60000,
    int sendTimeout = 30000,
  }) {
    client.options.baseUrl = baseUrl;
    client.options.connectTimeout = connectTimeout;
    client.options.receiveTimeout = receiveTimeout;
    client.options.sendTimeout = sendTimeout;
  }

  Future<Response<T>> get<T>(String url) {
    Options options = Options(contentType: Headers.jsonContentType);
    return _client.get<T>(url,
        options: options);


  }

  Future<Response<T>> put<T>(String url, {body, progress}) {
    Options options = Options(
        contentType: body is FormData
            ? Headers.formUrlEncodedContentType
            : Headers.jsonContentType);
    return _client.put<T>(url,
        data: body, options: options, onSendProgress: progress);
  }

  Future<Response<T>> post<T>(String url, {body, progress}) {
    Options options = Options(
        contentType: body is FormData
            ? Headers.formUrlEncodedContentType
            : Headers.jsonContentType);
    return _client.post(url,
        data: body, options: options, onSendProgress: progress);
  }

  Future<Response<T>> delete<T>(String url, {body}) {
    Options options = Options(
        contentType: body is FormData
            ? Headers.formUrlEncodedContentType
            : Headers.jsonContentType);
    return _client.delete(url, data: body, options: options);
  }

  dynamic onRequest(RequestOptions options) {
    // if (_token != null) {
    //   options.headers['Authorization'] = 'Bearer ${_token}';
    // }

    print(
        '''[${runtimeType.toString()}] Request => [${options.method}] ${options.uri}
      body: ${options.data},
    ''');
    return options;
  }

  dynamic onResponse(Response response) {
    return {"data": response.data};
  }

  dynamic onError(DioError e) async {
    int code = e.response.statusCode;
    return code;
  }
}
