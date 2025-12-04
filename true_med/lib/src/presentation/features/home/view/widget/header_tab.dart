import 'package:flutter/material.dart';

class HeaderTabs extends StatelessWidget {
  //final int selectedIndex;
  final Function(int) onTap;

  const HeaderTabs({
    super.key,
    //required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    const activeColor = Color(0xFF0B4D2C);
    const dividerColor = Color(0xFFE0E0E0);

    return Container(
      height: 50,
      color: Colors.white,
      child: Row(
        children: [
          _TabItem(
            index: 0,
            //selectedIndex: selectedIndex,
            icon: Icons.storefront,
            text: "Sản phẩm",
            onTap: onTap,
          ),

          _VerticalDivider(color: dividerColor),

          _TabItem(
            index: 1,
            //selectedIndex: selectedIndex,
            icon: Icons.percent,
            text: "Mã giảm giá",
            onTap: onTap,
          ),

          _VerticalDivider(color: dividerColor),

          _TabItem(
            index: 2,
            //selectedIndex: selectedIndex,
            icon: Icons.grid_view,
            text: "Tổng quan",
            onTap: onTap,
          ),
        ],
      ),
    );
  }
}

class _TabItem extends StatelessWidget {
  final int index;
  //final int selectedIndex;
  final IconData icon;
  final String text;
  final Function(int) onTap;

  const _TabItem({
    required this.index,
    //required this.selectedIndex,
    required this.icon,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    const activeColor = Color(0xFF0B4D2C);
    //final isSelected = index == selectedIndex;

    return Expanded(
      child: InkWell(
        onTap: () => onTap(index),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 15, color: activeColor),
            const SizedBox(width: 6),
            Text(
              text,
              style: const TextStyle(
                fontSize: 11,
                color: Colors.black,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _VerticalDivider extends StatelessWidget {
  final Color color;
  const _VerticalDivider({required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1,
      margin: const EdgeInsets.symmetric(vertical: 10),
      color: color,
    );
  }
}
