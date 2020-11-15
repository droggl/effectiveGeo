import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:country_provider/country_provider.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
}