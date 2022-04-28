import 'package:first_aid/constants/colors.dart';
import 'package:flutter/material.dart';

class BannerDetails extends StatelessWidget {
  final String name;

  final String image;
  final String des;
  final List<String>? tips;

  BannerDetails(
      {required this.name,
      required this.image,
      required this.des,
      required this.tips});

  @override
  Widget build(BuildContext context) {
    List<bool> _isExpanded = List.generate(10, (_) => false);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.mainColor,
        title: Text(name),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 192,
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage(image),
              )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Container(
                child: Column(

                  children: [
                    Row(children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Container(
                            child: Text(
                              des,
                              style: const TextStyle(
                                  fontSize: 15, color: Color(0xFF504D48)),
                            ),
                          ),
                        ),
                      )
                    ]),
                    const SizedBox(
                      height: 25,
                    ),
                  ],
                ),
              ),
            ),
            (tips == null)
                ? Container()
                : ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: tips!.length,
                    itemBuilder: (context, index) {
                      return buildText(index, tips!);
                    }),
           const  SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildText(int index, List<String> tips) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(children: [
        Container(
          margin: const EdgeInsets.only(left: 10, right: 20),
          width: 40,
          height: 40,
          child: Center(
            child: Text(
              (index + 1).toString(),
              style:const  TextStyle(fontSize: 15, color: Colors.white),
            ),
          ),
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: AppColors.mainColor),
        ),
        Expanded(
          child: Container(
            child: Text(
              tips[index],
              style: const TextStyle(
                  fontSize: 18,
                  //   fontWeight: FontWeight.normal,
                  color: Color(0xFF07060C)),
            ),
          ),
        ),
      ]),
    );
  }
}
