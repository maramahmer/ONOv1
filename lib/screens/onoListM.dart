import 'package:flutter/material.dart';
import 'package:ono/constants.dart';
import 'package:ono/screens/home/homeScreen.dart';
import '../../model/emotionButton.dart';
import 'package:ono/model/dummyData.dart';
import 'package:ono/model/listModel.dart';

import 'onoDef.dart';


// When choosing show all in one emotional category
class onoListM extends StatefulWidget {
  const onoListM(
      {Key? key, required this.mainEmotion, required this.emotionButton})
      : super(key: key);
  // ADJUST THIS
  final EmotionButton emotionButton;
  final String mainEmotion;

  @override
  State<onoListM> createState() => _onoListM();
}

class _onoListM extends State<onoListM> {
  late List<listModel> onoDataList;
  late List<listModel> parsedList;
  List<listModel> _filtered = [];
  List<listModel> _null_filtered = [];

  @override
  void initState() {

    onoDataList = dummyData.map((x) => listModel.fromJson(x)).toList();
    parsedList = [];
    super.initState();
  }

  int quantity = 1;

  get button => widget.mainEmotion;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: searchBar(),
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
          SliverList(delegate: SliverChildListDelegate(
            [
            ],
          ),
          ),
          createList()
        ],
      ),
    );
  }

  Widget createList() {
    /*return ListView(
      shrinkWrap: true,
      children: [
        //Text(button),
        Text(
          widget.emotionButton.name,
          textAlign: TextAlign.left,
          style: Theme.of(context)
              .textTheme
              .headlineMedium!
              .copyWith(fontWeight: FontWeight.w500, color: textBlack),
        ),
      ],
    );*/
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          ),
          getList()
        ],
      ),
    );
  }

  Widget getList() {
    onoDataList.forEach((item){
      print(widget.mainEmotion);
      if(item.mainemotion == widget.mainEmotion.toLowerCase()){
        parsedList.add(item);
      }
    });
    return Column(
        children: parsedList.map((x) {
          return onoTile(x);
        }).toList());
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
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return onoDef(model: model);
            },
            ),
            );
          },
          title: Text(model.onomatopoeia),
          subtitle: Text(
            model.transliteration,
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

  Widget searchBar(){
    return Container(
      width: double.infinity,
      height: 40,
      decoration: BoxDecoration(
          color: lightBgColor, borderRadius: BorderRadius.circular(20)),
      child: Center(
        child: TextField(
          decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search),
              suffixIcon: IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () {
                  /* Clear the search field */
                },
              ),
              hintText: 'Search...',
              border: InputBorder.none
          ),
          onChanged: (value){
            // _alterFilter(value);
          },
        ),
      ),
    );
  }

/*  void _alterFilter(String query) {
    List<listModel> onoDataList = [];
    onoDataList.addAll(_filtered);
    if (query.isNotEmpty) {
      List<listModel> onoDataList = [];
      onoDataList.forEach((item) {
        if (item.onomatopoeia.contains(query) || item.transliteration.contains(query)) { //if you want to search it order by id you can change item.name.contains to item.id.contains
          onoDataList.add(item);
        }
      });
      setState(() {
        _filtered.clear();
        _filtered.addAll(onoDataList); //dummyListData will place all the data that match at your search bar
      });
      return;
    } else {
      setState(() {
        _filtered.clear();
        _filtered.addAll(_null_filtered); //_null_filtered will place all the data if search bar was empty after enter a words
      });
    }*/
  }

