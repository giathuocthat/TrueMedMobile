import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/extensions/app_localization.dart';
import '../../../../../core/extensions/date_time_extension.dart';
import '../../../../../core/extensions/string.dart';
import '../../../../../shared/widget/load_more_footer.dart';
import '../../../../core/base/status.dart';
import '../../../../core/router/routes.dart';
import '../../../../core/widgets/page_header.dart';
import '../../order_list/riverpod/order_list_provider.dart';
import '../../order_list/riverpod/order_list_state.dart';
import '../../order_list/view/widget/order_list_item.dart';
import '../model/mock_order_status_step.dart';
import 'wigget/order_info_section.dart';
import 'wigget/order_timeline.dart';
import 'wigget/payment_info_section.dart';

class OrderDetailPage extends ConsumerStatefulWidget {
  final int orderId;
  const OrderDetailPage({super.key, required this.orderId});

  @override
  ConsumerState<OrderDetailPage> createState() => _OrderDetailPageState();
}

class _OrderDetailPageState extends ConsumerState<OrderDetailPage> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(orderListProvider);

    return Scaffold(
      body: Column(
        children: [
          PageHeader(title: context.locale.notifications, showBack: true),
          Expanded(
            // ⭐ nội dung HomePage phía dưới
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: _buildBody(context, state),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBody(BuildContext context, OrderListState state) {
    if (state.status.isLoading && state.orders.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state.status.isError) {
      return Center(child: Text(state.error ?? 'Có lỗi xảy ra'));
    }

    if (state.orders.isEmpty) {
      return RefreshIndicator(
        onRefresh: () async {
          await ref.read(orderListProvider.notifier).refresh();
        },
        child: ListView(
          children: const [
            SizedBox(height: 200),
            Center(child: Text('Chưa có đơn hàng')),
          ],
        ),
      );
    }
    return RefreshIndicator(
      onRefresh: () async {
        await ref.read(orderListProvider.notifier).refresh();
      },
      child: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                // CHỪA CHỖ CHO BANNER
                //SizedBox(height: widget.bannerHeight),

                // BODY CONTENT
                PaymentInfoSection(),
                const SizedBox(height: 16),
                OrderInfoSection(),
                // Container(
                //   color: Colors.white,
                //   padding: const EdgeInsets.symmetric(
                //     horizontal: 16,
                //     vertical: 12,
                //   ),
                //   child: OrderTimeline(steps: stepComplete),
                // ),

                //OrderTimeline(steps: stepComplete),
                const SizedBox(height: 16),

                //SizedBox(height: safeBottom + 80), // tránh đè footer
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;

    final position = _scrollController.position;

    // Chạm đáy (có buffer 100px cho mượt)
    if (position.pixels >= position.maxScrollExtent - 100) {
      onScrollEnd();
    }
  }

  void onScrollEnd() {
    final notifier = ref.read(orderListProvider.notifier);

    if (notifier.state.hasMore && notifier.state.status != Status.loading) {
      notifier.fetchOrders(loadMore: true);
    }
  }
}

Color orderStatusColor(String status) {
  switch (status) {
    case 'Confirmed':
      return const Color(0xFF1B5E20); // xanh đậm
    //case 'Chờ xác nhận':
    case 'Pending':
      return Colors.orange;
    case 'Cancelled':
    //case 'Đã huỷ':
    default:
      return Colors.grey;
  }
}
