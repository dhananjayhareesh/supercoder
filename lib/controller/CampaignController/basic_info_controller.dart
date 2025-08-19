import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view/HomePage/password_settings_view.dart';

class BasicInfoController extends GetxController {
  // Prefill with sample values (replace with your own state)
  final idCtrl = TextEditingController(text: 'asdf123');
  final emailCtrl = TextEditingController(text: 'asdf123@naver.com');
  final phoneCtrl = TextEditingController(text: '010-1234-5678');
  final nickCtrl = TextEditingController(text: '장발산');
  final instaCtrl = TextEditingController(text: 'ffkdo_sa');
  final linkCtrl = TextEditingController(text: 'https://www.naver.com/');
  final portfolioCtrl = TextEditingController(text: '포트폴리오.pdf');

  final isSaveEnabled = false.obs;

  void _recalc() {
    // Enable when ALL editable fields are non-empty
    isSaveEnabled.value = [
      emailCtrl,
      phoneCtrl,
      nickCtrl,
      instaCtrl,
      linkCtrl,
      portfolioCtrl,
    ].every((c) => c.text.trim().isNotEmpty);
  }

  void onTapSave() {
    Get.to(
      () => const PasswordSettingsView(),
    );
  }

  @override
  void onInit() {
    super.onInit();
    for (final c in [
      emailCtrl,
      phoneCtrl,
      nickCtrl,
      instaCtrl,
      linkCtrl,
      portfolioCtrl,
    ]) {
      c.addListener(_recalc);
    }
    _recalc(); // initial compute
  }

  @override
  void onClose() {
    idCtrl.dispose();
    emailCtrl.dispose();
    phoneCtrl.dispose();
    nickCtrl.dispose();
    instaCtrl.dispose();
    linkCtrl.dispose();
    portfolioCtrl.dispose();
    super.onClose();
  }
}
