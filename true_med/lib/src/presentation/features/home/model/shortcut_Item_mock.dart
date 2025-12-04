class ShortcutItem {
  final String title;
  final String? subtitle;
  final String iconPath;

  ShortcutItem({required this.title, this.subtitle, required this.iconPath});
}

final shortcutItems = <ShortcutItem>[
  ShortcutItem(title: 'Mã Giảm Giá', iconPath: 'assets/icons/icon_1.png'),
  ShortcutItem(title: 'Nhà Bán Hàng', iconPath: 'assets/icons/icon_2.png'),
  ShortcutItem(
    title: 'Học cùng Sĩ',
    subtitle: '20+ Khoá học',
    iconPath: 'assets/icons/icon_3.png',
  ),
  ShortcutItem(
    title: 'Mời Bạn',
    subtitle: 'Dùng Buymed',
    iconPath: 'assets/icons/icon_4.png',
  ),
  ShortcutItem(
    title: 'Amox/Clavu 1g',
    subtitle: 'Chỉ 48,200đ',
    iconPath: 'assets/icons/icon_1.png',
  ),
  ShortcutItem(
    title: 'Phosphalugel',
    subtitle: 'Chỉ 108K',
    iconPath: 'assets/icons/icon_2.png',
  ),
  //thêm item khác nếu cần
  ShortcutItem(
    title: 'Item 7',
    subtitle: 'Chỉ 108K',
    iconPath: 'assets/icons/icon_1.png',
  ),
  ShortcutItem(
    title: 'Item 8',
    subtitle: 'Chỉ 108K',
    iconPath: 'assets/icons/icon_2.png',
  ),
  ShortcutItem(
    title: 'Item 9',
    subtitle: 'Chỉ 108K',
    iconPath: 'assets/icons/icon_4.png',
  ),
  ShortcutItem(
    title: 'Item 10',
    subtitle: 'Chỉ 108K',
    iconPath: 'assets/icons/icon_3.png',
  ),
];
