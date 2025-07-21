class PharmacyRegisterModel
{
  late String message;

  PharmacyRegisterModel.fromJson(Map<String, dynamic> json)
  {
    message = json["message"] ?? "";
  }
  PharmacyRegisterModel({this.message = ''});
}
class UserData
{
  late String email;
  late String password;
  late String pharmacy_name;
  late String location;
  late String phone_number;

  UserData.fromJson(Map<String, dynamic> json)
  {
    email = json["email"] ?? '';
    password = json["password"] ?? '';
    pharmacy_name = json["pharmacy_name"] ?? '';
    location = json["location"] ?? '';
    phone_number = json["phone_number"] ?? '';
  }
}