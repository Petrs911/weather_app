import 'dart:io';

import 'timestamp_converter.dart';

class TimestempConvertreToHour extends TimestampConverter {
  @override
  String timestampConverter(int day) {
    var currentDate = DateTime.fromMillisecondsSinceEpoch(day * 1000);

    String locale = Platform.localeName;
    String lang = locale.substring(0, 2);

    Map weekdaysInRussian = {
      1: "Понедельник",
      2: "Вторник",
      3: "Среда",
      4: "Четверг",
      5: "Пятница",
      6: "Суббота",
      7: "Воскресенье",
    };

    Map weekdaysInEnglish = {
      1: "Mondey",
      2: "Tuesday",
      3: "Wednesday",
      4: "Thursday",
      5: "Friday",
      6: "Saturday",
      7: "Sunday",
    };

    if (lang == 'ru') {
      return "${weekdaysInRussian[currentDate.weekday]}, ${currentDate.hour}:00";
    } else {
      return "${weekdaysInEnglish[currentDate.weekday]}, ${currentDate.hour}:00";
    }
  }
}
