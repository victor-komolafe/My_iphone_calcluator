import 'package:intl/intl.dart';

class CustomFormatterExample {
  late NumberFormat customFormatter;

  CustomFormatterExample({String? locale, int? decimalDigits}) {
    customFormatter =
        _createCustomFormatter(locale: locale, decimalDigits: decimalDigits);
  }

  NumberFormat _createCustomFormatter({String? locale, int? decimalDigits}) {
    locale ??= 'en_US';
    decimalDigits ??= 2;

    NumberFormat formatter = NumberFormat.decimalPattern(locale);
    formatter.minimumFractionDigits = 0;
    formatter.maximumFractionDigits = 8;

    return formatter;
  }

  void printFormattedValue(dynamic valueToFormat) {
    String formattedValue = customFormatter.format(valueToFormat);
    print(formattedValue);
  }
}
