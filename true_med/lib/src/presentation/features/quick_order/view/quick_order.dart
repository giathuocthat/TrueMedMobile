import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/extensions/app_localization.dart';
import '../../../core/application_state/logout_provider/logout_provider.dart';
import '../../../core/router/routes.dart';
import '../../../core/widgets/loading_indicator.dart';

class QuickOrderPage extends ConsumerStatefulWidget {
  const QuickOrderPage({super.key});

  @override
  ConsumerState<QuickOrderPage> createState() => _QuickOrderPageState();
}

class _QuickOrderPageState extends ConsumerState<QuickOrderPage> {
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
          Expanded(
            // ⭐ nội dung HomePage phía dưới
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(context.locale.home),
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
