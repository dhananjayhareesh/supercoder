import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../app/theme/app_theme.dart';

class CampaignSummaryCard extends StatelessWidget {
  final RxInt applied;
  final RxInt inProgress;
  final RxInt completed;

  const CampaignSummaryCard({
    super.key,
    required this.applied,
    required this.inProgress,
    required this.completed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(14, 14, 14, 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: const [
          BoxShadow(
            color: Color(0x14000000), // subtle
            blurRadius: 12,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Text(
                '나의 캠페인',
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
              ),
              const Spacer(),
              Icon(Icons.chevron_right, color: Colors.black.withOpacity(.6)),
            ],
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppTheme.divider),
            ),
            child: Row(
              children: [
                _SummaryCell(
                    label: '신청', count: applied, showRightChevron: true),
                _SummaryCell(
                    label: '진행중', count: inProgress, showRightChevron: true),
                _SummaryCell(
                    label: '완료', count: completed, showRightChevron: false),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SummaryCell extends StatelessWidget {
  final String label;
  final RxInt count;
  final bool showRightChevron;

  const _SummaryCell({
    required this.label,
    required this.count,
    required this.showRightChevron,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Obx(
            () => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '${count.value}',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: AppTheme.primary, // purple like screenshot
                    height: 1.0,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 12,
                    color: AppTheme.subtitle,
                  ),
                ),
              ],
            ),
          ),
          if (showRightChevron)
            Positioned.fill(
              right: -2, // nudges arrow between cells
              child: Align(
                alignment: Alignment.centerRight,
                child: Icon(
                  Icons.chevron_right,
                  size: 18,
                  color: Colors.black.withOpacity(.35),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
