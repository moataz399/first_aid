import 'package:flutter/material.dart';

class ExpandingItems extends StatefulWidget {
  ExpandingItems({Key? key}) : super(key: key);

  @override
  _ExpandingItemsState createState() => _ExpandingItemsState();
}

class _ExpandingItemsState extends State<ExpandingItems> {
  List<bool> _isExpanded = List.generate(10, (_) => false);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: ExpansionPanelList(
          expansionCallback: (index, isExpanded) => setState(() {
            _isExpanded[index] = !isExpanded;
          }),
          children: [
            for (int i = 0; i < 10; i++)
              ExpansionPanel(
                body: ListTile(
                    subtitle: Text(
                  "... amet, consectetur adipiscing elit. Nullam ultricies porta rutrum. Vivamus id ultrices velit. Sed tellus lorem, egestas ac magna non, fringilla sagittis erat. Interdum et malesuada fames ac ante ipsum primis in faucibus. Fusce tempor mi et eleifend fermentum. Sed quis molestie nunc.",
                  style: TextStyle(
                    fontSize: 18,

                  ),
                )),
                headerBuilder: (_, isExpanded) {
                  return Center(
                    child: Text(
                      "Lorem ipsum dolor sit ...",
                      style: TextStyle(fontSize: 18, color: Color(0xFF07060C)),
                    ),
                  );
                },
                isExpanded: _isExpanded[i],
              )
          ],
        ),
      ),
    );
  }
}
