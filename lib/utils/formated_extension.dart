import 'package:intl/intl.dart';

extension FormatedToDayAndMon on DateTime {
  String formatedToDayMonAndYear() => DateFormat(("MMM d, yyyy")).format(this);

  String formatedToDayAndMon() => DateFormat(("MMM d")).format(this);
}
