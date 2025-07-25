import 'package:flutter/material.dart';

import '../../models/user/user_model.dart';

class UsersScreen extends StatelessWidget
{
 List<UserModel> users = [
   UserModel(
     id: 1,
     name: 'Soha Alkhateb',
     phone: '+963984825010',
   ),
   UserModel(
     id: 2,
     name: 'Salah Alshaar',
     phone: '+96392345678',
   ),
   UserModel(
     id: 3,
     name: 'Samer Alshaar',
     phone: '+96392345678',
   ),
   UserModel(
     id: 1,
     name: 'Soha Alkhateb',
     phone: '+963984825010',
   ),
   UserModel(
     id: 2,
     name: 'Salah Alshaar',
     phone: '+96392345678',
   ),
   UserModel(
     id: 3,
     name: 'Samer Alshaar',
     phone: '+96392345678',
   ),
   UserModel(
     id: 1,
     name: 'Soha Alkhateb',
     phone: '+963984825010',
   ),
   UserModel(
     id: 2,
     name: 'Salah Alshaar',
     phone: '+96392345678',
   ),
   UserModel(
     id: 3,
     name: 'Samer Alshaar',
     phone: '+96392345678',
   ),
   UserModel(
     id: 1,
     name: 'Soha Alkhateb',
     phone: '+963984825010',
   ),
   UserModel(
     id: 2,
     name: 'Salah Alshaar',
     phone: '+96392345678',
   ),
   UserModel(
     id: 3,
     name: 'Samer Alshaar',
     phone: '+96392345678',
   ),
 ];

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Users',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) => buildUserItem(users[index]),
        separatorBuilder: (context, index) =>  Padding(
          padding: const EdgeInsetsDirectional.only(
            start: 20.0,
          ),
          child: Container(
            width: double.infinity,
            height: 1.0,
            color: Colors.grey[300],
          ),
        ),
        itemCount: users.length,
      ),


    );
  }
  Widget buildUserItem(UserModel user) => Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        CircleAvatar(
          radius: 25.0,
          backgroundColor: Colors.blue,
          child: Text(
            '${user.id}',
            style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                color: Colors.white
            ),
          ),
        ),
        SizedBox(
          width: 20.0,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children:
          [
            Text(
              '${user.name}',
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),

            ),
            Text(
                '${user.phone}',
                style: TextStyle(
                  color: Colors.grey,
                )
            ),

          ],
        )
      ],
    ),
  );

  //1. build item
//2. build list
//3. build item to list

}
