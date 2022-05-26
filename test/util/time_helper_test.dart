// TODO 1: Write a main() function to execute your test
// TODO 2: Create a group with the name of your class

// TODO 3.1: Write a test that the TimeHelper should return Morning
// TODO 3.2: Write a test that the TimeHelper should return Afternoon
// TODO 3.3: Write a test that the TimeHelper should return Evening
// TODO 3.4: Write a test that the TimeHelper should return Night


import 'package:flutter_test/flutter_test.dart';
import 'package:fluttertesting/util/time_helper.dart';

main(){
  group("TimeHelper",(){
    test("should return Night", () {
      // Arrange
      DateTime currentTime = DateTime(2020, 1, 1, 5);
      // Act
      String timeOfDay = TimeHelper.getTimeOfTheDay(currentTime);
      // Assert
      expect(timeOfDay, "Night");
    });

    test("should return Afternoon", () {
      // Arrange
      DateTime currentTime = DateTime(2020, 1, 1, 15);
      // Act
      String timeOfDay = TimeHelper.getTimeOfTheDay(currentTime);
      // Assert
      expect(timeOfDay, "Afternoon");
    });

    test("should return Morning", () {
      // Arrange
      DateTime currentTime = DateTime(2020, 1, 1, 6);
      // Act
      String timeOfDay = TimeHelper.getTimeOfTheDay(currentTime);
      // Assert
      expect(timeOfDay, "Morning");
    });

    test("should return Evening", () {
      // Arrange
      DateTime currentTime = DateTime(2020, 1, 1, 23);
      // Act
      String timeOfDay = TimeHelper.getTimeOfTheDay(currentTime);
      // Assert
      expect(timeOfDay, "Evening");
    });
  });
}
