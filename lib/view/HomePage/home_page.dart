import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/HomeController/home_controller.dart';
import '../../widgets/campaign_summary.dart';
import '../../widgets/menu_tile.dart';
import 'campaign_matching_view.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  HomeController get controller => Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 10, 16, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _Header(),
              const SizedBox(height: 18),
              CampaignSummaryCard(
                applied: controller.applied,
                inProgress: controller.inProgress,
                completed: controller.completed,
              ),
              const SizedBox(height: 16),
              // list
              MenuTile(
                title: '내 정보',
                leading: Icons.person_outline,
                onTap: () {
                  Get.to(CampaignMatchingView());
                },
              ),
              MenuTile(
                title: '공지사항',
                leading: Icons.campaign_outlined,
                onTap: () {
                  Get.to(CampaignMatchingView());
                },
              ),
              MenuTile(
                title: '1:1문의',
                leading: Icons.chat_bubble_outline,
                onTap: () {
                  Get.to(CampaignMatchingView());
                },
              ),
              MenuTile(
                title: 'FAQ',
                leading: Icons.help_outline,
                onTap: () {
                  Get.to(CampaignMatchingView());
                },
              ),
              MenuTile(
                title: '약관 및 정책',
                leading: Icons.description_outlined,
                onTap: () {
                  Get.to(CampaignMatchingView());
                },
              ),
              MenuTile(
                title: '로그아웃',
                leading: Icons.logout,
                onTap: controller.logout,
              ),
              MenuTile(
                title: '회원탈퇴',
                leading: Icons.delete_outline,
                danger: true,
                onTap: controller.deleteAccount,
              ),
              // const SizedBox(height: 24),
              // Center(
              //   child: Container(
              //     width: 120,
              //     height: 4,
              //     decoration: BoxDecoration(
              //       color: const Color(0xFFBFBFBF),
              //       borderRadius: BorderRadius.circular(8),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Header extends GetView<HomeController> {
  const _Header({super.key});

  @override
  HomeController get controller => Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '안녕하세요,',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '${controller.userName.value}님',
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w800,
                    height: 1.1,
                  ),
                ),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: controller.onTapProfileImage,
          child: Container(
            width: 74,
            height: 74,
            decoration: const BoxDecoration(
              color: Color(0xFFF3F3F3),
              shape: BoxShape.circle,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.camera_alt_outlined,
                    size: 22, color: Colors.black54),
                const SizedBox(height: 4),
                Text(
                  '이미지 등록',
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.black.withOpacity(.6),
                    height: 1.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
