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

  // @override
  // Widget build(BuildContext context) {
  //   return NotificationListener<ScrollNotification>(
  //     onNotification: (n) {
  //       if (mounted) {
  //         setState(() => offset = n.metrics.pixels);
  //       }
  //       return true;
  //     },
  //     child: CustomScrollView(
  //       slivers: [
  //         // ------------------- APPBAR ẨN / HIỆN -------------------
  //         SliverAppBar(
  //           pinned: true,
  //           backgroundColor: widget.appBarColor.withOpacity(
  //             (offset / widget.fadeHeight).clamp(0, 1),
  //           ),
  //           elevation: 0,
  //           expandedHeight: 0,

  //           // 💥 FIX: xoá chiều cao AppBar mặc định
  //           // 💥 CHỈNH CHIỀU CAO DYNAMIC
  //           toolbarHeight: offset < 20 ? 0 : 56,
  //           leading: _fadeButton(
  //             offset > 30,
  //             IconButton(
  //               icon: const Icon(Icons.arrow_back, color: Colors.white),
  //               onPressed: () => Navigator.pop(context),
  //             ),
  //           ),
  //           actions: [
  //             _fadeButton(
  //               offset > 30,
  //               const Padding(
  //                 padding: EdgeInsets.only(right: 12),
  //                 child: Icon(Icons.notifications_none, color: Colors.white),
  //               ),
  //             ),
  //             _fadeButton(
  //               offset > 30,
  //               const Padding(
  //                 padding: EdgeInsets.only(right: 12),
  //                 child: Icon(
  //                   Icons.shopping_cart_outlined,
  //                   color: Colors.white,
  //                 ),
  //               ),
  //             ),
  //           ],
  //           title: Opacity(
  //             opacity: (offset / 120).clamp(0, 1),
  //             child: widget.searchBar,
  //           ),
  //         ),

  //         // ------------------- NỘI DUNG PHÍA DƯỚI -------------------
  //         SliverToBoxAdapter(
  //           child: Column(
  //             children: [
  //               // Nút nổi (chỉ hiển thị khi chưa scroll)
  //               if (widget.floatingActions != null)
  //                 AnimatedOpacity(
  //                   duration: const Duration(milliseconds: 200),
  //                   opacity: offset < 30 ? 1 : 0,
  //                   child: widget.floatingActions!,
  //                 ),

  //               // Banner sản phẩm
  //               widget.banner,
  //             ],
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // ========================================================
        //                   SCROLL VIEW BÊN DƯỚI
        // ========================================================
        NotificationListener<ScrollNotification>(
          onNotification: (n) {
            if (mounted) setState(() => offset = n.metrics.pixels);
            return true;
          },

          child: CustomScrollView(
            slivers: [
              // Banner và content bên dưới
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    // Floating buttons (chỉ hiển thị khi chưa scroll)
                    if (widget.floatingActions != null)
                      const SizedBox(height: 12),

                    widget.banner, // <-- BANNER SÁT TOP 100%
                  ],
                ),
              ),
            ],
          ),
        ),

        // ========================================================
        //                   APPBAR ĐÈ LÊN (OVERLAY)
        // ========================================================
        Positioned(
          top: 0,
          left: 0,
          right: 0,

          child: Container(
            color: widget.appBarColor.withOpacity(
              (offset / widget.fadeHeight).clamp(0, 1),
            ),

            child: SafeArea(
              bottom: false,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 180),
                height: offset < 20 ? 0 : 56,

                child: Row(
                  children: [
                    // LEADING
                    AnimatedOpacity(
                      duration: const Duration(milliseconds: 150),
                      opacity: offset > 30 ? 1 : 0,
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),

                    Expanded(
                      child: Opacity(
                        opacity: (offset / 120).clamp(0, 1),
                        child: widget.searchBar,
                      ),
                    ),

                    // ACTIONS
                    Row(
                      children: [
                        AnimatedOpacity(
                          duration: const Duration(milliseconds: 150),
                          opacity: offset > 30 ? 1 : 0,
                          child: const Padding(
                            padding: EdgeInsets.only(right: 12),
                            child: Icon(
                              Icons.notifications_none,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        AnimatedOpacity(
                          duration: const Duration(milliseconds: 150),
                          opacity: offset > 30 ? 1 : 0,
                          child: const Padding(
                            padding: EdgeInsets.only(right: 12),
                            child: Icon(
                              Icons.shopping_cart_outlined,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),

        // ========================================================
        // FLOATING BUTTONS OVERLAY (NGAY TRÊN BANNER)
        // ========================================================
        if (widget.floatingActions != null)
          Positioned(
            top: 12,
            left: 0,
            right: 0,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 200),
              opacity: offset < 30 ? 1 : 0,
              child: widget.floatingActions!,
            ),
          ),
      ],
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

// class Product2DetailPage extends StatelessWidget {
//   final int productId;

//   const Product2DetailPage({super.key, required this.productId});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ProductDetailHeader(
//         fadeHeight: 140,

//         searchBar: Container(
//           height: 40,
//           padding: const EdgeInsets.symmetric(horizontal: 12),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(22),
//           ),
//           child: Row(
//             children: const [
//               Icon(Icons.search, color: Colors.grey),
//               SizedBox(width: 8),
//               Text("Tìm kiếm", style: TextStyle(color: Colors.grey)),
//             ],
//           ),
//         ),

//         floatingActions: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             _btn(Icons.arrow_back),
//             Row(
//               children: [
//                 _btn(Icons.notifications_none),
//                 const SizedBox(width: 10),
//                 _btn(Icons.shopping_cart_outlined),
//               ],
//             ),
//           ],
//         ),

//         banner: Column(
//           children: [
//             _img(),
//             const SizedBox(height: 12),
//             _img(),
//             const SizedBox(height: 12),
//             _img(),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _img() => Image.network(
//     "https://raw.githubusercontent.com/TaqBostan/content/refs/heads/main/labeled-2.png",
//     height: 280,
//     width: double.infinity,
//     fit: BoxFit.cover,
//   );

//   static Widget _btn(IconData icon) {
//     return Container(
//       width: 38,
//       height: 38,
//       decoration: BoxDecoration(
//         color: Colors.black.withOpacity(0.06),
//         shape: BoxShape.circle,
//       ),
//       child: Icon(icon, color: Colors.black54),
//     );
//   }
// }

// //import 'package:flutter/material.dart';

// class ProductDetail2Header extends StatefulWidget {
//   final Widget banner; // Ảnh sản phẩm / carousel
//   final Widget searchBar; // Thanh tìm kiếm trong AppBar trên
//   final Widget? floatingActions; // Nút nổi (Back – Bell – Cart)
//   final double fadeHeight; // Scroll bao nhiêu thì AppBar hiện rõ
//   final Color appBarColor; // Màu nền AppBar
//   final Future<void> Function()? onRefresh;

//   const ProductDetail2Header({
//     super.key,
//     required this.banner,
//     required this.searchBar,
//     this.floatingActions,
//     this.fadeHeight = 140,
//     this.appBarColor = const Color(0xFF0B4D2C),
//     this.onRefresh,
//   });

//   @override
//   State<ProductDetail2Header> createState() => _ProductDetail2HeaderState();
// }

// class _ProductDetail2HeaderState extends State<ProductDetail2Header> {
//   double offset = 0;

//   @override
//   Widget build(BuildContext context) {
//     return RefreshIndicator(
//       onRefresh: widget.onRefresh ?? () async {},
//       child: MediaQuery.removePadding(
//         removeTop: true,
//         context: context,

//         child: NotificationListener<ScrollNotification>(
//           onNotification: (n) {
//             if (mounted) {
//               setState(() => offset = n.metrics.pixels);
//             }
//             return false;
//           },

//           child: Stack(
//             children: [
//               // ----------------------------------------------------------
//               //                      MAIN SCROLL VIEW
//               // ----------------------------------------------------------
//               CustomScrollView(
//                 physics: const AlwaysScrollableScrollPhysics(),
//                 slivers: [
//                   // Header rỗng → không đẩy layout
//                   SliverPersistentHeader(
//                     pinned: false,
//                     delegate: _EmptyHeaderDelegate(),
//                   ),

//                   SliverToBoxAdapter(
//                     child: Column(
//                       children: [
//                         if (widget.floatingActions != null)
//                           const SizedBox(height: 60), // chừa chỗ cho nút nổi

//                         widget.banner, // Banner sát top 100%
//                       ],
//                     ),
//                   ),
//                 ],
//               ),

//               // ----------------------------------------------------------
//               //                   FLOATING BUTTONS (BACK – CART)
//               // ----------------------------------------------------------
//               if (widget.floatingActions != null)
//                 Positioned(
//                   top: 12,
//                   left: 0,
//                   right: 0,
//                   child: AnimatedOpacity(
//                     opacity: offset < 20 ? 1 : 0,
//                     duration: const Duration(milliseconds: 200),
//                     child: widget.floatingActions!,
//                   ),
//                 ),

//               // ----------------------------------------------------------
//               //                 APPBAR ANIMATION (HEIGHT + OPACITY)
//               // ----------------------------------------------------------
//               Positioned(
//                 top: 0,
//                 left: 0,
//                 right: 0,
//                 child: AnimatedContainer(
//                   duration: const Duration(milliseconds: 220),
//                   curve: Curves.easeOut,

//                   // Height dynamic → tránh giật
//                   height: offset < 10 ? 0 : 70,

//                   padding: const EdgeInsets.only(top: 28, left: 12, right: 12),

//                   decoration: BoxDecoration(
//                     color: widget.appBarColor.withOpacity(
//                       (offset / widget.fadeHeight).clamp(0, 1),
//                     ),
//                   ),

//                   child: AnimatedOpacity(
//                     duration: const Duration(milliseconds: 220),
//                     opacity: offset < 40 ? 0 : 1,
//                     child: widget.searchBar,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// // Header rỗng để giữ cấu trúc Sliver nhưng không đẩy nội dung
// class _EmptyHeaderDelegate extends SliverPersistentHeaderDelegate {
//   @override
//   double get minExtent => 0;

//   @override
//   double get maxExtent => 0;

//   @override
//   Widget build(
//     BuildContext context,
//     double shrinkOffset,
//     bool overlapsContent,
//   ) {
//     return Container(); // Không chiếm không gian
//   }

//   @override
//   bool shouldRebuild(_EmptyHeaderDelegate oldDelegate) => false;
// }
