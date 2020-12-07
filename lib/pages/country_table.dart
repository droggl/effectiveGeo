import 'package:effective_geo/cards/country_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:effective_geo/data/countries_english.dart';

class CountryTable extends StatefulWidget {
  @override
  _CountryTableState createState() => _CountryTableState();
}

class _CountryTableState extends State<CountryTable> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: SafeArea(
        child: ListView.builder(
              itemCount: countriesEnglish.length,
              itemBuilder: (context,  index){
                return CountryCard(country:  countriesEnglish[index]);
              },
            ),
      ),
    );
  }
}





















/*
class _CountryTableState extends State<CountryTable> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: countriesEnglish.map((country) => CountryCard(country: country)).toList(),
            ),
          )),
    );
  }
}*/







/*
class CountryTable extends StatefulWidget {
  @override
  _CountryTableState createState() => _CountryTableState();
}

class _CountryTableState extends State<CountryTable> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
      future: CountryProvider.getAllCountries(),
      builder: (context, AsyncSnapshot<List> snapshot) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Countries of the world"),
            actions: [],
          ),
          body: snapshot.hasData
              ? _buildCountryTable(snapshot.data)
              : CircularProgressIndicator(),
        );
      },
    );
  }

  Widget _buildCountryTable(List<Country> countries) {
    return SingleChildScrollView(
        child: DataTable(
          columns: [
            // DataColumn(label: Text("Flag")),
            DataColumn(label: Text("Country")),
            DataColumn(label: Text("Capital")),
          ],
          rows: countries
              .map(
                (country) => DataRow(cells: [
              // DataCell(
              //     Container(
              //       width: 30,
              //       child: SvgPicture.network(country.flag,
              //         width: 20,
              //         height: 20,
              //         placeholderBuilder: (BuildContext context) => Container(
              //             padding: const EdgeInsets.all(30.0),
              //             child: const CircularProgressIndicator()),),
              //       // Text(country.flag),
              //     )
              // ),
              DataCell(
                Text(country.name),
              ),
              DataCell(
                Text(country.capital),
              )
            ]),
          ).toList(),
        ));
  }
}*/