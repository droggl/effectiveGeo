import 'package:effective_geo/pages/country_table.dart';
import 'package:effective_geo/pages/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Navigation extends StatefulWidget {
  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int currentIndex = 0;

  void _onItemClick(int idx){
    setState(() {
      currentIndex = idx;
    });
  }

  List<Widget> routeList = <Widget>[
    Home(),
    CountryTable(),
    Center(child:Text("coming soon"))
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:  routeList[currentIndex],

        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: _onItemClick,
          type:BottomNavigationBarType.fixed,
          backgroundColor: Colors.grey[900],
          selectedItemColor: Colors.amber,
          unselectedItemColor: Colors.grey[800],

          items: [
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.home,
                color: Colors.amber,
                size: 25,  //size rausnehmen
              ),
                icon: Icon(Icons.home,
                    color: Colors.grey[800]),
                label: "home",

            ),
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.flag,
                color: Colors.amber,
                size: 25,  //size rausnehmen
              ),
                icon: Icon(Icons.flag,
                  color: Colors.grey[800],
                ),
                label: "cards"

            ),
            BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.plus_one,
                  color: Colors.amber,
                  size: 25,   //size rausnehmen
                ),
                icon: Icon(Icons.plus_one,
                  color: Colors.grey[800],),
                label: "..."

            ),

          ],
        )
    );
  }
}
