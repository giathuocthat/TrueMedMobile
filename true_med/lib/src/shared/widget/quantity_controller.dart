import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/product_entity.dart';
import '../../presentation/features/application/cart/riverpod/cart_provider.dart';

class TextQuantityControl extends ConsumerStatefulWidget {
  const TextQuantityControl({super.key, required this.product});

  final ProductResponseEntity product;

  @override
  ConsumerState<TextQuantityControl> createState() =>
      _TextQuantityControlState();
}

class _TextQuantityControlState extends ConsumerState<TextQuantityControl> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();

    // lấy số lượng ban đầu từ cart
    final initialQty = ref.read(
      cartProvider.select((s) => s.quantityOf(widget.product.id)),
    );

    _controller = TextEditingController(text: initialQty.toString());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // void _onSubmitted(String value) {
  //   final qty = int.tryParse(value) ?? 0;
  //   ref.read(cartProvider.notifier).setQuantity(widget.product, qty);
  // }

  @override
  Widget build(BuildContext context) {
    // có thể cần quantity ở đây nếu bạn disable nút trừ khi = 0
    final quantity = ref.watch(
      cartProvider.select((s) => s.quantityOf(widget.product.id)),
    );

    // lắng nghe thay đổi quantity trong cart -> update text
    ref.listen<int>(
      cartProvider.select((s) => s.quantityOf(widget.product.id)),
      (prev, next) {
        if (_controller.text != next.toString()) {
          _controller.text = next.toString();
        }
      },
    );

    final int maxItem = 999;

    return Container(
      width: 30,
      height: 40,
      alignment: Alignment.center,
      color: Colors.transparent, // để chắc chắn không có màu nền lạ
      child: TextField(
        controller: _controller,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        decoration: const InputDecoration(
          isDense: true,
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          contentPadding: EdgeInsets.zero,
          filled: false,
        ),
        // 👉 Khi người dùng nhấn DONE (Enter)
        onSubmitted: (value) {
          final qty = int.tryParse(value) ?? 0;

          ref.read(cartProvider.notifier).setQuantity(widget.product, qty);

          // Optional: sync UI (giới hạn từ 0–9999)
          final clamped = qty.clamp(0, 9999);
          if (_controller.text != clamped.toString()) {
            _controller.text = clamped.toString();
          }
        },
        // 👉 Khi người dùng thay đổi text
        onChanged: (value) {
          // 1️⃣ Nếu text rỗng → coi như 0
          if (value.isEmpty) {
            ref.read(cartProvider.notifier).setQuantity(widget.product, 0);

            // Cập nhật UI (set lại thành 0)
            _controller.text = "0";
            _controller.selection = TextSelection.fromPosition(
              TextPosition(offset: _controller.text.length),
            );
            return;
          }

          // 2️⃣ Parse số
          int qty = int.tryParse(value) ?? 0;

          // 3️⃣ Check max giới hạn
          if (qty > maxItem) {
            qty = maxItem;

            _controller.text = qty.toString();
            _controller.selection = TextSelection.fromPosition(
              TextPosition(offset: _controller.text.length),
            );
          }

          // 4️⃣ Cập nhật vào giỏ hàng
          ref.read(cartProvider.notifier).setQuantity(widget.product, qty);
        },
      ),
    );
  }
}
