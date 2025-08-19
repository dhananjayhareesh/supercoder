import 'package:get/get.dart';
import 'package:flutter/material.dart';

class CampaignModel {
  final String title;
  final String snippet;
  final String imageUrl;
  final List<String> tags;

  CampaignModel({
    required this.title,
    required this.snippet,
    required this.imageUrl,
    required this.tags,
  });
}

class CampaignMatchingController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;

  final campaigns = <CampaignModel>[
    CampaignModel(
      title: '회사명 나오는 자리',
      snippet: '소개가 나오는 자리입니다! 간략한 내용…',
      imageUrl:
          'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?w=400',
      tags: ['F&B', '체험', '숙박/키즈', '공식캠페인'],
    ),
    CampaignModel(
      title: '회사명 나오는 자리',
      snippet: '소개가 나오는 자리입니다! 간략한 내용…',
      imageUrl:
          'https://images.unsplash.com/photo-1496417263034-38ec4f0b665a?w=400',
      tags: ['F&B', '체험', '숙박/키즈', '공식캠페인'],
    ),
    CampaignModel(
      title: '회사명 나오는 자리',
      snippet: '소개가 나오는 자리입니다! 간략한 내용…',
      imageUrl:
          'https://images.unsplash.com/photo-1542314831-068cd1dbfeeb?w=400',
      tags: ['F&B', '체험', '숙박/키즈', '공식캠페인'],
    ),
    CampaignModel(
      title: '회사명 나오는 자리',
      snippet: '소개가 나오는 자리입니다! 간략한 내용…',
      imageUrl:
          'https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?w=400',
      tags: ['F&B', '체험', '숙박/키즈', '공식캠페인'],
    ),
    CampaignModel(
      title: '회사명 나오는 자리',
      snippet: '소개가 나오는 자리입니다! 간략한 내용…',
      imageUrl:
          'https://images.unsplash.com/photo-1540189549336-e6e99c3679fe?w=400',
      tags: ['F&B', '체험', '숙박/키즈', '공식캠페인'],
    ),
  ].obs;

  @override
  void onInit() {
    tabController = TabController(length: 3, vsync: this);
    super.onInit();
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}
