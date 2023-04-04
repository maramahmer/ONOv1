
import 'package:flutter/material.dart';
import 'package:ono/constants.dart';
import 'package:ono/screens/home/homeScreen.dart';
import 'package:ono/model/dummyData.dart';
import 'package:ono/model/listModel.dart';
import 'onoDef.dart';

// When choosing show all in one emotional category
class allSearchList extends StatefulWidget {
  const allSearchList({
    Key? key,
  }) : super(key: key);

  @override
  State<allSearchList> createState() => _allSearchList();
}

class _allSearchList extends State<allSearchList> {
  late List<listModel> onoDataList;
  late List<listModel> searchList = [];

  @override
  void initState() {
    onoDataList = dummyData.map((x) => listModel.fromJson(x)).toList();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //title: searchBar(),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {
                // pop everything and return to home
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                    (Route<dynamic> route) => false);
              },
              child: const Icon(
                Icons.home,
                size: 30,
              ),
            ),
          ),
        ],
        backgroundColor: bgColor,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: mainPink,
        ),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate(
              [],
            ),
          ),
        ],
      ),
    );
  }

  Widget getSList() {
    return Column(
        children: searchList.map((x) {
          return onoTile(x);
        }).toList());
  }

Widget getSearchList(String word) {
    onoDataList.forEach((item) {
      print(word);
      if (item.onomatopoeia.contains(word.toLowerCase())  ||
          item.transliteration.contains(word.toLowerCase())) {
        searchList.add(item);
      }
    });
    return Column(
        children: onoDataList.map((x) {
          return onoTile(x);
        }).toList());
  }

  Widget searchBar() {
    return Container(
      width: double.infinity,
      height: 40,
      decoration: BoxDecoration(
          color: lightBgColor, borderRadius: BorderRadius.circular(20)),
      child: Center(
        child: TextField(
          onChanged: (query) {
            onoDataList.forEach((item) {
              print(query);
              if (item.onomatopoeia.contains(query.toLowerCase())  ||
                  item.transliteration.contains(query.toLowerCase())) {
                searchList.add(item);
                print("item added");
                getSList();
              }
            });
            },
          decoration: const InputDecoration(
              prefixIcon: Icon(Icons.search),
              //suffixIcon: Icon(Icons.clear),
              hintText: 'Search...',
              border: InputBorder.none),
        ),
      ),
    );
  }

  Widget onoTile(listModel model) {
    return Container(

      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: const BoxDecoration(
        color: lightBgColor,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            offset: Offset(4, 4),
            blurRadius: 10,
            color: darkBgColor,
          ),
          BoxShadow(
            offset: Offset(-3, 0),
            blurRadius: 14,
            color: darkBgColor,
          )
        ],
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 18, vertical: 8),
        child: ListTile(
          contentPadding: EdgeInsets.all(0),
          leading: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(13)),
            child: Container(
              height: 35,
              width: 55,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: lightBgColor,
              ),
              child: Text(
                model.letter,
                textAlign: TextAlign.left,
                textScaleFactor: 2,
              ),
            ),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return onoDef(model: model);
                },
              ),
            );
          },
          title:
          Wrap(
            children: [Text(model.onomatopoeia,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontWeight: FontWeight.bold),),
              const Icon(Icons.arrow_right_rounded),
              Text(model.transliteration,
                overflow: TextOverflow.ellipsis,)],
          ),
          /*subtitle: Text(
            model.transliteration,
          ),*/
          subtitle:
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(model.meaningen,
              overflow: TextOverflow.ellipsis,),
          ),
          trailing: const Icon(
            Icons.keyboard_arrow_right,
            size: 30,
            color: mainPink,
          ),
        ),
      ),
    );
  }
}
