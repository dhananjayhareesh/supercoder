import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PasswordSettingsController extends GetxController {
  final currentCtrl = TextEditingController();
  final newCtrl = TextEditingController();
  final confirmCtrl = TextEditingController();

  final isDoneEnabled = false.obs;

  // At least one letter, one digit, one special, length 8-16
  final _pwdRe = RegExp(r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[^\w\s]).{8,16}$');

  void _recalc() {
    final newOk = _pwdRe.hasMatch(newCtrl.text.trim());
    final confirmOk = _pwdRe.hasMatch(confirmCtrl.text.trim());
    final match = newCtrl.text == confirmCtrl.text;
    // You can also require current password non-empty:
    final hasCurrent = currentCtrl.text.trim().isNotEmpty;

    isDoneEnabled.value = hasCurrent && newOk && confirmOk && match;
  }

  void onTapDone() {
    // TODO: call your API
    Get.snackbar('완료', '비밀번호가 변경되었습니다.', snackPosition: SnackPosition.BOTTOM);
  }

  @override
  void onInit() {
    super.onInit();
    for (final c in [currentCtrl, newCtrl, confirmCtrl]) {
      c.addListener(_recalc);
    }
    _recalc();
  }

  @override
  void onClose() {
    currentCtrl.dispose();
    newCtrl.dispose();
    confirmCtrl.dispose();
    super.onClose();
  }
}
