import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/extensions/app_localization.dart';
import '../../../core/application_state/logout_provider/logout_provider.dart';
import '../../../core/router/routes.dart';
import '../../../core/widgets/loading_indicator.dart';
import '../../../core/widgets/page_header.dart';
import 'widget/account_info_view.dart';
import 'widget/member_ship_card.dart';
import 'widget/section_header.dart';
import 'widget/policy_info_section.dart';
import 'widget/support_info_section copy.dart';
import 'widget/utilities_info_view.dart';

class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({super.key});

  @override
  ConsumerState<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  @override
  void initState() {
    super.initState();
    ref.listenManual(logoutProvider, (previous, next) {
      if (next.isSuccess) context.pushReplacementNamed(Routes.login);
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(logoutProvider);

    return Scaffold(
      body: Column(
        children: [
          //PageHeader(title: context.locale.profile), // ⭐ đặt header lên đầu
          PageHeader(
            title: context.locale.profile,
            showBack: true,
          ), // ⭐ đặt header lên đầu
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const MembershipCard(),
                    const SizedBox(height: 18),

                    const SectionHeader(title: 'Thông tin tài khoản'),
                    const AccountInfoView(),

                    const SizedBox(height: 8),
                    const SectionHeader(title: 'Tiện ích'),
                    const UtilitiesInfoSection(),

                    const SizedBox(height: 8),
                    const SectionHeader(title: 'Hỗ trợ'),
                    const SupportInfoSection(),

                    const SizedBox(height: 8),
                    const SectionHeader(title: 'Về chúng tôi'),
                    const PolicyInfoSection(),

                    Divider(height: 1, color: Colors.grey.shade300),
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
