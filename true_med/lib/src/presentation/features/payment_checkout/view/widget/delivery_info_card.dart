import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../../domain/entities/address_shipping_entity.dart';
import '../../../../core/router/routes.dart';

class DeliveryInfoCard extends ConsumerWidget {
  final AddressShippingResponseEntity? address;
  const DeliveryInfoCard({super.key, this.address});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const iconColor = Color(0xFF2E3192); // xanh tím giống hình
    const textColor = Colors.black87;

    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ---------- HEADER ----------
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Thông tin giao hàng',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
              TextButton(
                onPressed: () {
                  context.pushNamed(
                    Routes.shippingAddress,
                    pathParameters: {'addressId': address?.id.toString() ?? ''},
                  );
                },
                child: Text(
                  address == null ? 'Thêm' : 'Sửa',
                  style: const TextStyle(
                    fontSize: 15,
                    color: Color(0xFF1B5E20),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),
          if (address == null)
            const Text(
              'Chưa có địa chỉ giao hàng, vui lòng thêm địa chỉ',
              style: TextStyle(fontSize: 11, color: textColor),
            )
          else ...[
            _InfoRow(
              icon: Icons.person_outline,
              iconColor: iconColor,
              text: address?.recipientName ?? '',
              textColor: textColor,
            ),

            const SizedBox(height: 10),

            // ---------- PHONE ----------
            _InfoRow(
              icon: Icons.phone_outlined,
              iconColor: iconColor,
              text: address?.phoneNumber ?? '',
              textColor: textColor,
            ),

            const SizedBox(height: 10),

            // ---------- ADDRESS ----------
            _InfoRow(
              icon: Icons.location_on_outlined,
              iconColor: iconColor,
              text: address?.fullAddress ?? '',
              textColor: textColor,
              maxLines: 3,
            ),
          ],
          // ---------- NAME ----------
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String text;
  final Color textColor;
  final int maxLines;

  const _InfoRow({
    required this.icon,
    required this.iconColor,
    required this.text,
    required this.textColor,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: maxLines > 1
          ? CrossAxisAlignment.start
          : CrossAxisAlignment.center,
      children: [
        Icon(icon, size: 22, color: iconColor),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            maxLines: maxLines,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 11, color: textColor, height: 1.4),
          ),
        ),
      ],
    );
  }
}
