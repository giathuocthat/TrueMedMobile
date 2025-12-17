import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/extensions/app_localization.dart';
import '../../../../data/models/product_model.dart';
import '../../../../data/models/province_model.dart';
import '../../../../data/models/ward_model.dart';
import '../../../../domain/entities/address_shipping_entity.dart';
import '../../../../domain/entities/province_entity.dart';
import '../../../../domain/entities/ward_entity.dart';
import '../../../core/widgets/page_header.dart';
import '../model/shipp_addres_mock.dart';
import '../riverpod/edit_adress/edit_shipping_address_provider.dart';
import '../riverpod/shipping_address_provider.dart';
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
  bool _initialized = false;
  late ProductResponseModel product;

  bool get isCreate => widget.addressId == 0;

  var nameCtrl = TextEditingController();
  var phoneCtrl = TextEditingController();
  var streetCtrl = TextEditingController();

  bool isDefault = false;

  var provinceId = 0;
  var wardId = 0;
  var nameCity = '';
  var nameWard = '';

  @override
  void initState() {
    super.initState();
    _initialized = false;
    nameCtrl = TextEditingController();
    phoneCtrl = TextEditingController();
    streetCtrl = TextEditingController();

    if (!isCreate) {
      //ref
      ///    .read(editShippingAddressProvider.notifier)
      //     .loadAddress(widget.addressId!);
    }
  }

  @override
  void dispose() {
    nameCtrl.dispose();
    phoneCtrl.dispose();
    streetCtrl.dispose();
    super.dispose();
  }

  void setInitDataFromUI(AddressShippingResponseEntity addressShipEdit) {
    nameCtrl = TextEditingController(text: addressShipEdit.recipientName);
    phoneCtrl = TextEditingController(text: addressShipEdit.phoneNumber);
    streetCtrl = TextEditingController(text: addressShipEdit.addressLine);

    provinceId = addressShipEdit.provinceId;
    wardId = addressShipEdit.wardId;
    nameCity = addressShipEdit.provinceName;
    nameWard = addressShipEdit.wardName;
  }

  @override
  Widget build(BuildContext context) {
    final statePageList = ref.watch(shippingAddressProvider);

    if (!isCreate) {
      final addressShipEdit = statePageList.listAddressShipping!.firstWhere(
        (e) => e.id == widget.addressId,
      );

      if (!_initialized) {
        setInitDataFromUI(addressShipEdit);
        _initialized = true;
      }
    }

    final state = ref.watch(editShippingAddressProvider(provinceId));

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
                                    idSelected: provinceId,
                                  ),
                            );

                        if (result != null) {
                          final province = result as ProvinceResponseModel;
                          if (provinceId != province.id) {
                            setState(() {
                              provinceId = province.id;
                              nameCity = province.name;

                              wardId = 0;
                              nameWard = '';
                            });
                            await ref
                                .read(
                                  editShippingAddressProvider(
                                    provinceId,
                                  ).notifier,
                                )
                                .fetchProvinceDetail(provinceId);
                          }
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
                                    idSelected: wardId,
                                  ),
                            );

                        if (result != null) {
                          setState(() {
                            final ward = result as WardResponseModel;
                            nameWard = ward.name;
                            wardId = ward.id;

                            ref
                                .read(
                                  editShippingAddressProvider(
                                    provinceId,
                                  ).notifier,
                                )
                                .fetchWardDetail(wardId);
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
