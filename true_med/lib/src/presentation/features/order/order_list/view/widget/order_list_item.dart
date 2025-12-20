import 'package:flutter/material.dart';

class OrderListItem extends StatelessWidget {
  const OrderListItem({
    super.key,
    required this.orderCode,
    required this.statusText,
    required this.statusColor,
    required this.productCount,
    required this.totalQuantity,
    required this.totalPrice,
    required this.timeText,
  });

  final String orderCode;
  final String statusText;
  final Color statusColor;
  final int productCount;
  final int totalQuantity;
  final String totalPrice;
  final String timeText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8), // bo tròn đều
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.06),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: _buildContent(context),
          ),
          // Status line full height
          Positioned.fill(
            left: 0,
            top: 0,
            bottom: 0,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                width: 4,
                decoration: BoxDecoration(
                  color: statusColor,
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      statusColor.withOpacity(0.65),
                      statusColor.withOpacity(0.95),
                    ],
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    bottomLeft: Radius.circular(8),
                  ),
                  // boxShadow: [
                  //   BoxShadow(
                  //     color: statusColor.withOpacity(0.25),
                  //     blurRadius: 2,
                  //     offset: const Offset(1, 0),
                  //   ),
                  // ],
                ),
              ),
            ),
          ),
        ],
      ),
    );

    // return Container(
    //   margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
    //   padding: const EdgeInsets.all(8),
    //   decoration: BoxDecoration(
    //     color: Colors.white,
    //     borderRadius: BorderRadius.circular(8),
    //     boxShadow: [
    //       BoxShadow(
    //         color: Colors.black.withOpacity(0.06),
    //         blurRadius: 10,
    //         offset: const Offset(0, 4),
    //       ),
    //     ],
    //   ),
    //   child: ,
    // );
  }

  Widget _buildContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min, // ⭐ QUAN TRỌNG
      children: [
        // ===== HEADER =====
        Row(
          children: [
            Text(
              '#$orderCode',
              style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            Row(
              children: [
                const Icon(Icons.access_time, size: 16, color: Colors.grey),
                const SizedBox(width: 4),
                Text(
                  timeText,
                  style: const TextStyle(fontSize: 11, color: Colors.grey),
                ),
              ],
            ),
          ],
        ),

        const SizedBox(height: 12),
        Divider(color: Colors.grey.shade300, height: 1),
        const SizedBox(height: 12),

        // ===== STATUS =====
        Row(
          children: [
            Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: statusColor,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              statusText,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w500,
                color: statusColor,
              ),
            ),
          ],
        ),

        const SizedBox(height: 8),
        Row(
          children: [
            const Text(
              'Sản phẩm: ',
              style: TextStyle(fontSize: 11, color: Colors.black87),
            ),
            Text(
              '$productCount',
              style: const TextStyle(
                fontSize: 11,
                color: Colors.black87,
                fontWeight: FontWeight.bold,
              ),
            ),

            const Text(
              ' - Tổng SL: ',
              style: TextStyle(fontSize: 11, color: Colors.black87),
            ),
            Text(
              '$totalQuantity',
              style: const TextStyle(
                fontSize: 11,
                color: Colors.black87,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),

        const SizedBox(height: 6),

        // ===== PRICE =====
        Text(
          totalPrice,
          style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
