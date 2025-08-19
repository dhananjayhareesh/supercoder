import 'package:flutter/material.dart';
import '../app/theme/app_theme.dart';
import '../controller/CampaignController/campaign_matching_controller.dart';

class CampaignListItem extends StatelessWidget {
  final CampaignModel campaign;
  const CampaignListItem({super.key, required this.campaign});

  @override
  Widget build(BuildContext context) {
    return Padding(
      // small internal padding so each row breathes a bit
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          // thumbnail
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              campaign.imageUrl,
              width: 76,
              height: 76,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),

          // texts + tags
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  campaign.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 15.5,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  campaign.snippet,
                  maxLines: 1, // keep 1-line like the screenshot
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 12.5,
                    color: Colors.black.withOpacity(.55),
                  ),
                ),

                // ⬇️ more gap AFTER the 2nd text (increase here to taste)
                const SizedBox(height: 18),

                Wrap(
                  spacing: 8, // even gap between violet chips
                  runSpacing: 8,
                  children: campaign.tags
                      .map((t) => _TagChip(label: t))
                      .toList(growable: false),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TagChip extends StatelessWidget {
  final String label;
  const _TagChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: AppTheme.primary.withOpacity(0.08),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: AppTheme.primary,
        ),
      ),
    );
  }
}
