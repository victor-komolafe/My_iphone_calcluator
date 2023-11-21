import 'package:intl/intl.dart';

class CustomFormatterExample {
  late NumberFormat customFormatter;
  String formattedNumber = ''; // String formattedNumber2;
  String StoredformattedNumber1 = ''; //variables to store in history
  String StoredformattedNumber2 = '';
  String StoredformattedResult = '';
  bool num1_Result_flag = false;

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

    // setFormattedValue(formattedNumber1);
    // formattedNumber1 = customFormatter;

    return formatter;
  }

  String setFormattedValue(dynamic valueToFormat) {
    formattedNumber = customFormatter.format(valueToFormat);
    print('Formatted Number is $formattedNumber');

    return formattedNumber;
  }

  void printFormattedValue(dynamic valueToFormat) {
    String formattedValue = customFormatter.format(valueToFormat);
    print(formattedValue);
  }

  String setFormattedValueNum1(dynamic valueToFormat) {
    StoredformattedNumber1 = customFormatter.format(valueToFormat);
    print('Formatted Stored Number 1  is $StoredformattedNumber1');

    if (num1_Result_flag == false) {
      num1_Result_flag = true;
      return StoredformattedNumber1;
    } else if (StoredformattedNumber2.isEmpty) {
      return StoredformattedNumber1;
    } else {
      StoredformattedResult = StoredformattedNumber1;
      return StoredformattedResult;
    }
  }

  String setFormattedValueNum2(dynamic valueToFormat) {
    StoredformattedNumber2 = customFormatter.format(valueToFormat);
    print('Formatted Stored Number 2  is $StoredformattedNumber2');

    return StoredformattedNumber2;
  }

  String setFormattedValueResult(dynamic valueToFormat) {
    StoredformattedResult = customFormatter.format(valueToFormat);
    print('Formatted Stored Result  is $StoredformattedResult');

    return StoredformattedResult;
  }
}
