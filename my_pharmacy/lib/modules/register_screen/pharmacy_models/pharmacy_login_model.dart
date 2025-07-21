class PharmacyLoginModel
{
  late String message;


PharmacyLoginModel.fromJson(Map<String, dynamic> json)
{
  message = json['message'] ?? json['failure'] ?? json['error'] ?? '';
}
  PharmacyLoginModel({this.message = ''});

}

class UserData
{
  late String email;
  late String password;

  UserData.fromJson(Map<String, dynamic> json)
  {
    email = json["email"] ?? '';
    password = json["password"] ?? '';

  }
}

