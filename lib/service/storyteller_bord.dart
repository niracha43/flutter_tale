import 'package:dio/dio.dart';
import 'package:mobile_project/models/video.dart';

import 'best_service.dart';

class TellerService extends BaseService {
  final endpoint = "/auth";
  static TellerService _service;



  TellerService.Init();
  factory TellerService() {
    if (_service == null) {
      _service = TellerService.Init();
    }
    return _service;
  }

  void initialize() {
    super.initial();
  }

  // Future<TellerModel> getlist(String email, String password) async {
  //   Map<String, String> data = {'email': email, 'password': password};
  //   Response rs = await super.post('/profile.json', body: data);

  //   return TellerModel.fromMap(rs.data['data']);
  // }
  Future<List<VideoList>> getList(String jsonName) async {
    Response rs = await super.get(jsonName);
    return List<VideoList>.from(rs.data.map((d) => VideoList.fromJson(d)));
  }

  // Future<Auth> signup(String email, String password) async {
  //   Map<String, String> data = {
  //     'email': email,
  //     'password': password,
  //   };
  //   Response rs = await super.post('/register', body: data);
  //   return Auth.fromJson(rs.data['data']['info']);
  // }

  // Future<MainResult> signOut() async {
  //   Response rs = await super.post('/logout');
  //   return MainResult.fromJson(rs.data['data']);
  // }

}
