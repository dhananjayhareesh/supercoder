import 'package:flutter/material.dart';
import '../../app/theme/app_theme.dart';

class MenuTile extends StatelessWidget {
  final String title;
  final IconData? leading;
  final VoidCallback? onTap;
  final bool danger;

  const MenuTile({
    super.key,
    required this.title,
    this.leading,
    this.onTap,
    this.danger = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Column(
        children: [
          ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 8),
            leading: leading == null
                ? const SizedBox(width: 44)
                : Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppTheme.divider),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Icon(leading, size: 20, color: Colors.black87),
                    ),
                  ),
            title: Text(
              title,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
            trailing: const Icon(Icons.chevron_right),
            onTap: onTap,
            visualDensity: const VisualDensity(vertical: -1),
            minVerticalPadding: 12,
          ),
          SizedBox(
            height: 8,
          ),
          const Divider(height: 0.5),
          SizedBox(
            height: 8,
          )
        ],
      ),
    );
  }
}
