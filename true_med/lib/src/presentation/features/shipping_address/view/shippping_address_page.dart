import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/extensions/app_localization.dart';
import '../../../../data/models/product_model.dart';
import '../../../core/router/routes.dart';
import '../../../core/widgets/page_header.dart';
import '../model/shipp_addres_mock.dart';
import 'widget/shipping_addess_item.dart';

class ShippingAddressPage extends ConsumerStatefulWidget {
  final int addressId;
  const ShippingAddressPage({super.key, required this.addressId});

  @override
  ConsumerState<ShippingAddressPage> createState() =>
      _ShippingAddressPageState();
}

class _ShippingAddressPageState extends ConsumerState<ShippingAddressPage> {
  late ProductResponseModel product;
  final listAdress = mockAddressData;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: PageHeader(title: context.locale.address, showBack: true),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: listAdress.length,
              itemBuilder: (context, index) {
                final item = listAdress[index];
                return Container(
                  padding: const EdgeInsets.all(6),
                  color: Colors.white,
                  child: ShippingAddressItem(
                    address: item,
                    isSelected: item.id == widget.addressId,
                  ),
                );
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(24),
            child: SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () =>
                    context.pushNamed(Routes.createShippingAddress),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add, size: 20),
                    SizedBox(width: 8),
                    Text('Thêm địa chỉ mới'),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
