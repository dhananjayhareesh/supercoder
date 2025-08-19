import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/theme/app_theme.dart';
import '../../controller/CampaignController/campaign_matching_controller.dart';
import '../../widgets/campaign_list_item.dart';
import 'my_info_view.dart';

class CampaignMatchingView extends GetView<CampaignMatchingController> {
  const CampaignMatchingView({super.key});

  @override
  CampaignMatchingController get controller =>
      Get.put(CampaignMatchingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SafeArea(
          top: false, child: Container(height: 18, color: Colors.white)),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Back on top, title BELOW it
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 16, 6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new, size: 18),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    splashRadius: 22,
                    onPressed: Get.back,
                  ),
                  const SizedBox(height: 4),
                  const Padding(
                    padding: EdgeInsets.only(
                        left: 8), // 8 + outer 8 = 16 from screen edge
                    child: Text('캠페인 매칭',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w800)),
                  ),
                ],
              ),
            ),

            // Tabs (underline line)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TabBar(
                controller: controller.tabController,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.black.withOpacity(.45),
                labelStyle:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                unselectedLabelStyle:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                indicatorColor: AppTheme.primary,
                indicatorWeight: 3,
                indicatorSize: TabBarIndicatorSize.tab,
                tabs: const [
                  Tab(text: '신청'),
                  Tab(text: '진행중'),
                  Tab(text: '완료')
                ],
              ),
            ),
            const SizedBox(height: 8),

            // Content
            Expanded(
              child: TabBarView(
                controller: controller.tabController,
                children: const [
                  _CampaignList(),
                  _CampaignList(),
                  _CampaignList()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CampaignList extends GetView<CampaignMatchingController> {
  const _CampaignList({super.key});

  @override
  CampaignMatchingController get controller =>
      Get.find<CampaignMatchingController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.separated(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
        physics: const BouncingScrollPhysics(),
        itemBuilder: (_, i) {
          final item = controller.campaigns[i];
          return Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(8),
              onTap: () => Get.to(() => const MyInfoView()),
              child: CampaignListItem(campaign: item),
            ),
          );
        },
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemCount: controller.campaigns.length,
      ),
    );
  }
}
