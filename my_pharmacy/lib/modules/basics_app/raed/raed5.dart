import 'package:flutter/material.dart';

class ImageMeaningModel {
  final String nameInEnglish;
  final String nameInDeutsche;
  final String nameInArabic;
  final Icon iconFromFlutter;
  ImageMeaningModel(
    this.nameInEnglish,
    this.nameInDeutsche,
    this.nameInArabic,
    this.iconFromFlutter,
  );
}

List<ImageMeaningModel> listOfIcons = [
  ImageMeaningModel(
    'star',
    'Stern',
    'نجم',
    const Icon(Icons.star),
  ),
  ImageMeaningModel(
    'tabel',
    'Tisch',
    'طاولة',
    const Icon(Icons.table_bar),
  ),
  ImageMeaningModel(
    'TV',
    'Fernseher',
    'تلفاز',
    const Icon(Icons.tv),
  ),
  ImageMeaningModel(
    'book',
    'Bush',
    'كتاب',
    const Icon(Icons.book),
  ),
  ImageMeaningModel(
    'chair',
    'stuh1',
    'كرسي',
    const Icon(Icons.chair),
  ),
];

class Raed5 extends StatefulWidget {
  Raed5({super.key});

  @override
  State<Raed5> createState() => _Raed5State();
}

class _Raed5State extends State<Raed5> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ListView',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.pink,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: listOfIcons.length,
        itemBuilder: (BuildContext context, int index) {
          ImageMeaningModel imageMeaning = listOfIcons[index];
          return ListTile(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(imageMeaning.nameInArabic,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),),
                showCloseIcon: true,
                closeIconColor: Colors.red,
                duration: Duration(seconds: 1),
              ));
            },
            splashColor: Colors.blue,
            textColor: Colors.blue,
            iconColor: Colors.red,
            title: Text(imageMeaning.nameInEnglish),
            subtitle: Text(imageMeaning.nameInDeutsche),
            leading: imageMeaning.iconFromFlutter,
            trailing: Text(imageMeaning.nameInArabic),
          );
        },
      ),
    );
  }
}
// Column(
// children: [
// Card(
// color: Colors.blueAccent,
// elevation: 40.0,
// shadowColor: Colors.black,
// child: ListTile(
// iconColor: Colors.red,
// splashColor: Colors.blue,
// textColor: Colors.teal,
// title: Text('Item1'),
// subtitle: Text("Subtitle"),
// leading:
// Text('leading'),
// trailing: Text('trailing'),
// onTap: (){
// ScaffoldMessenger.of(context).showSnackBar(
// const SnackBar(
// content: Text("Hello"),
// backgroundColor: Colors.blue,
// showCloseIcon: true,
// duration: Duration(seconds: 1),
// closeIconColor: Colors.grey,),);
// },
// onLongPress: (){
// ScaffoldMessenger.of(context).showSnackBar(
// const SnackBar(content: Text("Hi from Ling Press",
// style: TextStyle(
// fontSize: 20,
// color: Color.fromARGB(255,87,170,283),
// ),),
// backgroundColor: Colors.red,
// showCloseIcon: true,
// closeIconColor: Colors.black,)
// );
// },
// ),
// ),
// SizedBox(
//   height: 25.0,
// ),
// - Card(
// color: Colors.red,
// elevation: 40,
// shadowColor: Colors.pink,
//
// child: ListTile(
// iconColor: Colors.green,
// textColor: Colors.blue,
// splashColor: Colors.indigo,
// title: Text('Title2'),
// subtitle: Text('subtitle2'),
// leading: Icon(Icons.abc),
// trailing: Icon(Icons.accessible),
// onTap: (){
// ScaffoldMessenger.of(context).showSnackBar(
// const SnackBar(
// content: Text('Stop!!!!!!',
// style: TextStyle(
// color: Colors.white,
// fontSize: 25,
// ),),
// backgroundColor: Colors.blue,
// showCloseIcon: true,
// closeIconColor: Colors.white,
// duration: Duration(seconds: 1),
// ),);
// },
// onLongPress: (){
// ScaffoldMessenger.of(context).showSnackBar(
// const SnackBar(content: Text('when long press'),
// duration: Duration(seconds: 1),
// showCloseIcon: true,
// closeIconColor: Colors.red,
// backgroundColor: Colors.blue,)
// );
// }
// ),
// ),
// ],
// ),
//
