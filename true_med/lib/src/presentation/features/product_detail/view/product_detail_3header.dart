import 'package:flutter/material.dart';

class ProductDetail3Header extends StatefulWidget {
  final Widget banner; // Banner ở trên cùng
  final double bannerHeight; // Chiều cao banner
  final List<Widget> body; // Nội dung bên dưới banner
  final Widget searchBar; // AppBar search
  final Widget? floatingActions; // Nút Back - Bell - Cart
  final Color appBarColor;
  final double fadeHeight;
  final Future<void> Function()? onRefresh;

  const ProductDetail3Header({
    super.key,
    required this.banner,
    this.bannerHeight = 300,
    required this.body,
    required this.searchBar,
    this.floatingActions,
    this.onRefresh,
    this.fadeHeight = 140,
    this.appBarColor = const Color(0xFF0B4D2C),
  });

  @override
  State<ProductDetail3Header> createState() => _ProductDetail3HeaderState();
}

class _ProductDetail3HeaderState extends State<ProductDetail3Header> {
  double offset = 0;
  //final safeTop = MediaQuery.of(context).padding.top;
  @override
  Widget build(BuildContext context) {
    final safeTop = MediaQuery.of(context).padding.top;
    return RefreshIndicator(
      onRefresh: widget.onRefresh ?? () async {},

      child: MediaQuery.removePadding(
        removeTop: true,
        context: context,

        child: NotificationListener<ScrollNotification>(
          onNotification: (n) {
            setState(() => offset = n.metrics.pixels);
            return false;
          },

          child: Stack(
            children: [
              // =======================================================
              //                  MAIN SCROLL CONTENT
              // =======================================================
              CustomScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                slivers: [
                  // Header rỗng giữ cấu trúc
                  SliverPersistentHeader(
                    pinned: false,
                    delegate: _EmptyHeaderDelegate(),
                  ),

                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        SizedBox(
                          height: safeTop + widget.bannerHeight,
                        ), // CHỪA CHỖ CHO BANNER OVERLAY

                        ...widget.body, // Nội dung phía dưới banner
                      ],
                    ),
                  ),
                ],
              ),

              // =======================================================
              //                     BANNER OVERLAY
              // =======================================================
              Positioned(
                top: 0 + safeTop,
                left: 0,
                right: 0,
                child: SizedBox(
                  height: widget.bannerHeight,
                  width: double.infinity,
                  child: widget.banner,
                ),
              ),

              // =======================================================
              //             FLOATING BUTTONS (BACK – CART – ETC)
              // =======================================================
              if (widget.floatingActions != null)
                Positioned(
                  top: 16,
                  left: 0,
                  right: 0,
                  child: AnimatedOpacity(
                    opacity: offset < 20 ? 1 : 0,
                    duration: const Duration(milliseconds: 200),
                    child: widget.floatingActions!,
                  ),
                ),

              // =======================================================
              //             APPBAR HEIGHT + OPACITY ANIMATION
              // =======================================================
              Positioned(
                top: 0,
                left: 0,
                right: 0,

                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.easeOut,

                  height: offset < 20 ? 0 : 70, // AppBar height dynamic

                  padding: const EdgeInsets.only(top: 28, left: 12, right: 12),

                  decoration: BoxDecoration(
                    color: widget.appBarColor.withOpacity(
                      (offset / widget.fadeHeight).clamp(0, 1),
                    ),
                  ),

                  child: AnimatedOpacity(
                    opacity: offset < 40 ? 0 : 1,
                    duration: const Duration(milliseconds: 250),
                    child: widget.searchBar,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _EmptyHeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  double get minExtent => 0;

  @override
  double get maxExtent => 0;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container();
  }

  @override
  bool shouldRebuild(_EmptyHeaderDelegate oldDelegate) => false;
}
