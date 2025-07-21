import 'package:flutter/material.dart';
import 'package:my_pharmacy/layout/pharmacy_app/modules/register_pharmacy.dart';
import 'package:my_pharmacy/modules/register_pharamcy/register_pharmacy.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:my_pharmacy/shared/components/components.dart';

import '../../../modules/register_screen/continuescreen.dart';
import '../../../shared/styles/colors.dart';
import '../pharmacy_layout.dart';

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

class OnBoardingScreenPharmacy extends StatefulWidget
{
  @override
  State<OnBoardingScreenPharmacy> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreenPharmacy> {
  var boardController = PageController();

  List<BoardingModel> boarding = [
    BoardingModel(
      image: 'assets/images/4App.png',
      title: 'Welcome to our app!!',
      body: '-Our new pharmacy app will provide you with all the help and the information you would need to manage your pharmacy stock and make your work easier.!',
    ),
    BoardingModel(
      image: 'assets/images/drugs.png',
      title: 'For more details',
      body: '-There are many brand names of medications that contain the same active ingredients, and it is possible that the brand name of a particular medication is not stored in your memory. We have attempted to compile a list of many commercial drug names and provide you with the specific formulation of each medication, making it easier for you to prescribe patients medications with the desired composition.',
    ),
    BoardingModel(
      image: 'assets/images/drugs2.png',
      title: 'Last Details',
      body: '-There are also various forms of medications, including tablets, ointments, suppositories, and other types. We have categorized them according to their formulations to help you identify the different forms of each medication. Additionally, we have organized all the drugs based on their effectiveness date, allowing you to know which medication should be sold first to prevent any losses. All of this, along with many other services, will be available in this application.',
    ),
  ];

  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(onPressed: ()
          {
            navigateAndFinish(context, LoginPharmacy());
          },
            child: Text(
              'SKIP',
              style: TextStyle(
                color: Colors.deepOrange,
              ),
            ),),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
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
                      navigateAndFinish(context, LoginPharmacy(),);
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
            image: AssetImage('${model.image}'),),
      ),
      Text(
        '${model.title}',
        style: TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
          color: Colors.purple,
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
          color: Colors.blueGrey,
        ),
      ),
    ],
  );
}
