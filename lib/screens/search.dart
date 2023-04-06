import 'package:flutter/material.dart';
import 'package:ono/constants.dart';

import '../model/dummyData.dart';
import '../model/listModel.dart';
import 'onoDef.dart';

class SearchList extends StatefulWidget {
  SearchList({Key? key}) : super(key: key);
  @override
  _SearchListState createState() => _SearchListState();
}

class _SearchListState extends State<SearchList> {
  Widget appBarTitle = Text(
    "ONO Search",
    style: TextStyle(color: mainPink),
  );
  Icon actionIcon = Icon(
    Icons.search,
    color: mainPink,
  );
  final key = GlobalKey<ScaffoldState>();
  final TextEditingController _searchQuery = TextEditingController();
  late List<listModel> _list;
  List<listModel> _searchList = [];

  late bool _IsSearching;
  String _searchText = "";

  @override
  void initState() {
    super.initState();
    _IsSearching = false;
    init();
  }

  void init() {
    _list = dummyData.map((x) => listModel.fromJson(x)).toList();
    _searchList = _list;

    _searchQuery.addListener(() {
      if (_searchQuery.text.isEmpty) {
        setState(() {
          _IsSearching = false;
          _searchText = "";
          _buildSearchList();
        });
      } else {
        setState(() {
          _IsSearching = true;
          _searchText = _searchQuery.text;
          _buildSearchList();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;
    return Scaffold(
        key: key,
        appBar: buildBar(context),
        body: GridView.builder(
            itemCount: _searchList.length,
            itemBuilder: (context, index) {
              return GridItem(_searchList[index]);
            },
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              childAspectRatio: (1/.3),
            )));
  }

  List<listModel> _buildSearchList() {
    if (_searchText.isEmpty) {
      return _searchList = _list;
    } else {
      _searchList = _list
          .where((element) =>
      element.onomatopoeia.toLowerCase().contains(_searchText.toLowerCase()) ||
          element.transliteration.toLowerCase().contains(_searchText.toLowerCase()))
          .toList();
      print('${_searchList.length}');
      return _searchList;
    }
  }

  PreferredSizeWidget buildBar(BuildContext context) {
    return AppBar(
        centerTitle: true,
        title: appBarTitle,
        elevation: 0,
        iconTheme: IconThemeData(color: mainPink),
        backgroundColor: bgColor,
        actions: <Widget>[
          IconButton(
            icon: actionIcon,
            onPressed: () {
              setState(() {
                if (this.actionIcon.icon == Icons.search) {
                  this.actionIcon = const Icon(
                    Icons.close,
                    color: mainPink,
                  );
                  this.appBarTitle = TextField(
                    controller: _searchQuery,
                    style: const TextStyle(
                      color: mainPink,
                    ),
                    decoration: const InputDecoration(
                        hintText: "Search...",
                        hintStyle: TextStyle(color: mainPink), ),
                  );
                  _handleSearchStart();
                } else {
                  _handleSearchEnd();
                }
              });
            },
          ),
        ]);
  }

  void _handleSearchStart() {
    setState(() {
      _IsSearching = true;
    });
  }

  void _handleSearchEnd() {
    setState(() {
      this.actionIcon = const Icon(
        Icons.search,
        color: mainPink,
      );
      this.appBarTitle = const Text(
        "ONO Search",
        style: TextStyle(color: mainPink),
      );
      _IsSearching = false;
      _searchQuery.clear();
    });
  }
}

class GridItem extends StatelessWidget {
  final listModel model;
  const GridItem(this.model, {super.key});

  Widget build(BuildContext context) {
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