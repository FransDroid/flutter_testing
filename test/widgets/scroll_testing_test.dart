
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluttertesting/widgets/scroll_testing.dart';

void main(){
  group("ScrollTestingWidget", (){
    testWidgets("should not scroll with less items",(WidgetTester tester) async{
    await tester.pumpWidget(MaterialApp(
      home: ScrollTestingWidget(
        bookTiles: List.generate(5, (index) => "Book $index"),
      )
    ));
    
    await tester.drag(find.byType(ListView), const Offset(0, -300));
    await tester.pump();

    final firstBookFinder = find.text("Book 0");
    expect(firstBookFinder, findsOneWidget);
    });

    testWidgets("should scroll with a lot of items",(WidgetTester tester) async{
      await tester.pumpWidget(MaterialApp(
          home: ScrollTestingWidget(
            bookTiles: List.generate(300, (index) => "Book $index"),
          )
      ));
      await tester.drag(find.byType(ListView), const Offset(0, -300));
      await tester.pump();

      final firstBookFinder = find.text("Book 0");
      final elevenBookFinder = find.text("Book 10");
      final listTilesFinder = find.byType(ListTile);
      expect(firstBookFinder, findsNothing);
      expect(elevenBookFinder, findsOneWidget);
      expect(listTilesFinder, findsNWidgets(11));
    });

    testWidgets("should show only 2 on small screen size", (WidgetTester tester) async{
      tester.binding.window.physicalSizeTestValue = const Size(320, 350);

      await tester.pumpWidget(MaterialApp(
        home: ScrollTestingWidget(
          bookTiles: List.generate(2, (index) => "Book $index"),
        )
      ));

      expect(find.byType(ListTile), findsNWidgets(2));
    });

    testWidgets("should throw error if empty list is provided", (WidgetTester tester) async{
      await tester.pumpWidget(const MaterialApp(
          home: ScrollTestingWidget(
            bookTiles: [],
          )
      ));
      expect(tester.takeException(), isAssertionError);
    });
  });
}