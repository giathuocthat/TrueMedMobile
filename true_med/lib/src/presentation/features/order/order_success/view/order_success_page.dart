import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/base/status.dart';
import '../../../../core/router/interface_app_navigator.dart';
import '../../../../core/router/navigation_args/order_list_navigation_args.dart';
import '../../../../core/router/routes.dart';
import '../../order_list/riverpod/order_list_provider.dart';
import '../../order_list/riverpod/order_list_state.dart';
import '../../../../../shared/widget/btn_footer.dart';
import 'widget/info_notice_box.dart';
import 'widget/order_success_header.dart';
import 'widget/order_summary_card.dart';

class OrderSuccessPage extends ConsumerStatefulWidget {
  final int orderId;
  const OrderSuccessPage({super.key, required this.orderId});

  @override
  ConsumerState<OrderSuccessPage> createState() => _OrderSuccessPageState();
}

class _OrderSuccessPageState extends ConsumerState<OrderSuccessPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(orderListProvider);
    return Scaffold(
      body: Column(
        children: [
          const OrderSuccessHeader(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: _buildBody(context, state),
            ),
          ),
          SizedBox(
            height: 100,
            child: BottonFooter(
              text: 'Chi tiết đơn hàng',
              onCallback: () {
                // pop 3 lần để về trang chi tiết đơn hàng
                // vì thứ tự là: CartOrderPage -> PaymentCheckoutPage -> OrderSuccessPage
                // context.pop();
                // context.pop();
                // context.pop();
                // // sau đó điều hướng đến trang list đơn hàng

                // //select list oder by id
                // // sau đó mở detail
                // context.pushNamed(
                //   Routes.orderDetail,
                //   pathParameters: {'orderId': '${widget.orderId}'},
                // );
                context.goNamed(
                  Routes.myOrder,
                  extra: OrderListNavigationArgs(openOrderId: widget.orderId),
                  // AppNavigator.goToOrderDetail(
                  //   context,
                  //   orderId: widget.orderId,
                  // ),
                );
              },
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
      return Center(child: Text('Chưa có thông tin đơn hàng'));
    }
    return CustomScrollView(
      physics: AlwaysScrollableScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const InfoNoticeBox(
                  text:
                      'Hoá đơn bản giấy của đơn hàng trước sẽ được giao chung với đơn hàng này.',
                ),
              ),

              const OrderSummaryCard(),
            ],
          ),
        ),
      ],
    );
  }
}
