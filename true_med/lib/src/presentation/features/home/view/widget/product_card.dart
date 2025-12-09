import 'package:flutter/material.dart';
import '../../../../../core/extensions/string.dart';
import '../../../../../domain/entities/product_entity.dart';
import 'discount_badge.dart';
import 'product_footer.dart';
import 'sold_progress_bar.dart';
import 'text_bage.dart';

class ProductCard extends StatelessWidget {
  final ProductResponseEntity product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final productVariants = product.productVariants?.firstOrNull;

    final percentPrice =
        productVariants?.price.percentChange(
          productVariants?.originalPrice ?? 0,
        ) ??
        0;
    return SizedBox(
      //300 +30 chieu cao hien thi day du thong tin san pham
      height: 310,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: percentPrice < -15
              ? const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromARGB(255, 245, 144, 86), // cam nhạt
                    Colors.white, // vàng nhạt
                  ],
                )
              : null, // không dùng gradient
          color: percentPrice > -15
              ? Colors.white
              : null, // fallback khi không có gradient
        ),
        //child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                if (percentPrice < 0)
                  discountBadge(percentPrice.percentChangeText()),
                const Spacer(),
                const Padding(
                  padding: EdgeInsets.all(8),
                  child: Icon(Icons.favorite_border, color: Colors.grey),
                ),
              ],
            ),
            SizedBox(
              height: 80,
              child: Center(
                child: AspectRatio(
                  aspectRatio: 4 / 3,
                  child: Image.network(
                    product.thumbnailUrl ?? '',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 2),
            // BADGE TAG TEXT
            SizedBox(
              height: 30,
              child: Container(
                child: Row(
                  children: [
                    // if (product.isDiscount)
                    //   //
                    //   const SizedBox(
                    //     width: 65, // hoặc MediaQuery.of(context).size.width / 2
                    //     child: TagBadge(
                    //       background: Colors.blueAccent,
                    //       text: "BĂT BUỘC LẤY HOÁ ĐƠN ",
                    //       icon: null,
                    //     ),
                    //   ),
                    if (percentPrice < -10)
                      const SizedBox(
                        width: 65, // hoặc MediaQuery.of(context).size.width / 2
                        child: TagBadge(
                          background: Colors.red,
                          text: "KHUYẾN MÃI",
                          icon: null,
                        ),
                      ),
                  ],
                ),
              ),
            ),

            if (productVariants != null)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  children: [
                    Text(
                      productVariants!.price.toCurrency(true),
                      style: const TextStyle(
                        color: Colors.green,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(width: 6),
                    if (productVariants!.price < productVariants.originalPrice)
                      Text(
                        productVariants!.originalPrice.toCurrency(true),
                        style: const TextStyle(
                          fontSize: 10,
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                  ],
                ),
              ),

            //Spacer(),
            //const SizedBox(height: 8),
            // Name
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                product.name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 13),
              ),
            ),

            const SizedBox(height: 2),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                product.slug ?? '',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 8, color: Colors.grey),
              ),
            ),

            const SizedBox(height: 4),
            // Manufacturer show  here
            //if (product.isShowStock)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  const Icon(Icons.house, color: Colors.blue, size: 16),
                  const SizedBox(width: 4),
                  Expanded(
                    child: Text(
                      product.brandName ?? '',
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                        color: Colors.blue,
                      ),
                      maxLines: 1,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            const SizedBox(height: 4),
            if (productVariants != null)
              if (percentPrice < 0 ? true : false)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: SoldProgressBar(
                    sold: productVariants!.soldQuantity,
                    total: productVariants!.maxSalesQuantity,
                    iSShowSold: true,
                  ),
                ),

            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  "Đặt tối đa ${productVariants!.maxSalesQuantity} sản phẩm",
                  style: const TextStyle(fontSize: 10, color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(height: 6),
            const Spacer(),

            ProductFooter(quantity: 0, onAdd: () {}, onRemove: () {}),
          ],
        ),
      ),
    );
  }
}
