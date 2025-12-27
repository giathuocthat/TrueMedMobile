import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../domain/entities/address_entity.dart';
import '../../../../domain/entities/province_entity.dart';
import '../../../../domain/entities/ward_entity.dart';
import '../../../../domain/enum/app_enums.dart';
import '../../authentication/registration/riverpod/register_provider.dart';
import '../../authentication/registration/riverpod/register_state.dart';
import '../../authentication/registration/view/widget/provice_header_section.dart';
import '../../authentication/registration/view/widget/register_btnNext_footer.dart';
import '../../authentication/registration/view/widget/register_navigation_bar.dart';
import '../riverpod/province/province_address_provider.dart';

class SelectProvinceDistrictPage extends ConsumerStatefulWidget {
  final SelectLocationMode mode;
  final int? provinceId;
  final int? wardId;

  const SelectProvinceDistrictPage({
    super.key,
    this.provinceId,
    this.wardId,
    required this.mode,
  });

  //bool get isProvince => mode == SelectLocationMode.province;

  @override
  ConsumerState<SelectProvinceDistrictPage> createState() =>
      _SelectProvinceDistrictPageState();
}

class _SelectProvinceDistrictPageState
    extends ConsumerState<SelectProvinceDistrictPage> {
  static const navBarHeight = 52.0;
  static const footerBuffer = 120.0; // 🔥 CHỈ buffer mềm

  late TextEditingController _searchCtrl;
  late List<ProvinceResponseEntity> _filteredProvince;
  late List<WardResponseEntity> _filteredWard;

  late List<ProvinceResponseEntity> _listProvince;
  late List<WardResponseEntity> _listWard;

  late ProvinceResponseEntity? _province;
  late WardResponseEntity? _ward;
  late SelectLocationMode mode;
  //bool get isProvince => widget.isProvince;
  late bool isProvince;
  int? provinceId;
  int? wardId;

  @override
  void initState() {
    super.initState();
    initData();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(provinceAddressProvider(0).notifier).fetchListProvince();
    });
  }

  void initData() {
    _searchCtrl = TextEditingController();

    // Khởi tạo dữ liệu ban đầu nếu cần
    provinceId = widget.provinceId;
    wardId = widget.wardId;
    mode = widget.mode;
    isProvince = mode == SelectLocationMode.province;

    _province = null;
    _ward = null;
    _listProvince = [];
    _listWard = [];

    _filteredProvince = _listProvince.map((e) => e).toList();
    _filteredWard = _listWard.map((e) => e).toList();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _clearSearch() {
    _searchCtrl.clear();
    _onSearch('');
  }

  void _onSearch(String keyword) {
    final normalizedKeyword = removeVietnameseDiacritics(keyword).toLowerCase();
    setState(() {
      if (isProvince) {
        _filteredProvince = _listProvince
            .where((e) => e.normalizedName.contains(normalizedKeyword))
            .toList();
      } else {
        _filteredWard = _listWard
            .where((e) => e.normalizedName.contains(normalizedKeyword))
            .toList();
      }
    });
  }

  void _initFilter(RegisterState state) {
    if (mode == SelectLocationMode.ward && _province == null) {
      _province = state.provinceSelected;
      provinceId = _province?.id;
      mode = SelectLocationMode.ward;
      isProvince = false;
      //fetch lai ds ward
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref
            .read(provinceAddressProvider(0).notifier)
            .fetchProvinceDetail(_province!.id);
      });
    }
    if (_filteredProvince.isEmpty) {
      _filteredProvince = [..._listProvince];
    }

    if (_filteredWard.isEmpty) {
      _filteredWard = [..._listWard];
    }
  }

  void _loadWardByProvince(int provinceId) {
    // Load lại danh sách quận/huyện theo tỉnh/thành đã chọn
    ref
        .read(provinceAddressProvider(0).notifier)
        .fetchProvinceDetail(provinceId);

    setState(() {
      // set filtered lại
      _clearSearch();
      mode = SelectLocationMode.ward;
      isProvince = false;
      _province = _listProvince.firstWhere((e) => e.id == provinceId);
    });
  }

  void _chooseAdress(int wardId) {
    _ward = _listWard.firstWhere((e) => e.id == wardId);
    ref
        .read(registerProvider.notifier)
        .updateBussinessAddress(_province, _ward);
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    final navBarTotalHeight = navBarHeight + MediaQuery.of(context).padding.top;
    final state = ref.watch(provinceAddressProvider(0));
    final stateRes = ref.watch(registerProvider);

    _listProvince = state.listProvince;
    _listWard = state.listWard;

    _initFilter(stateRes);

    return Scaffold(
      body: Stack(
        fit: StackFit.expand, // 🔥 ép full size
        children: [
          // ---------- BACKGROUND ----------
          Image.asset(AppAssets.bgImage, fit: BoxFit.cover),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // -------- FIXED HEADER --------
              Padding(
                padding: EdgeInsets.fromLTRB(16, navBarTotalHeight + 32, 16, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: ProvinceHeaderSection(
                        valueProvice: _province?.name,
                        valueWard: _ward?.name,
                      ),
                    ),

                    const SizedBox(height: 24),

                    Row(
                      children: [
                        Expanded(
                          child:
                              /// SEARCH
                              TextField(
                                controller: _searchCtrl,
                                onChanged: _onSearch,
                                textAlign: TextAlign.start,

                                //value: _searchCtrl.text,
                                decoration: InputDecoration(
                                  hintText: 'Tìm kiếm',
                                  prefixIcon: Container(
                                    width: 40,
                                    height: 40,
                                    alignment: Alignment.center,
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Image.asset(
                                        AppAssets.iconSearch,
                                        width: 20,
                                        height: 20,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),
              // -------- SCROLLABLE LIST --------
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
                  itemCount: isProvince
                      ? _filteredProvince.length
                      : _filteredWard.length,
                  itemBuilder: (context, index) {
                    final item = isProvince
                        ? _filteredProvince[index]
                        : _filteredWard[index];

                    return GestureDetector(
                      onTap: () {
                        if (isProvince) {
                          setState(() {
                            provinceId = item.id;
                          });
                        } else {
                          setState(() {
                            wardId = item.id;
                          });
                        }
                      },
                      child: Column(
                        children: [
                          Container(
                            height: 42,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10.0,
                            ),
                            decoration: BoxDecoration(
                              color: item.id == provinceId || item.id == wardId
                                  ? AppColors.bgBrandPrimary
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  item.name,
                                  style: AppTextStyles.bodyTextSmBold.copyWith(
                                    color: AppColors.textSecondary,
                                  ),
                                ),
                                item.id == provinceId || item.id == wardId
                                    ? Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0,
                                        ),
                                        child: Image.asset(
                                          AppAssets.iconCheckedBox,
                                          width: 20,
                                          height: 20,
                                          fit: BoxFit.contain,
                                        ),
                                      )
                                    : const SizedBox.shrink(),
                              ],
                            ),
                          ),
                          const Divider(
                            height: 1,
                            color: AppColors.borderLight100,
                          ),
                          //borderLight100
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: footerBuffer),
            ],
          ),

          const Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: SafeArea(
              bottom: false,
              child: SizedBox(
                height: navBarHeight,
                child: RegisterNavigationBar(),
              ),
            ),
          ),

          // ---------- FIXED FOOTER ----------
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: ResgisterButtonNextFooter(
              textDisplay: mode == SelectLocationMode.province
                  ? 'Tiếp tục'
                  : 'Hoàn thành',
              onNext: provinceId != null
                  ? () {
                      if (mode == SelectLocationMode.province) {
                        _loadWardByProvince(provinceId!);
                      } else {
                        _chooseAdress(wardId!);
                      }
                    }
                  : null,
            ),
          ),
        ],
      ),
    );
  }
}
