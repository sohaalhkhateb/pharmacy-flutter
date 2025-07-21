import 'package:flutter/material.dart';

class MassengerScreen extends StatelessWidget {
  const MassengerScreen({super.key});

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        titleSpacing: 20.0,
        title: Row(
          children: [
            CircleAvatar(
              radius: 20.0,
              backgroundImage: NetworkImage('https://images.unsplash.com/photo-1541516160071-4bb0c5af65ba?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTZ8fHBob3RvZ3JhcGh5fGVufDB8fDB8fHww'),
            ),
            SizedBox(
              width: 15.0,
            ),
            Text(
              'Chats',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),

          ],

        ),
        actions: [
          IconButton( icon: CircleAvatar(
            radius: 15.0,
            backgroundColor: Colors.blue,
            child: Icon(
            Icons.camera_alt,
              color: Colors.white,
              size: 16.0,
          ),
    ),
            onPressed: (){},
          ),
          IconButton( icon: CircleAvatar(
            radius: 15.0,
            backgroundColor: Colors.blue,
            child: Icon(
              Icons.edit,
              color: Colors.white,
              size: 16.0,
            ),
          ),
            onPressed: (){},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:
            [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.grey[300],
                ),
                padding: EdgeInsets.all(5.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Text(
                      'Search',
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
             Container(
               height: 200.0,
               child: ListView.separated(
                 scrollDirection: Axis.horizontal,
                 itemBuilder: (context, index) => buildStoryItem(),
                 separatorBuilder: (context, index) => SizedBox(
                   width: 20.0,
                 ),
                 itemCount: 5,
               ),
             ),
              SizedBox(
                height: 20.0,
              ),
              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) => buildChatItem(),
                separatorBuilder: (context, index) => SizedBox(
                  height: 20.0,
                ),
                itemCount: 15,
              ),
          
            ],
          ),
        ),
      ),
    );
  }

  // 1. build item
 // 2. build list
 // 3. add item to list

// arrow function
  Widget buildChatItem() => Row(
  children: [
    Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        CircleAvatar (
          radius: 30.0,
          backgroundImage: NetworkImage('https://images.unsplash.com/photo-1541516160071-4bb0c5af65ba?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTZ8fHBob3RvZ3JhcGh5fGVufDB8fDB8fHww'),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.only(
            bottom: 3.0,
            end: 3.0,
          ),
          child: CircleAvatar(
            radius: 7.0,
            backgroundColor: Colors.red,
          ),
        ),
      ],
    ),
    SizedBox(
      width: 20.0,
    ),
    Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'soha alkhateb',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  'hello my name is soha',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Container(
                  width: 7.0,
                  height: 7.0,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Text(
                '02:00 pm',
              ),
            ],
          ),

        ],
      ),
    )


  ],
);

  Widget buildStoryItem() =>  Container(
    width: 60.0,
    child: Column(
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            CircleAvatar (
              radius: 30.0,
              backgroundImage: NetworkImage('https://images.unsplash.com/photo-1541516160071-4bb0c5af65ba?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTZ8fHBob3RvZ3JhcGh5fGVufDB8fDB8fHww'),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(
                bottom: 3.0,
                end: 3.0,
              ),
              child: CircleAvatar(
                radius: 7.0,
                backgroundColor: Colors.red,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 4.0,
        ),
        Text(
          'soha alkhateb',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    ),
  );

}


