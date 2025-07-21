import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';

import 'package:my_pharmacy/shared/cubit2/cubit.dart';
import '../../layout/pharmacy_app/upload_image/upload_image_screen.dart';

import '../../modules/news_app/web_view/web_view_screen.dart';
import '../styles/colors.dart';

Widget defultButton({
  double width = double.infinity,
  Color background = Colors.teal,
  bool isUpperCase = true,
  double radius = 0.0,
  required VoidCallback function,
  required String text,
}) =>
Container(
width: width,
height: 40.0,
child: MaterialButton(
child: Text(
isUpperCase? text.toUpperCase() : text,
style: TextStyle(
color: Colors.white,
),
),
onPressed: function,
),
  decoration: BoxDecoration(
    color: background,
    borderRadius: BorderRadius.circular(radius),
  ),
);

Widget defultTextButton({
  required VoidCallback? function,
  required String text
})
=> TextButton(onPressed: function,
    child: Text(text.toUpperCase(),
    )
);

Widget defultTextField({
  required TextEditingController controller,
  required TextInputType type,
  required String? Function(String?) validate,
  bool isPssword= false,
  Function(String)? onChange,
  VoidCallback? onTap,
  Function(String)? onSubmit,
  required String label,
  required IconData prefix,
  IconData? suffix,
  VoidCallback? onpress,
}) =>
TextFormField(
  controller: controller,
keyboardType: type,
obscureText: isPssword,
onFieldSubmitted: onSubmit,
onChanged: onChange,
onTap: onTap,
validator: validate,
decoration: InputDecoration(
  counterStyle: TextStyle(
    color: defultColor,
  ),
labelText: label,
labelStyle: TextStyle(
  color: defultColor,
),
prefixIcon: Icon(
    prefix,
  color: defultColor,
),
suffixIcon: suffix != null ? IconButton(
    icon: Icon(
  suffix,
      color: defultColor,),
    onPressed: onpress,
): null,
border: OutlineInputBorder(),
),

);

Widget buildTaskItem(Map model, context) => Dismissible(
  key: Key(model['id'].toString()),
  child: Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        CircleAvatar(
          radius: 40.0,
          backgroundColor: Colors.blue,
          child: Text(
            '${model['time']}',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(
          width: 20.0,
        ),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${model['title']}',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '${model['date']}',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 20.0,
        ),
        IconButton(
            onPressed: ()
            {
              AppCubit.get(context).updateData(
                status: 'done',
                id: model['id'],);
            },
            icon: Icon(Icons.check_box),
        color: Colors.green,),
        IconButton(
            onPressed: ()
            {
              AppCubit.get(context).updateData(
                status: 'archive',
                id: model['id'],);
            },
            icon: Icon(Icons.archive),
        color: Colors.black54,),
      ],
    ),
  ),
  onDismissed: (direction)
  {
    AppCubit.get(context).deleteData(id: model['id'],);
  },
);

Widget tasksBuilder({
  required List<Map> tasks,
}
    ) => ConditionalBuilder(
  condition: tasks.length > 0,
     builder: (context) => ListView.separated(
      itemBuilder: (context, index) => buildTaskItem(tasks[index], context),
      separatorBuilder: (context , index) => myDivider(),
      itemCount: tasks.length),
     fallback: (context) => Center(
      child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.menu,
          size: 100.0,
          color: Colors.grey,
        ),
        Text(
          'No Tasks Yet, Please Add Some Tasks',
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  ),);

Widget myDivider() => Padding(
  padding: const EdgeInsetsDirectional.only(
    start: 20.0,
  ),
  child: Container(
    width: double.infinity,
    height: 1.0,
    color: Colors.grey[300],
  ),
);

