import 'package:effective_geo/cards/country_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StatsTable extends StatelessWidget {
  final List<Map> countries;
  const StatsTable({Key key, this.countries,}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Theme.of(context).primaryColorDark,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColorDark,
        brightness: Brightness.dark,
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
        title: Text(
          "countries",
          style:
          TextStyle(color: Theme.of(context).primaryColor, fontSize: 22),
        ),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: countries.length,
          itemBuilder: (context, index){
            return CountryCard(index: index, filteredCountriesEnglish:countries);
          },
        ),
      ),
    );
  }
}

