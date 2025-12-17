import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../domain/entities/address_shipping_entity.dart';
import '../../../../core/router/routes.dart';

class ShippingAddressItem extends StatelessWidget {
  final bool isSelected;
  final bool isDefault;
  final int index;
  final AddressShippingResponseEntity address;

  const ShippingAddressItem({
    super.key,
    this.index = 0,
    this.isSelected = false,
    this.isDefault = false,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pop();
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ---------- HEADER ----------
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  isSelected
                      ? Icons.radio_button_checked
                      : Icons.radio_button_off,
                  color: Colors.green.shade700,
                ),
                const SizedBox(width: 8),

                Text(
                  "Thông tin giao hàng ${index}",
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: 8),
                if (address.isDefault) _defaultBadge(),

                const SizedBox(width: 8),
                const Spacer(),

                TextButton(
                  onPressed: () {
                    context.pushNamed(
                      Routes.editShippingAddress,
                      pathParameters: {'addressId': address.id.toString()},
                    );
                  },
                  child: const Text(
                    'Sửa',
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFF1B5E20),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            // ---------- NAME ----------
            _infoRow(
              icon: Icons.person_outline,
              text: "${address.recipientName}",
            ),

            const SizedBox(height: 8),

            // ---------- PHONE ----------
            _infoRow(
              icon: Icons.phone_outlined,
              text: "${address.phoneNumber}",
            ),

            const SizedBox(height: 8),

            // ---------- ADDRESS ----------
            _infoRow(
              icon: Icons.location_on_outlined,
              text: "${address.fullAddress}",
            ),
          ],
        ),
      ),
    );
  }

  // ---------- COMPONENTS ----------

  Widget _defaultBadge() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.orange),
        borderRadius: BorderRadius.circular(6),
      ),
      child: const Text(
        "Mặc định",
        style: TextStyle(
          fontSize: 11,
          color: Colors.orange,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _infoRow({required IconData icon, required String text}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 18, color: Colors.indigo.shade700),
        const SizedBox(width: 8),
        Expanded(
          child: Text(text, style: const TextStyle(fontSize: 11, height: 1.4)),
        ),
      ],
    );
  }
}
