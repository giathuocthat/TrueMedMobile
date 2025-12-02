import 'package:flutter/material.dart';
import '../../../../../core/extensions/string.dart';
import '../../model/product_mock.dart';
import 'discount_badge.dart';
import 'product_footer.dart';
import 'sold_progress_bar.dart';
import 'text_bage.dart';

class ProductCard extends StatelessWidget {
  final ProductMock product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //300 +30 chieu cao hien thi day du thong tin san pham
      height: 310,
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 219, 244, 239),
          borderRadius: BorderRadius.circular(16),
        ),
        //child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                if (product.discount > 0)
                  //
                  discountBadge('-${product.discount}%'),
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
                  child: Image.network(product.image, fit: BoxFit.contain),
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
                    if (product.isDiscount)
                      //
                      const SizedBox(
                        width: 65, // hoặc MediaQuery.of(context).size.width / 2
                        child: TagBadge(
                          background: Colors.blueAccent,
                          text: "BĂT BUỘC LẤY HOÁ ĐƠN ",
                          icon: null,
                        ),
                      ),
                    if (product.discount > 0)
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

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  Text(
                    product.price.toCurrency(true),
                    style: const TextStyle(
                      color: Colors.green,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 6),
                  if (product.oldPrice > 0)
                    Text(
                      //"${product.oldPrice.toStringAsFixed(0)}đ",
                      product.oldPrice.toCurrency(true),
                      style: const TextStyle(
                        fontSize: 10,
                        color: Colors.grey,
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
                product.name_stock,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 8, color: Colors.grey),
              ),
            ),

            const SizedBox(height: 4),
            // Manufacturer show  here
            if (product.isShowStock)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  children: [
                    const Icon(Icons.house, color: Colors.blue, size: 16),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        product.manufacturer,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.blue,
                        ),
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
              ),
            Spacer(),
            const SizedBox(height: 4),
            if (product.discount > 0 ? true : false)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: SoldProgressBar(
                  sold: 55,
                  total: 100,
                  iSShowSold: product.isShowStock,
                ),
              ),

            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  "Đặt tối đa ${product.stock} sản phẩm",
                  style: const TextStyle(fontSize: 10, color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(height: 6),
            const Spacer(),

            // Container(
            //   height: 42,
            //   width: double.infinity,
            //   alignment: Alignment.center,
            //   decoration: const BoxDecoration(
            //     color: Colors.white,
            //     borderRadius: BorderRadius.only(
            //       bottomLeft: Radius.circular(16),
            //       bottomRight: Radius.circular(16),
            //     ),
            //   ),
            //   child: const Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //     children: [
            //       Icon(Icons.remove),
            //       Text("0"),
            //       Icon(Icons.add, color: Colors.green),
            //     ],
            //   ),
            // ),
            ProductFooter(quantity: 990, onAdd: () {}, onRemove: () {}),
          ],
        ),
        //  ),
      ),
    );
  }
}
