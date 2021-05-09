import 'package:dio/dio.dart';
import 'package:mobile_project/bloc/authen/authen_bloc.dart';
import 'package:mobile_project/models/profile_model.dart';
import 'package:mobile_project/service/best_service.dart';

class AuthService extends BaseService {
  final endpoint = "/auth";
  static AuthService _service;

  //final GoogleSignIn _googleSignIn = GoogleSignIn();
  // final FirebaseAuth _auth = FirebaseAuth.instance;

  AuthService.Init();
  factory AuthService() {
    if (_service == null) {
      _service = AuthService.Init();
    }
    return _service;
  }

  void initialize({AuthenBloc authenBloc}) {
    super.initial(authenBloc: authenBloc);
  }

  Future<Profile> signin(String email, String password) async {
    Map<String, String> data = {'email': email, 'password': password};
    Response rs = await super.post('/profile.json', body: data);

    return Profile.fromMap(rs.data['data']);
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
