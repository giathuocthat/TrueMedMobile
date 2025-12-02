import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/extensions/app_localization.dart';
import '../../../core/application_state/logout_provider/logout_provider.dart';
import '../../../core/router/routes.dart';
import '../../../core/widgets/loading_indicator.dart';
import 'widget/page_header.dart';

class PromotionPage extends ConsumerStatefulWidget {
  const PromotionPage({super.key});

  @override
  ConsumerState<PromotionPage> createState() => _PromotionPageState();
}

class _PromotionPageState extends ConsumerState<PromotionPage> {
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
          PageHeader(title: context.locale.promotion), // ⭐ đặt header lên đầu

          Expanded(
            // ⭐ nội dung HomePage phía dưới
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(context.locale.promotion),
                  const SizedBox(height: 16),
                  FilledButton(
                    onPressed: () {
                      ref.read(logoutProvider.notifier).call();
                    },
                    child: state.isLoading
                        ? const LoadingIndicator()
                        : Text(context.locale.logout),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
