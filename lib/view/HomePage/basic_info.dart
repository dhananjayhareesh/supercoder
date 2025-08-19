import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/theme/app_theme.dart';
import '../../controller/CampaignController/basic_info_controller.dart';

class BasicInfoView extends GetView<BasicInfoController> {
  const BasicInfoView({super.key});

  @override
  BasicInfoController get controller => Get.put(BasicInfoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                '기본정보',
                style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w800,
                    color: Colors.black),
              ),
            ),
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 4, 16, 20),
        children: [
          const _Label('아이디'),
          _TextField(
            controller: controller.idCtrl,
            enabled: false,
            fill: const Color(0xFFF3F3F3),
          ),
          const SizedBox(height: 14),

          const _Label('이메일'),
          _TextField(controller: controller.emailCtrl),
          const SizedBox(height: 14),

          const _Label('휴대폰 번호'),
          Row(
            children: [
              Expanded(child: _TextField(controller: controller.phoneCtrl)),
              const SizedBox(width: 10),
              SizedBox(
                height: 48,
                child: ElevatedButton(
                  onPressed: () {}, // hook your change-number flow
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.primary,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    textStyle: const TextStyle(fontWeight: FontWeight.w700),
                  ),
                  child: const Text('변경하기'),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),

          const _Label('닉네임'),
          _TextField(controller: controller.nickCtrl),
          const SizedBox(height: 14),

          const _Label('인스타그램 아이디'),
          _TextField(controller: controller.instaCtrl),
          const SizedBox(height: 14),

          const _Label('대표 작업 링크'),
          _TextField(controller: controller.linkCtrl),
          const SizedBox(height: 14),

          const _Label('포트폴리오'),
          _TextField(
            controller: controller.portfolioCtrl,
            suffix: const Icon(Icons.attach_file_outlined,
                color: Colors.black54, size: 20),
          ),

          const SizedBox(height: 28),

          // Save (enabled only when all fields filled)
          Obx(
            () => SizedBox(
              height: 52,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: controller.isSaveEnabled.value
                    ? controller.onTapSave
                    : null,
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: AppTheme.primary,
                  disabledBackgroundColor: const Color(0xFFE0E0E0),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  textStyle: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w700),
                ),
                child: const Text('저장하기'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/* -------------------- UI helpers (local to this view) -------------------- */

class _Label extends StatelessWidget {
  final String text;
  const _Label(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        text,
        style: const TextStyle(
            fontSize: 13, fontWeight: FontWeight.w600, color: Colors.black87),
      ),
    );
  }
}

class _TextField extends StatelessWidget {
  final TextEditingController? controller;
  final bool enabled;
  final Color? fill;
  final Widget? suffix;
  const _TextField({
    this.controller,
    this.enabled = true,
    this.fill,
    this.suffix,
  });

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Color(0xFFE5E5E5)),
    );

    return TextField(
      controller: controller,
      enabled: enabled,
      readOnly: !enabled,
      style: const TextStyle(fontSize: 15),
      decoration: InputDecoration(
        isDense: true,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        filled: fill != null || !enabled,
        fillColor: fill ?? (enabled ? null : const Color(0xFFF3F3F3)),
        enabledBorder: border,
        focusedBorder: border.copyWith(
            borderSide: const BorderSide(color: Color(0xFFE5E5E5))),
        disabledBorder: border.copyWith(
            borderSide: const BorderSide(color: Color(0xFFE5E5E5))),
        suffixIcon: suffix,
      ),
    );
  }
}
