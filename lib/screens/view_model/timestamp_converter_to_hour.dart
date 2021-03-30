import 'timestamp_converter.dart';

class TimestempConvertreToHour extends TimestampConverter {
  @override
  String timestampConverter(int day) {
    var currentDate = DateTime.fromMillisecondsSinceEpoch(day * 1000);

    Map weekdays = {
      1: "Понедельник",
      2: "Вторник",
      3: "Среда",
      4: "Четверг",
      5: "Пятница",
      6: "Суббота",
      7: "Воскресенье",
    };

    return "${weekdays[currentDate.weekday]}, ${currentDate.hour}:00";
  }
}
