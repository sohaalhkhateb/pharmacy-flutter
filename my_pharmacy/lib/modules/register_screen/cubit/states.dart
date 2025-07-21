import '../pharmacy_models/pharmacy_login_model.dart';

abstract class PharmacyLoginStetes {}
class LoginInitialState extends PharmacyLoginStetes {}

class LoginLoadingState extends PharmacyLoginStetes {}

class LoginSuccessState extends PharmacyLoginStetes
{
  final PharmacyLoginModel loginModel;

  LoginSuccessState(this.loginModel);
}

class LoginErrorState extends PharmacyLoginStetes
{
  final String Error;

  LoginErrorState(this.Error);
}