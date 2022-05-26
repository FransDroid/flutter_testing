
import 'package:flutter/material.dart';

class ScrollTestingWidget extends StatelessWidget {
  final List<String> bookTiles;

   const ScrollTestingWidget({Key? key, required this.bookTiles}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    assert(bookTiles.isNotEmpty);
    return Scaffold(
      appBar: AppBar(title: const Text('Bookshelf'),),
      body: ListView.builder(itemBuilder: (context, index) => ListTile(
        title: Text(bookTiles[index]),
      ),
        itemCount: bookTiles.length,
      ),
    );
  }
}
