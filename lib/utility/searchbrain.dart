import 'package:credo_inventory/screen/componentdetails.dart';
import 'package:flutter/material.dart';

class DataSearch extends SearchDelegate<String> {
  int componentindex;
  final componentNameValue = [
    'Resistor-0603-20ohm\nDescription: voltage: 250,voltage: 250,voltage: 250,Current 1uA',
    'Resistor-0805-40ohm\nDescription: voltage: 250,\n Current 1uA',
    'Resistor-60ohm\nDescription: voltage: 250,\n Current 1uA',
    'Resistor-80ohm',
    'Resistor-100ohm',
    'Resistor-120ohm',
    'Resistor-140ohm',
    'Resistor-180ohm',
    'Resistor-200ohm',
    'Resistor-220ohm',
    'Resistor-275ohm',
    'Resistor-1K',
    'Resistor-1.1K',
    'Resistor-2K',
    'Resistor-10K',
    'Resistor-1M',
    'Resistor-2M',
    'Resistor-2.5M',
    'Resistor-100K',
    'Resistor-200K',
    'Inductor-2.3uH\nDescription: voltage: 250, Current 1uA',
    'Capacitor- 0.1uF\nDescription: voltage: 250, Current 1uA',
    'Capacitor- 0.2uF',
    'Capacitor- 22pF',
    'Capacitor- 10uF',
  ];
  final recentComponent = [
    'Resistor-200K',
    'Inductor-2.3uH',
    'Capacitor- 0.1uF',
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    String searchResult;
    if (!(componentindex == null)) {
      searchResult = componentNameValue[componentindex];
    } else {
      searchResult = 'No Item Found';
    }

    return Card(
      child: Container(
        width: double.infinity,
        child: RaisedButton(
          onPressed: () {
            Navigator.pushNamed(context, ComponentDetailsPage.id);
          },
          child: Text(searchResult),
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? recentComponent
        : componentNameValue
            .where((p) => (p.toLowerCase()).contains(query.toLowerCase()))
            .toList();

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          showResults(context);
          componentindex = componentNameValue.indexOf(
              suggestionList[index]); // to get the actual index of the list
          print(componentindex);
        },
        leading: Icon(Icons.check_box),
        title: RichText(
          text: TextSpan(
              text: suggestionList[index].substring(0, query.length),
              style:
                  TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
              children: [
                TextSpan(
                    text: suggestionList[index].substring(query.length),
                    style: TextStyle(color: Colors.grey))
              ]),
        ),
      ),
      itemCount: suggestionList.length,
    );
  }
}
//startsWith(query)).toList()
