import 'package:intl/intl.dart';

extension DateTimeFormatExt on DateTime {
  String get hhmmss_ddMMyyyy => DateFormat('HH:mm:ss dd/MM/yyyy').format(this);
  String get hhmm_ddMMyyyy => DateFormat('HH:mm dd/MM/yyyy').format(this);
}
