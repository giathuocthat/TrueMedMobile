import 'package:flutter/material.dart';

class ProductDetailHeader extends StatefulWidget {
  final Widget banner; // Ảnh sản phẩm hoặc Carousel
  final Widget? floatingActions; // Nút nổi (back, bell, cart)
  final Widget searchBar; // Ô tìm kiếm khi scroll xuống
  final double fadeHeight; // Scroll bao nhiêu thì hiện AppBar
  final Color appBarColor;
  final Future<void> Function()? onRefresh;

  const ProductDetailHeader({
    super.key,
    required this.banner,
    required this.searchBar,
    this.floatingActions,
    this.fadeHeight = 140,
    this.appBarColor = const Color(0xFF0B4D2C),
    this.onRefresh,
  });

  @override
  State<ProductDetailHeader> createState() => _ProductDetailHeaderState();
}

class _ProductDetailHeaderState extends State<ProductDetailHeader> {
  double offset = 0;

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (n) {
        if (mounted) {
          setState(() => offset = n.metrics.pixels);
        }
        return true;
      },
      child: CustomScrollView(
        slivers: [
          // ------------------- APPBAR ẨN / HIỆN -------------------
          SliverAppBar(
            pinned: true,
            backgroundColor: widget.appBarColor.withOpacity(
              (offset / widget.fadeHeight).clamp(0, 1),
            ),
            elevation: 0,
            expandedHeight: 0,
            leading: _fadeButton(
              offset > 30,
              IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            actions: [
              _fadeButton(
                offset > 30,
                const Padding(
                  padding: EdgeInsets.only(right: 12),
                  child: Icon(Icons.notifications_none, color: Colors.white),
                ),
              ),
              _fadeButton(
                offset > 30,
                const Padding(
                  padding: EdgeInsets.only(right: 12),
                  child: Icon(
                    Icons.shopping_cart_outlined,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
            title: Opacity(
              opacity: (offset / 120).clamp(0, 1),
              child: widget.searchBar,
            ),
          ),

          // ------------------- NỘI DUNG PHÍA DƯỚI -------------------
          SliverToBoxAdapter(
            child: Column(
              children: [
                // Nút nổi (chỉ hiển thị khi chưa scroll)
                if (widget.floatingActions != null)
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 200),
                    opacity: offset < 30 ? 1 : 0,
                    child: widget.floatingActions!,
                  ),

                // Banner sản phẩm
                widget.banner,
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _fadeButton(bool show, Widget child) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 150),
      opacity: show ? 1 : 0,
      child: child,
    );
  }
}
