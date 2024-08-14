import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Search')),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Search',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: const [
                ListTile(
                  title: Text('Match 1'),
                  subtitle: Text('Details'),
                ),
                ListTile(
                  title: Text('Match 2'),
                  subtitle: Text('Details'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
