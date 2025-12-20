import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/extensions/app_localization.dart';
import '../../../../../core/extensions/date_time_extension.dart';
import '../../../../../core/extensions/string.dart';
import '../../../../../shared/widget/load_more_footer.dart';
import '../../../../core/base/status.dart';
import '../../../../core/widgets/page_header.dart';
import '../riverpod/order_list_provider.dart';
import '../riverpod/order_list_state.dart';
import 'widget/order_list_item.dart';

class OrderListPage extends ConsumerStatefulWidget {
  const OrderListPage({super.key});

  @override
  ConsumerState<OrderListPage> createState() => _OrderListPageState();
}

class _OrderListPageState extends ConsumerState<OrderListPage> {
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
          PageHeader(title: context.locale.myOrder), // ⭐ đặt header lên đầu

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
    // if (state.status.isLoading) {
    //   return const Center(child: CircularProgressIndicator());
    // }
    if (state.status.isLoading && state.orders.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state.status.isError) {
      return Center(child: Text(state.error ?? 'Có lỗi xảy ra'));
    }

    if (state.orders.isEmpty) {
      return const Center(child: Text('Chưa có đơn hàng'));
    }

    return ListView.builder(
      controller: _scrollController, // ⭐ QUAN TRỌNG
      padding: const EdgeInsets.only(bottom: 16),
      //itemCount: state.orders.length,
      itemCount: state.orders.length + (state.isLoadingMore ? 1 : 0),
      itemBuilder: (context, index) {
        // ⭐ Footer loading nhỏ

        if (index == state.orders.length && state.isLoadingMore) {
          return const LoadMoreFooter();
        }
        final order = state.orders[index];

        return OrderListItem(
          orderCode: order.orderNumber,
          statusText: order.orderStatus,
          statusColor: orderStatusColor(order.orderStatus),
          productCount: 99,
          totalQuantity: 19,
          totalPrice: order.totalAmount.toCurrency(true),
          timeText: order.createdDate?.hhmmss_ddMMyyyy ?? '',
        );
      },
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
