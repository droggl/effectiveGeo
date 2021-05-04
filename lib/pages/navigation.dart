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
        backgroundColor: Theme.of(context).bottomAppBarColor,

        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: _onItemClick,
          type:BottomNavigationBarType.fixed,
          backgroundColor: Theme.of(context).bottomAppBarColor,
          selectedItemColor: Theme.of(context).buttonColor,
          unselectedItemColor: Theme.of(context).primaryColor,

          items: [
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.home,
                color: Theme.of(context).buttonColor,
                size: 25,  //size rausnehmen
              ),
                icon: Icon(
                    Icons.home,
                    color: Theme.of(context).primaryColor,
                  size: 16,
                ),
                label: "home",

            ),
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.flag,
                color: Theme.of(context).buttonColor,
                size: 25,  //size rausnehmen
              ),
                icon: Icon(
                  Icons.flag,
                  color: Theme.of(context).primaryColor,
                  size: 16,
                ),
                label: "cards"

            ),
            BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.plus_one,
                  color: Theme.of(context).buttonColor,
                  size: 25,   //size rausnehmen
                ),
                icon: Icon(Icons.plus_one,
                  color: Theme.of(context).primaryColor,
                  size: 16,
                ),

                label: "..."

            ),
          ],
        )
    );
  }
}