Widget buildArticalItem(article, context) => InkWell(
  onTap: (){
    navigateTo(context, WebViewScreen(article['url']));
  },
  child: Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        Container(
          width: 120.0,
          height: 120.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                image: NetworkImage('${article['urlToImage']}'),
                fit: BoxFit.cover,
              )),
        ),
        SizedBox(
          width: 20.0,
        ),
        Expanded(
          child: Container(
            height: 120.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children:
              [
                Expanded(
                  child: Text(
                    '${article['title']}',
                    style: Theme.of(context).textTheme.bodyLarge,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  '${article['publishedAt']}',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  ),
);

Widget buildProductItem({
  required dynamic item,
  required BuildContext context,
  required bool isMedication,
}) => InkWell(
  onTap: () {
    // يمكنكِ هنا التنقل إلى شاشة تفاصيل، أو عرض نافذة معلومات
  },
  child: Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        Container(
          width: 100.0,
          height: 100.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.teal, // لون مميز في حال عدم وجود صورة
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: item['image_path'] != null && item['image_path'].toString().isNotEmpty
              ? Image.network(
                  item['image_path'],
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => const Icon(Icons.broken_image, color: Colors.white),
                )
              : const Icon(Icons.image_not_supported, color: Colors.white),
          ),
        ),
        const SizedBox(width: 20.0),
        Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item['name'] ?? 'Unnamed',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                 const SizedBox(height: 4.0),
                 if(isMedication) ...[
                 Text(
                'Form: ${item['form'] ?? 'N/A'}',
                style: const TextStyle(color: Colors.grey),
              ),
                Text(
                  'Expiration Date: ${item['expirationDate'] ?? 'N/A'}',
                  style: const TextStyle(color: Colors.grey),
                ),
                Text(
                   'composition: ${item['composition'] ?? 'N/A'}',
                    style: const TextStyle(color: Colors.grey),
                    overflow: TextOverflow.ellipsis,
                ),
                 ]
                 else ...[
                      Text('Type: ${item['type'] ?? 'N/A'}', style: const TextStyle(color: Colors.grey)),
                ],
                 const SizedBox(height: 8.0),
          Row(
            children: [
              const SizedBox(width: 12.0),
              Expanded(
                child: Text(
                   'price: ${item['price'] ?? 'N/A'}',
                    style: const TextStyle(color: Colors.grey),
                    overflow: TextOverflow.ellipsis,
                ),
              ),
              Expanded(
                child: Text(
                   'stock: ${item['stock'] ?? 'N/A'}',
                    style: const TextStyle(color: Colors.grey),
                    overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          ],
            ),
          ),
      ],
    ),
  ),
);

Widget generalListBuilder({
  required List<dynamic> item,
  required Widget Function(dynamic item, BuildContext context) itemBuilder,
  required BuildContext context,
  required bool isMedication,
   bool isSearch = false,
   }) =>
    ConditionalBuilder(
      condition:  item.isNotEmpty,
      builder: (context) => ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => itemBuilder(item[index],context),
        separatorBuilder: (context, index) => myDivider(),
        itemCount: item.length,
      ),
      fallback: (context) =>
          isSearch ? Container() : const Center(child: CircularProgressIndicator()),
    );

Widget productBuilder(list, context,bool isMedication, {isSearch = false}) => ConditionalBuilder(
    condition: list.length > 0,
    builder: (context) => ListView.separated(
      physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) => buildProductItem(item: list[index],context: context,isMedication: isMedication),
        separatorBuilder: (context, index) => myDivider(),
        itemCount: list.length),
    fallback: (context) => isSearch? Container() : Center(child: CircularProgressIndicator()),
);

Widget articalBuilder(list, context, {isSearch = false}) => ConditionalBuilder(
  condition: list.length > 0,
  builder: (context) => ListView.separated(
    physics: BouncingScrollPhysics(),
    itemBuilder: (context, index) => buildArticalItem(list[index], context),
    separatorBuilder: (context, index) => myDivider(),
    itemCount: list.length,),
  fallback: (context) => isSearch? Container() : Center(child: CircularProgressIndicator()),
);



void navigateTo(context, widget) => Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => widget,
  ),
);

void navigateAndFinish(
    context, widget,) =>
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(
            builder: (context) => widget,
        ),
        (Route<dynamic> route) => false,
    );


