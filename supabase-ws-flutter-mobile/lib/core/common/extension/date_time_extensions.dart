import 'package:intl/intl.dart';

extension DateTimeExtensions on DateTime {
  String get toAmPmTimeFormat => DateFormat('hh:mm a').format(this);
}
