import 'package:dots_indicator/dots_indicator.dart';
import 'package:first_aid/business_logic/cubit/app_cubit.dart';
import 'package:first_aid/constants/strings.dart';
import 'package:first_aid/data/models/data_model.dart';
import 'package:first_aid/presentation/screens/home_screens/banner_details.dart';
import 'package:first_aid/presentation/widgets/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constants/dimensions.dart';

class HomePage extends StatefulWidget {
  HomePage({
    Key? key,
  }) : super(key: key);

  //final List data;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController pageController = PageController(viewportFraction: 1);
  var currPageValue = 0.0;

  late List data;

  @override
  void initState() {
    super.initState();
    AppCubit.of(context).getData();
    pageController.addListener(() {
      setState(() {
        currPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = AppCubit.of(context);
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        if (state is Loading) {
          return CupertinoActivityIndicator();
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
                  height: 185,
                  child: PageView.builder(
                      controller: pageController,
                      itemCount: banner.length,
                      itemBuilder: (context, index) =>
                          _buildBanner(index, banner)),
                ),
                const SizedBox(
                  height: 15,
                ),
                DotsIndicator(
                  dotsCount: banner.length,
                  position: currPageValue,
                  decorator: DotsDecorator(
                    activeColor: Colors.black,
                    color: Colors.grey,
                    size: const Size.square(9.0),
                    activeSize: const Size(18.0, 9.0),
                    activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.all(15),
              child: const Text(
                'Learn First Aid For...',
                style: TextStyle(fontSize: 16, color: Color(0xFF504D48)),
              ),
            ),
            ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: cubit.firstAidData!.data!.length,
                itemBuilder: (context, index) {
                  return buildListViewItem(cubit.firstAidData!.data![index]);
                })
          ],
        );
      },
    );
  }

  Widget buildListViewItem(Data data) {
    return GestureDetector(
      onTap: () {
        // Pass data.id
        Navigator.pushNamed(context, 'detailsPage',arguments: data);
      },
      child: SizedBox(
        height: 80,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(15),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: NetworkImage(data.icon!),
                      fit: BoxFit.cover,
                    )),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    data.title!,
                    style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFF07060C),
                        fontWeight: FontWeight.normal),
                  )
                ],
              ),
            ),
            Container(
              height: 1,
              color: Colors.grey,
            )
          ],
        ),
      ),
    );
  }

  Widget _buildBanner(int index, List banner) {
    return GestureDetector(
      onTap: () {
        navigateTo(
            context: context,
            widget: BannerDetails(
              tips: banner[index]['tips'],
              name: banner[index]['name'],
              image: banner[index]['image'],
              des: banner[index]['des'],
            ));
      },
      child: Container(
        child: Column(children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: EdgeInsets.all(5),
              height: 122,
              width: 332,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  image: DecorationImage(
                      image: AssetImage(banner[index]['image']),
                      fit: BoxFit.cover)),
            ),
          ),
          Align(
            child: Container(
              width: 332,
              height: 50,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFFe8e8e8),
                      blurRadius: 5.0,
                      offset: Offset(0, 8),
                    ),
                    BoxShadow(
                      color: Color(0xFFe8e8e8),
                      blurRadius: 5.0,
                      offset: Offset(8, 8),
                    ),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(-8, 0),
                    ),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(8, 0),
                    ),
                  ]),
              child: Container(
                padding: EdgeInsets.only(
                    left: Dimensions.width15, right: Dimensions.width15),
                child: Text(
                  banner[index]["name"],
                  style: TextStyle(
                      color: Colors.black, fontFamily: 'Europa,', fontSize: 18),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
