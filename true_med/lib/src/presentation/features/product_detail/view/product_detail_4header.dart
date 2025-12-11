import 'package:flutter/material.dart';

class ProductDetail4Header extends StatefulWidget {
  //final Widget banner; // Banner lớn phía trên
  final double bannerHeight;
  final List<Widget> body; // Nội dung bên dưới banner
  final Widget searchBar; // Appbar search
  final Widget? floatingActions; // Back – Cart – Bell
  final Widget footerPayment; // Footer payment cố định đáy
  final Color appBarColor;
  final double fadeHeight;
  final Future<void> Function()? onRefresh;

  const ProductDetail4Header({
    super.key,
    //required this.banner,
    required this.body,
    required this.searchBar,
    required this.footerPayment,
    this.floatingActions,
    this.bannerHeight = 0,
    this.fadeHeight = 140,
    this.appBarColor = const Color(0xFF0B4D2C),
    this.onRefresh,
  });

  @override
  State<ProductDetail4Header> createState() => _ProductDetail4HeaderState();
}

class _ProductDetail4HeaderState extends State<ProductDetail4Header> {
  double offset = 0;

  @override
  Widget build(BuildContext context) {
    final safeTop = MediaQuery.of(context).padding.top;
    final safeBottom = MediaQuery.of(context).padding.bottom;

    return Scaffold(
      body: Stack(
        children: [
          // ==========================================
          //             MAIN SCROLL CONTENT
          // ==========================================
          RefreshIndicator(
            onRefresh: widget.onRefresh ?? () async {},
            child: NotificationListener<ScrollNotification>(
              onNotification: (n) {
                setState(() => offset = n.metrics.pixels);
                return false;
              },
              child: CustomScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                slivers: [
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        // CHỪA CHỖ CHO BANNER
                        // SizedBox(height: widget.bannerHeight),

                        // BODY CONTENT
                        ...widget.body,

                        SizedBox(height: safeBottom + 80), // tránh đè footer
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // ==========================================
          //             BANNER OVERLAY – SÁT TOP
          // ==========================================
          // Positioned(
          //   top: 0,
          //   left: 0,
          //   right: 0,
          //   child: SizedBox(
          //     height: widget.bannerHeight,
          //     width: double.infinity,
          //     child: widget.banner,
          //   ),
          // ),

          // ==========================================
          //       FLOATING BUTTONS (BACK, CART, BELL)
          // ==========================================
          if (widget.floatingActions != null)
            Positioned(
              top: safeTop + 8, // nằm đúng safe area
              left: 0,
              right: 0,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 200),
                opacity: offset < 20 ? 1 : 0,
                child: widget.floatingActions!,
              ),
            ),

          // ==========================================
          //             APPBAR OVERLAY (FADE-IN)
          // ==========================================
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeOut,
              height: offset < 20 ? 0 : 70,
              padding: EdgeInsets.only(top: 28, left: 12, right: 12),
              decoration: BoxDecoration(
                color: widget.appBarColor.withOpacity(
                  (offset / widget.fadeHeight).clamp(0, 1),
                ),
              ),
              child: AnimatedOpacity(
                opacity: offset < 40 ? 0 : 1,
                duration: const Duration(milliseconds: 250),
                child: Row(children: [Expanded(child: widget.searchBar)]),
              ),
            ),
          ),

          // ==========================================
          //               FOOTER PAYMENT FIXED
          // ==========================================
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.only(bottom: safeBottom),
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: Offset(0, -2),
                  ),
                ],
              ),
              child: widget.footerPayment,
            ),
          ),
        ],
      ),
    );
  }
}
