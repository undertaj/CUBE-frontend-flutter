import 'package:flutter/material.dart';
import 'package:magicstep/src/config/colors.dart';

class GlobalServices {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  void showSnackBar(
      {required String message, required int time, Color? bgcolor}) {
    final BuildContext? context = navigatorKey.currentContext;
    if (context == null) {
      return;
    }
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: bgcolor ?? Colors.black,
      content: Text(message),
      duration: Duration(seconds: time),
    ));
  }

  void showBottomSheetLoader() {
    final BuildContext? context = navigatorKey.currentContext;
    if (context == null) {
      return;
    }
    showModalBottomSheet(
      context: context,
      enableDrag: true,
      isDismissible: false,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(ColorsConst.primaryColor),
          ),
        );
      },
    );
  }
}
