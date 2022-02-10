
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:flutter/material.dart';
import 'package:maru/core/theme/maaru_style.dart';
import 'disclaimer.dart';

enum _ToastMode { success, error }

Widget _buildDialog(_ToastMode mode, String message,context) {
  return Center(child:
    SingleChildScrollView(child:Center(
   child:
   Padding(
     padding: const EdgeInsets.only(left: 60.0, right: 60),
     child: Align(
        alignment: Alignment.center,
        child: Container(

            decoration: BoxDecoration(
                color: MaaruStyle.colors.textColorWhite,
                borderRadius: BorderRadius.circular(12),
                border:
                    Border.all(width: 1, color: MaaruStyle.colors.borderColor)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [

                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20),
                  child: Text(
                    message,
                  ),
                ),
                Divider(color: Colors.grey[360],

                 ),
                InkWell(onTap: (){

                },child:
                Text('ok'))
                // if (mode == _ToastMode.success)
                //   Icon(Icons.check_circle_outline,
                //       color: MaaruStyle.colors.green),
                // if (mode == _ToastMode.error)
                //   Icon(Icons.cancel_outlined, color: Colors.red),
                // SizedBox(height: 10),
              ],
            ))),
   ))) );
}

/// This class is responsible for any modal alert that is displayed on screen.
/// This will include alerts that will disappear after specified amount of time.
class AlertManager {
  /// Convinience method for showing error messages
  static void showErrorMessage(String message, BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showToastWidget(_buildDialog(_ToastMode.error, message,context),
          context: context,
          animation: StyledToastAnimation.values[0],
          reverseAnimation: StyledToastAnimation.slideToBottomFade,
          dismissOtherToast: true,

          duration: const Duration(seconds:3));
    });

  }

  /// Convinience method for showing success messages
  static void showSuccessMessage(String message, BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showToastWidget(_buildDialog(_ToastMode.success, message,context),
          context: context,
          animation: StyledToastAnimation.slideFromBottomFade,
          reverseAnimation: StyledToastAnimation.slideToBottomFade,
          dismissOtherToast: false,
          duration: Duration(seconds: 3));
    });
  }

  // Display the Out Of Fuel modal overlay on the screen
  static void disclaimerPopup(context, {Function() onSuccess}) {
    ToastFuture disclaimerToast;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Widget outOfFuelModal = DisclaimerModal(onBackgroundTap: () {
        AlertManager.dismiss(disclaimerToast);
      }, onSuccess: () {
        AlertManager.dismiss(disclaimerToast);
        if (onSuccess != null) {
          onSuccess();
        }
      }) as Widget;

      disclaimerToast = showToastWidget(outOfFuelModal,
          context: context,
          animation: StyledToastAnimation.fadeScale,
          reverseAnimation: StyledToastAnimation.fadeScale,
          isIgnoring: false,
          duration: Duration.zero);
    });
  }

  static void dismiss(ToastFuture t) {
    ToastManager()
        .toastSet
        .toList()
        .firstWhere((v) => v == t, orElse: null)
        ?.dismiss(showAnim: true);
  }

  static void dismissAll() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ToastManager().dismissAll(showAnim: true);
    });
  }
}
