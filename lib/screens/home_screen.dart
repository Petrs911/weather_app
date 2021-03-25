import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        children: <Widget>[
          SizedBox(height: MediaQuery.of(context).size.height / 3),
          ExpansionTile(
            trailing:
                Image.network('http://openweathermap.org/img/wn/13n@2x.png'),
            subtitle: Text('Снег'),
            title: Text(
              'Cреда 3\u00B0',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            children: <Widget>[
              Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text('3\u00B0'),
                  Text('-1\u00B0'),
                ],
              ),
              Text('Some data'),
            ],
          ),
        ],
      ),
    );
  }
}
