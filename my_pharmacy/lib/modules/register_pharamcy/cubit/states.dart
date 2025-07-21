
import '../pharmacy_register_model.dart';

abstract class PharmacyRegisterStetes {}
class RegisterInitialState extends PharmacyRegisterStetes {}

class RegisterLoadingState extends PharmacyRegisterStetes {}

class RegisterSuccessState extends PharmacyRegisterStetes
{
  final PharmacyRegisterModel loginModel;

  RegisterSuccessState(this.loginModel);
}

class RegisterErrorState extends PharmacyRegisterStetes
{
  final String Error;

  RegisterErrorState(this.Error);
}