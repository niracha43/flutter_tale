import 'package:mobile_project/bloc/authen/authen_bloc.dart';
import 'package:mobile_project/service/auth_service.dart';
import 'package:mobile_project/service/storyteller_bord.dart';

class Service {
  AuthService _authService;
  TellerService _tellerService;
  static Service _instance;
  Service._init();

  factory Service() {
    if (_instance == null) {
      _instance = Service._init();
    }
    return _instance;
  }

  void initialize() {
    _instance._authService = AuthService()..initialize();
    _instance._tellerService = TellerService()..initial();
  }
}
