import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/extensions/app_localization.dart';
import '../../../../data/models/product_model.dart';
import '../../../core/widgets/page_header.dart';
import '../model/shipp_addres_mock.dart';
import 'widget/address_form_section.dart';
import 'widget/contact_info_section.dart';
import 'widget/defaut_addess_title.dart';
import 'widget/shipping_addess_item.dart';

class EditShippingAddressPage extends ConsumerStatefulWidget {
  final int addressId;

  const EditShippingAddressPage({super.key, this.addressId = 0});

  @override
  ConsumerState<EditShippingAddressPage> createState() =>
      _EditShippingAddressPageState();
}

class _EditShippingAddressPageState
    extends ConsumerState<EditShippingAddressPage> {
  late ProductResponseModel product;
  final listAdress = mockAddressData;

  bool get isCreate => widget.addressId == 0;
  final nameCtrl = TextEditingController(text: "Nhà thuốc Minh Châu");
  final phoneCtrl = TextEditingController(text: "0933575056");

  final streetCtrl = TextEditingController();
  bool isDefault = false;

  @override
  void initState() {
    super.initState();
    if (!isCreate) {
      //ref.read(editAddressProvider.notifier).loadAddress(widget.addressId!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: PageHeader(
          title: isCreate
              ? context.locale.addAddress
              : context.locale.editAddress,
          showBack: true,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Add your form fields or widgets here
                    ContactInfoSection(
                      nameController: nameCtrl,
                      phoneController: phoneCtrl,
                    ),
                    const SizedBox(height: 12),
                    AddressFormSection(streetController: streetCtrl),
                    const SizedBox(height: 12),
                    SetDefaultAddressTile(
                      value: isDefault,
                      onChanged: (val) {
                        setState(() => isDefault = val);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(24),
            child: SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Xác nhận'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
