import 'package:first_aid/constants/colors.dart';
import 'package:first_aid/data/models/data_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsPage extends StatefulWidget {
  final Data data;

  DetailsPage({required this.data});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  void _launchUrl(String url) async {
    await canLaunch(url) ? await launch(url) : throw 'can not launch $url';
  }

  void navigatetTo(context, widget) =>
      Navigator.push(context, MaterialPageRoute(builder: (context) => widget));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: Text(widget.data.title!),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //   video or image

            widget.data.banner != null
                ? GestureDetector(
                    onTap: () {
                      _launchUrl(widget.data.banner!);
                    },
                    child: Container(
                      width: double.infinity,
                      height: 200,
                      color: Colors.black,
                      child: const Icon(
                        Icons.play_arrow,
                        color: Colors.white,
                      ),
                    ),
                  )
                : Container(),

            ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: widget.data.procedures!.length,
                itemBuilder: (context, index) {
                  return buildListViewItem(widget.data, index);
                }),
            const SizedBox(
              height: 30,
            ),
            ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: widget.data.faqs!.length,
                itemBuilder: (context, index) {
                  return builditem(widget.data, index);
                }),
          ],
        ),
      ),
    );
  }
}

Widget buildListViewItem(Data data, int index) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      child: Column(
        children: [
          Row(children: [
            Container(
              margin: const EdgeInsets.only(left: 10, right: 20),
              width: 40,
              height: 40,
              child: Center(
                child: Text(
                  (index + 1).toString(),
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              ),
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: AppColors.mainColor),
            ),
            data.procedures![index].title != null
                ? Expanded(
                    child: Container(
//  padding: EdgeInsets.only(left: 60, right: 20),
                      child: Text(
                        data.procedures![index].title!,
                        style: const TextStyle(
                            fontSize: 18,
//   fontWeight: FontWeight.normal,
                            color: Color(0xFF07060C)),
                      ),
                    ),
                  )
                : Container(),
          ]),
          const SizedBox(
            height: 15,
          ),
          if (data.procedures![index].description != null)
            Container(
              padding: EdgeInsets.only(left: 60, right: 20),
              child: Text(
                data.procedures![index].description!,
                style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    color: Color(0xFF07060C)),
              ),
            )
          else
            Container(),
          SizedBox(
            height: 50,
          ),
        ],
      ),
    ),
  );
}

Widget builditem(Data data, int index) {
  return Container(
    child: ExpansionPanelList.radio(
      children: [
        ExpansionPanelRadio(
          headerBuilder: (context, isExpanded) => ListTile(
            title: Text(data.faqs![index].question!,
                style: TextStyle(
                  fontSize: 18,
                )),
          ),
          body: ListTile(
            title: Text(
              data.faqs![index].answer!,
              style: TextStyle(fontSize: 15, color: Color(0xFF707070)),
            ),
          ),
          value: data.faqs![index].question!,
        )
      ],
    ),
  );
}
// Widget buildExpansion() {
//   return ExpansionTile(
//     key: key,
//     initiallyExpanded: isExpanded,
//     childrenPadding: const EdgeInsets.all(8),
//     title: const Text(
//       "Header ",
//       style: const TextStyle(
//         fontSize: 18,
//       ),
//     ),
//     children: [
//       const Text(
//         ' widget.data.faqs![index].answer!',
//         style: const TextStyle(
//           fontSize: 18,
//         ),
//       ),
//     ],
//   );
// }
