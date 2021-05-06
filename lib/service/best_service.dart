import 'package:mobile_project/bloc/authen/authen_bloc.dart';
import 'package:dio/dio.dart';

class BaseService {
  String _baseUrl;
  AuthenBloc _authenBloc;
  String _token;
  final Dio _client = Dio();
  final Dio _clientSecondary = Dio();

  void initial({AuthenBloc authenBloc}) {
    _baseUrl =
        'http://selab.mfu.ac.th:9001/download?bucket=mobdev62&filename=6231305014'; // TODO: Get url from config
    _authenBloc = authenBloc;
    // _baseUrl = FlutterConfig.get(Constants.key_endpoint_service);
    setupClient(_client, baseUrl: _baseUrl);
    setupClient(_clientSecondary, baseUrl: _baseUrl);
  }

  void setupClient(
    Dio client, {
    String baseUrl,
    int connectTimeout = 60000,
    int receiveTimeout = 60000,
    int sendTimeout = 30000,
  }) {
    client.options.baseUrl = baseUrl;
    client.options.connectTimeout = connectTimeout;
    client.options.receiveTimeout = receiveTimeout;
    client.options.sendTimeout = sendTimeout;
  }

  Future<Response<T>> get<T>(String url, {String auth}) {
    Options options = Options(
        contentType: Headers.jsonContentType,
        headers: {'Authorization': 'Bearer $auth'});
    return _client.get<T>(url, options: options);
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
    if (_token != null) {
      options.headers['Authorization'] = 'Bearer ${_token}';
    }

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
    int code = e.response?.statusCode;
    return code;
  }
}
