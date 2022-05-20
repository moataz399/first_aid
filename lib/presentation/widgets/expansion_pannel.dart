import 'package:first_aid/data/models/data_model.dart';
import 'package:flutter/material.dart';

class ExpandingItems extends StatefulWidget {
  ExpandingItems({Key? key, required this.data}) : super(key: key);
  final Data data;

  @override
  _ExpandingItemsState createState() => _ExpandingItemsState();
}

class _ExpandingItemsState extends State<ExpandingItems> {
  @override
  Widget build(BuildContext context) {
    late List<bool> _isExpanded;

    _isExpanded = List.generate(widget.data.faqs!.length, (_) => false);

    return SingleChildScrollView(
      child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: widget.data.faqs!.length,
          itemBuilder: (context, index) {
            return Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ExpansionPanelList(
                  expansionCallback: (index, isExpanded) => setState(() {
                    _isExpanded[index] = !isExpanded;
                  }),
                  children: [
                    ExpansionPanel(
                      body: ListTile(
                          subtitle: Center(
                        child: Text(
                          widget.data.faqs![index].answer!,
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      )),
                      headerBuilder: (_, isExpanded) {
                        return Center(
                          child: Text(
                            widget.data.faqs![index].question!,
                            style: const TextStyle(
                                fontSize: 18, color: Color(0xFF07060C)),
                          ),
                        );
                      },
                      isExpanded: _isExpanded[index],
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
