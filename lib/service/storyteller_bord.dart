import 'package:dio/dio.dart';
import 'package:mobile_project/bloc/authen/authen_bloc.dart';
import 'package:mobile_project/models/teller_model.dart';

import 'auth_service.dart';
import 'best_service.dart';

class TellerService extends BaseService {
  final endpoint = "/auth";
  static TellerService? _service;

  //final GoogleSignIn _googleSignIn = GoogleSignIn();
  // final FirebaseAuth _auth = FirebaseAuth.instance;

  TellerService.Init();
  factory TellerService() {
    if (_service == null) {
      _service = TellerService.Init();
    }
    return _service!;
  }

  void initialize({AuthenBloc? authenBloc}) {
    super.initial(authenBloc: authenBloc);
  }

  // Future<TellerModel> getlist(String email, String password) async {
  //   Map<String, String> data = {'email': email, 'password': password};
  //   Response rs = await super.post('/profile.json', body: data);

  //   return TellerModel.fromMap(rs.data['data']);
  // }
  Future<List<TellerModel>> getList(String jsonName) async {
    Response rs = await super.get(jsonName);
    return List<TellerModel>.from(rs.data.map((d) => TellerModel.fromJson(d)));
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
