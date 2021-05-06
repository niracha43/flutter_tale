import 'package:mobile_project/bloc/authen/authen_bloc.dart';
import 'package:mobile_project/service/auth_service.dart';

class Service {
  AuthService _authService;
  static Service _instance;
  Service._init();

  factory Service() {
    if (_instance == null) {
      _instance = Service._init();
    }
    return _instance;
  }

  void initialize({AuthenBloc authenBloc}) {
    _instance._authService = AuthService()..initialize(authenBloc: authenBloc);
    // _instance._meService = MeService()..initial(authenBloc: authenBloc);
  }
}
