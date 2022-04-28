import 'package:first_aid/constants/colors.dart';
import 'package:first_aid/presentation/widgets/expansion_pannel.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<bool> _isExpanded = List.generate(10, (_) => false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: Text('burns'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //video or image
            Container(
              height: 192,
              width: double.infinity,
              color: Colors.black,
            ),

            //  VideoBubble(url: 'https://www.youtube.com/watch?v=HYnKq0ErrPU'),

            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Container(
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(children: [
                      Container(
                        margin: const EdgeInsets.only(left: 10, right: 20),
                        width: 40,
                        height: 40,
                        child: const Center(
                          child: Text(
                            '1',
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          ),
                        ),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: AppColors.mainColor),
                      ),
                      Expanded(
                        child: Container(
                          //  padding: EdgeInsets.only(left: 60, right: 20),
                          child: const Text(
                            'Give them something containing sugar, such as sugar tablets,orange juice, sugar-containing candy or a non-diet drink.',
                            style: TextStyle(
                                fontSize: 18,
                                //   fontWeight: FontWeight.normal,
                                color: Color(0xFF07060C)),
                          ),
                        ),
                      )
                    ]),
                    const SizedBox(
                      height: 25,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 60, right: 20),
                      child: const Text(
                        'In diabetic emergencies, blood sugar levels can become too low, this can cause people to collapse. Giving them something sugary, including candy suchSkittles, will help raise their blood',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                            color: Color(0xFF07060C)),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Container(
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(children: [
                      Container(
                        margin: const EdgeInsets.only(left: 10, right: 20),
                        width: 40,
                        height: 40,
                        child: const Center(
                          child: Text(
                            '1',
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          ),
                        ),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: AppColors.mainColor),
                      ),
                      Expanded(
                        child: Container(
                          //  padding: EdgeInsets.only(left: 60, right: 20),
                          child: const Text(
                            'Give them something containing sugar, such as sugar tablets,orange juice, sugar-containing candy or a non-diet drink.',
                            style: TextStyle(
                                fontSize: 18,
                                //   fontWeight: FontWeight.normal,
                                color: Color(0xFF07060C)),
                          ),
                        ),
                      )
                    ]),
                    const SizedBox(
                      height: 25,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 60, right: 20),
                      child: const Text(
                        'In diabetic emergencies, blood sugar levels can become too low, this can cause people to collapse. Giving them something sugary, including candy suchSkittles, will help raise their blood',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                            color: Color(0xFF07060C)),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            ExpandingItems(),
          ],
        ),
      ),
    );
  }
}
