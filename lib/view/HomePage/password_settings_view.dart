import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../app/theme/app_theme.dart';
import '../../controller/CampaignController/password_settings_controller.dart';

class PasswordSettingsView extends GetView<PasswordSettingsController> {
  const PasswordSettingsView({super.key});

  @override
  PasswordSettingsController get controller =>
      Get.put(PasswordSettingsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // AppBar with back icon and large title below (like your mock)
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new,
              size: 18, color: Colors.black),
          onPressed: Get.back,
        ),
        title: const SizedBox.shrink(),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 16, bottom: 6),
              child: Text(
                '비밀번호 설정',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w800,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
      ),

      // Main content
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 4, 16, 20),
        children: [
          const _LabelWithAsterisk('기본 비밀번호'),
          _PwdField(
            controller: controller.currentCtrl,
            hint: '8-16자리 영문, 숫자, 특수문자 조합',
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(height: 14),
          const _LabelWithAsterisk('새 비밀번호'),
          _PwdField(
            controller: controller.newCtrl,
            hint: '8-16자리 영문, 숫자, 특수문자 조합',
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(height: 14),
          const _LabelWithAsterisk('비밀번호 확인'),
          _PwdField(
            controller: controller.confirmCtrl,
            hint: '비밀번호를 재입력해 주세요.',
            textInputAction: TextInputAction.done,
          ),
          const SizedBox(height: 28),
        ],
      ),

      // Bottom: Done button + iOS handle (exactly like the screenshot)
      bottomNavigationBar: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Obx(
                () => SizedBox(
                  height: 52,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: controller.isDoneEnabled.value
                        ? controller.onTapDone
                        : null,
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: AppTheme.primary,
                      disabledBackgroundColor: const Color(0xFFE0E0E0),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    child: const Text('완료'),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            // iOS home handle
            Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Container(
                width: 120,
                height: 4,
                decoration: BoxDecoration(
                  color: const Color(0xFFBFBFBF),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/* ---------------- UI helpers ---------------- */

class _LabelWithAsterisk extends StatelessWidget {
  final String text;
  const _LabelWithAsterisk(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: text,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            const TextSpan(
              text: '  *',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w700,
                color: Color(0xFFFF6B00), // orange star like the mock
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PwdField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final TextInputAction textInputAction;

  const _PwdField({
    required this.controller,
    required this.hint,
    this.textInputAction = TextInputAction.next,
  });

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Color(0xFFE5E5E5)),
    );

    return TextField(
      controller: controller,
      obscureText: true,
      enableSuggestions: false,
      autocorrect: false,
      textInputAction: textInputAction,
      style: const TextStyle(fontSize: 15),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.black45, fontSize: 15),
        isDense: true,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        filled: true,
        fillColor: Colors.white,
        enabledBorder: border,
        focusedBorder: border,
      ),
    );
  }
}
