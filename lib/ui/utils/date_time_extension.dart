extension TimeExtension on DateTime{
  String get toFormattedDate{
    return "$day/ $month/ $year";
  }
  String get dayName{
    List<String> days=["sat","sun","mon","tue","wed","thu","fri"];
    return days[weekday-1];
  }
}