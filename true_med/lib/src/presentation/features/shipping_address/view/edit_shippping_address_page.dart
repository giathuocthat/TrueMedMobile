import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/extensions/app_localization.dart';
import '../../../../data/models/product_model.dart';
import '../../../../data/models/province_model.dart';
import '../../../../data/models/ward_model.dart';
import '../../../../domain/entities/province_entity.dart';
import '../../../../domain/entities/ward_entity.dart';
import '../../../core/widgets/page_header.dart';
import '../model/shipp_addres_mock.dart';
import '../riverpod/edit_adress/edit_shipping_address_provider.dart';
import 'widget/address_form_section.dart';
import 'widget/adress_picker_sheet.dart';
import 'widget/contact_info_section.dart';
import 'widget/defaut_addess_title.dart';

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

  var provinceId = 0;
  var districtId = 0;
  var nameCity = '';
  var nameWard = '';

  @override
  void initState() {
    super.initState();
    if (!isCreate) {
      //ref
      ///    .read(editShippingAddressProvider.notifier)
      //     .loadAddress(widget.addressId!);
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(editShippingAddressProvider);
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
                    AddressFormSection(
                      streetController: streetCtrl,
                      onProvinceTap: () async {
                        final result =
                            await showModalBottomSheet<ProvinceResponseEntity>(
                              context: context,
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              builder: (_) =>
                                  AdressPickerSheet<ProvinceResponseEntity>(
                                    items: state.listProvince,
                                    hint: 'Tỉnh / Thành phố',
                                  ),
                            );

                        if (result != null) {
                          setState(() {
                            final province = result as ProvinceResponseModel;
                            nameCity = province.name;
                            final id = province.id;

                            ref
                                .read(editShippingAddressProvider.notifier)
                                .fetchProvinceDetail(id);
                          });
                        }
                      },
                      onWardTap: () async {
                        final result =
                            await showModalBottomSheet<WardResponseEntity>(
                              context: context,
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              builder: (_) =>
                                  AdressPickerSheet<WardResponseEntity>(
                                    items: state.listWard,
                                    hint: 'Phường / Xã',
                                  ),
                            );

                        if (result != null) {
                          setState(() {
                            final ward = result as WardResponseModel;
                            nameWard = ward.name;
                            final id = ward.id;

                            ref
                                .read(editShippingAddressProvider.notifier)
                                .fetchWardDetail(id);
                          });
                        }
                      },
                      province: nameCity != '' ? nameCity : null,
                      ward: nameWard != '' ? nameWard : null,
                    ),
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
