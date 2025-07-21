import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_pharmacy/layout/pharmacy_app/dio_helper_pharmacy/dio_helper_pharmacy.dart';
import 'package:my_pharmacy/modules/register_screen/cubit/states.dart';
import 'package:my_pharmacy/modules/register_screen/pharmacy_models/pharmacy_login_model.dart';
import 'package:my_pharmacy/shared/network/remote/end_points.dart';

class PharmacyLoginCubit extends Cubit<PharmacyLoginStetes>
{
  PharmacyLoginCubit() : super(LoginInitialState());

  static PharmacyLoginCubit get(context) => BlocProvider.of(context);

  PharmacyLoginModel loginModel = PharmacyLoginModel();

  void userLogin({
    required String email,
    required String password,
})
  {
    emit(LoginLoadingState());

    DioHelperPharmacy.postData(
        url: 'http://192.168.43.222:5000/login',
        data: {
          'email' : email,
          'password' : password,
        },
        query: {},).then((value)
    {
      print(value.data);
      loginModel = PharmacyLoginModel.fromJson(value.data);
      emit(LoginSuccessState(loginModel));
      }).catchError((error)
    {
      emit(LoginErrorState(error.toString()));
      print('Error: $error');
    });
  }
}