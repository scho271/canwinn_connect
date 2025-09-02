import 'package:canwinn_project/Constants/color_constants.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CustomToast {
  void showCustomToast(String message) {
    Fluttertoast.showToast(
      backgroundColor: primaryColor,
      msg: message.replaceAll('  ', '  '),
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 1,
      textColor: white,
      fontSize: 16.0,
    );
  }
}
