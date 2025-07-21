class ShopLoginModel
{
 late bool status;
 late String message;
 late UserData? data;

 ShopLoginModel.fromJson(Map<String, dynamic> json)
 {
   status = json["status"];
   message = json["massage"];
   data = json["data"] != null ? UserData.fromJson(json['data']) : null;
 }
 ShopLoginModel()
 {
  this.status = status;
  this.message = message;
  this.data = data;
 }
}
class UserData
{
  late int id;
  late String name;
  late String email;
  late String phone;
  late String image;
  late int points;
  late int credit;
  late String token;

//   UserData({
//     this.id,
//     this.name,
//     this.email,
//     this.phone,
//     this.image,
//     this.points,
//     this.credit,
//     this.token,
// });
  // named constructor
  UserData.fromJson(Map<String, dynamic> json)
  {
    id = json["id"];
    name = json["name"];
    email = json["email"];
    phone = json["phone"];
    image = json["image"];
    points = json["points"];
    credit = json["credit"];
    token = json["token"];
  }
}