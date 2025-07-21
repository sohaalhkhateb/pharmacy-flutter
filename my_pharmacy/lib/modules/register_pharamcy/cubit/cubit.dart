import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_pharmacy/layout/pharmacy_app/dio_helper_pharmacy/dio_helper_pharmacy.dart';
import 'package:my_pharmacy/modules/register_pharamcy/cubit/states.dart';
import 'package:my_pharmacy/modules/register_pharamcy/pharmacy_register_model.dart';

class PharmacyRegisterCubit extends Cubit<PharmacyRegisterStetes>
{
  PharmacyRegisterCubit() : super(RegisterInitialState());

  static PharmacyRegisterCubit get(context) => BlocProvider.of(context);

  PharmacyRegisterModel registerModel = PharmacyRegisterModel();

  void userRegister({
    required String email,
    required String password,
    required String pharmacy_name,
    required String location,
    required String phone_number,
})
{
  emit(RegisterLoadingState());

  DioHelperPharmacy.postData(
      url: 'http://192.168.43.222:5000/signUp',
      query: {},
      data: {
        'email' : email,
        'password' : password,
        'pharmacy_name' : pharmacy_name,
        'location' : location,
        'phone_number' : phone_number,
      }).then((value)
      {
        print('Email: $email');
        print('Password: $password');
        print('Pharmacy Name: $pharmacy_name');
        print('Location: $location');
        print('Phone Number: $phone_number');
        print(value.data);
        registerModel = PharmacyRegisterModel.fromJson(value.data);
        emit(RegisterSuccessState(registerModel));
      }).catchError((error)
  {
    emit(RegisterErrorState(error.toString()));
    print('Error: $error');
  });
}
}