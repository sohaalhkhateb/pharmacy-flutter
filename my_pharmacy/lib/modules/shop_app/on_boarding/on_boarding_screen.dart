import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:my_pharmacy/shared/components/components.dart';

import '../../../shared/styles/colors.dart';
import '../login/shop_login_screen.dart';

class BoardingModel
{
  final String image;
  final String title;
  final String body;

  BoardingModel({
   required this.image,
   required this.title,
   required this.body,
});
}

class OnBoardingScreen extends StatefulWidget
{
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var boardController = PageController();

  List<BoardingModel> boarding = [
    BoardingModel(
      image: 'assets/images/login_pharmacy.png',
      title: 'On Board 1 Title',
      body: 'On Board 1 Body',
    ),
    BoardingModel(
      image: 'assets/images/login_pharmacy.png',
      title: 'On Board 2 Title',
      body: 'On Board 2 Body',
    ),
    BoardingModel(
      image: 'assets/images/login_pharmacy.png',
      title: 'On Board 3 Title',
      body: 'On Board 3 Body',
    ),
  ];

  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          defultTextButton(function: ()
          {
            navigateAndFinish(context, ShopLoginScreen());
          },
              text: 'skip'),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children:
          [
            Expanded(
              child: PageView.builder(
                physics: BouncingScrollPhysics(),
                controller: boardController,
                onPageChanged: (int index)
                {
                  if(index == boarding.length -1)
                    {
                      setState(() {
                        isLast = true;
                      });
                    } else
                      {
                        setState(() {
                          isLast = false;
                        });
                      }
                },
                itemBuilder: (context, index) => buildBoardingItem(boarding[index]),
                itemCount: boarding.length,
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            Row(
              children: [
                SmoothPageIndicator(
                    controller: boardController,
                    effect: ExpandingDotsEffect(
                      dotColor: Colors.grey,
                      activeDotColor: defultColor,
                      dotHeight: 10,
                      expansionFactor: 4,
                      dotWidth: 10,
                      spacing: 5.0,
                    ),
                    count: boarding.length,
                ),
                Spacer(),
                FloatingActionButton(
                  onPressed: ()
                  {
                    if(isLast)
                      {
                        navigateAndFinish(context, ShopLoginScreen(),);
                      } else
                        {
                          boardController.nextPage(
                            duration: Duration(
                              milliseconds: 750,
                            ),
                            curve: Curves.fastLinearToSlowEaseIn,
                          );
                        }

                  },
                  mini: true,
                    shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(50),
                      ),
                 child: Icon(
                  Icons.arrow_forward_ios,
                   size: 20.0,
                ),)
              ],
            )

          ],
        ),
      ),
    );
  }

  Widget buildBoardingItem(BoardingModel model) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children:
    [
      Expanded(
        child: Image(
            image: AssetImage('${model.image}')),
      ),
      SizedBox(
        height: 30.0,
      ),
      Text(
        '${model.title}',
        style: TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(
        height: 15.0,
      ),
      Text(
        '${model.body}',
        style: TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    ],
  );
}
