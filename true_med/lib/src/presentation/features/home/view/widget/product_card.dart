import 'package:flutter/material.dart';
import '../../model/product_mock.dart';

class ProductCard extends StatelessWidget {
  final ProductMock product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFF8F3E7),
          borderRadius: BorderRadius.circular(16),
        ),
        //child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top section
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  if (product.discount > 0)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        "-${product.discount}%",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  const Spacer(),
                  const Icon(Icons.favorite_border, color: Colors.grey),
                ],
              ),
            ),

            SizedBox(
              height: 90,
              child: Center(
                child: AspectRatio(
                  aspectRatio: 4 / 3,
                  child: Image.network(product.image, fit: BoxFit.contain),
                ),
              ),
            ),

            const SizedBox(height: 8),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  Text(
                    "${product.price.toStringAsFixed(0)}đ",
                    style: const TextStyle(
                      color: Colors.green,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 6),
                  if (product.oldPrice > 0)
                    Text(
                      "${product.oldPrice.toStringAsFixed(0)}đ",
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                ],
              ),
            ),

            const SizedBox(height: 8),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                product.name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 14),
              ),
            ),

            const SizedBox(height: 4),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                product.name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 10, color: Colors.grey),
              ),
            ),

            const SizedBox(height: 4),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  const Icon(Icons.house, color: Colors.blue, size: 16),
                  const SizedBox(width: 4),
                  Expanded(
                    child: Text(
                      product.manufacturer,
                      style: const TextStyle(fontSize: 12, color: Colors.blue),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 4),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                "Đặt tối đa ${product.stock} sản phẩm",
                style: const TextStyle(fontSize: 10, color: Colors.grey),
              ),
            ),

            const SizedBox(height: 6),

            Container(
              height: 42,
              width: double.infinity,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Icon(Icons.remove),
                  Text("0"),
                  Icon(Icons.add, color: Colors.green),
                ],
              ),
            ),
          ],
        ),
        //  ),
      ),
    );
  }
}
