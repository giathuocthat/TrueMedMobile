import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../data/models/product_model.dart';
import '../../../../domain/entities/product_entity.dart';
import '../../../../shared/widget/product_cart_footer.dart';
import '../../../core/application_state/logout_provider/logout_state.dart';
import '../../home/model/product_mock.dart';
import '../../home/view/widget/html_section.dart';
import '../../home/view/widget/product_banner_carousel.dart';
import '../../home/view/widget/product_info_section.dart';
import '../../home/view/widget/product_promotion_header.dart';
import '../../home/view/widget/product_promotion_section.dart';
import '../riverpod/product_detail_provider.dart';
import 'product_detail_header.dart';

class ProductDetailPage extends ConsumerStatefulWidget {
  final int productId;
  const ProductDetailPage({super.key, required this.productId});

  @override
  ConsumerState<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends ConsumerState<ProductDetailPage> {
  late ProductResponseModel product;
  final ProductMock productMock = ProductMock(
    name: "Neutri Fore Bidiphar (hộp/100 Viên Nén)",
    name_stock: "Hôp 10 vĩ, mỗi vĩ 10 Viên Nén",
    image:
        "https://raw.githubusercontent.com/TaqBostan/content/refs/heads/main/labeled-2.png",
    manufacturer: "Bidiphar",
    price: 127100,
    oldPrice: 141800,
    discount: 3,
    isShowStock: true,
    hasAlternative: true,
    isDiscount: true,
    isCombo: false,
    isPromotion: true,
    isNearOut: true,
    stock: 947,
  );
  final String fullDescription =
      "<h2 class=\"css-8uyn92\">Thành phần</h2>\r<ul>\r \t<li>Domperidon 10mg</li>\r</ul>\r<h2 class=\"css-8uyn92\">Công dụng</h2>\r<ul>\r \t<li>Thuốc Modom'S được chỉ định dùng điều trị triệu chứng nôn và buồn nôn.</li>\r</ul>\r<h2 class=\"QN2lPu\"><strong>Cách dùng - Liều dùng</strong></h2>\r<h3>Cách dùng</h3>\r<ul>\r \t<li>Modom'S chỉ nên sử dụng liều thấp nhất có hiệu quả trong thời gian ngắn nhất để kiểm soát nôn và buồn nôn.</li>\r \t<li>Nên uống Modom'S trước bữa ăn. Nếu uống sau bữa ăn, thuốc có thể bị chậm hấp thu.</li>\r \t<li>Thời gian điều trị tối đa không nên vượt quá một tuần.</li>\r</ul>\r<h3>Liều dùng</h3>\r<ul>\r \t<li><em>Người lớn và trẻ vỉ thành niên (từ 12 tuổi trở lên và cân nặng từ 35 kg trở lên):</em></li>\r</ul>\rViên 10 mg, có thể dùng lên đến 3 lần/ngày, liều tối đa là 30 mg/ngày.\r<ul>\r \t<li><em>Trẻ sơ sinh, trẻ nhỏ, trẻ em (dưới 12 tuổi) và trẻ vị thành niên cân nặng dưới 35 kg:</em></li>\r</ul>\rDo cần dùng liều chính xác nên các dạng thuốc viên nén không thích hợp cho trẻ nhỏ và trẻ vị thành niên cân nặng dưới 35 kg.\r<ul>\r \t<li><em>Bệnh nhân suy gan:</em>Modom'S chống chỉ định với bệnh nhân suy gan trung bình và nặng. Không cần hiệu chỉnh liều đối với bệnh nhân suy gan nhẹ.</li>\r \t<li><em>Bệnh nhân suy thận:</em>Do thời gian bán thải của domperidon bị kéo dài ở bệnh nhân suy thận nặng nên nếu dùng nhắc lại, số lần đưa thuốc của Modem's cần giảm xuống còn 1 đến 2 lần/ngày và hiệu chỉnh liều tùy thuộc mức độ suy thận.</li>\r \t<li>Hoặc theo chỉ dẫn của thầy thuốc.</li>\r \t<li>Lưu ý: Liều dùng trên chỉ mang tính chất tham khảo. Liều dùng cụ thể tùy thuộc vào thể trạng và mức độ diễn tiến của bệnh. Để có liều dùng phù hợp, bạn cần tham khảo ý kiến bác sĩ hoặc chuyên viên y tế.</li>\r</ul>\r<h2>Lưu ý</h2>\r<ul>\r \t<li>Sản phẩm này chỉ bán khi có chỉ định của bác sĩ, mọi thông tin trên Website chỉ mang tính chất tham khảo.</li>\r</ul>\r<h3>Chống chỉ định</h3>\rThuốc Modom'S chống chỉ định trong các trường hợp sau:\r<ul>\r \t<li>Nôn sau khi mổ.</li>\r \t<li>Bệnh nhân chảy máu đường tiêu hóa, tắc ruột cơ học.</li>\r \t<li>Trẻ em dưới 1 tuổi.</li>\r \t<li>Dùng thường xuyên hoặc dài ngày.</li>\r \t<li>Bệnh nhân suy gan trung bình và nặng.</li>\r \t<li>Bệnh nhân có thời gian dẫn truyền xung động tim kéo dài, đặc biệt là khoảng QT, bệnh nhân có rối loạn điện giải rõ rệt hoặc bệnh nhân đang có bệnh tim mạch như suy tim sung huyết.</li>\r \t<li>Dùng đồng thời với các thuốc kéo dài khoảng QT.</li>\r \t<li>Dùng đồng thời với các thuốc ức chế CYP3A4 (không phụ thuộc tác dụng kéo dài khoảng QT).</li>\r</ul>\r<h3>Tương tác thuốc</h3>\rCác thuốc kháng cholinergic, thuốc giảm đau opioid và thuốc kháng muscarinic ức chế tác dụng của domperidon.\r\rTăng nguy cơ kéo dài khoảng QT do tương tác dược động học hoặc dược lực học.\r\r<strong>Chống chỉ định dùng đồng thời với các thuốc sau:</strong>\r\r<em>Các thuốc làm kéo dài khoảng QT:</em>\r<ul>\r \t<li>Thuốc chống loạn nhịp tim nhóm IA (ví dụ: Disopyramid, hydroquinidin, quinidin).</li>\r \t<li>Thuốc chống loạn nhịp tim nhóm III (ví dụ: Amiodaron, dofetilid, dronedaron, ibutilid, sotalol).</li>\r \t<li>Một số thuốc chống loạn thần (ví dụ: Haloperidol, pimozid, sertindol).</li>\r \t<li>Một số thuốc chống trầm cảm (ví dụ: Citalopram, escitalopram).</li>\r \t<li>Một số thuốc kháng sinh (ví dụ: Erythromycin, levofloxacin, moxifloxacin, spiramycin).</li>\r \t<li>Một số thuốc chống nấm (ví dụ: Pentamidin).</li>\r \t<li>Một số thuốc điều trị sốt rét (đặc biệt là halofantrin, lumefan trin).</li>\r \t<li>Một số thuốc dạ dày - ruột (ví dụ: Cisaprid, dolasetron, prucaloprid).</li>\r \t<li>Một số thuốc kháng histamin (ví dụ: Mequitazin, mizolastin).</li>\r \t<li>Một số thuốc điều trị ung thư (ví dụ: Toremifen, vandetanib, vincamin).</li>\r \t<li>Một số thuốc khác (ví dụ: Bepridil, diphemanil, methadon).</li>\r</ul>\r<em>Chất ức chế CYP3A4 mạnh (không phụ thuộc tác dụng kéo dài khoảng QT), ví dụ:</em>\r<ul>\r \t<li>Thuốc ức chế protease.</li>\r \t<li>Thuốc chống nấm toàn thân nhóm azol.</li>\r \t<li>Một số thuốc nhóm macrolid (erythromycin, clarithromycin và telithromycin).</li>\r</ul>\r<strong>Không khuyến cáo dùng đổng thời với các thuốc sau:</strong>\r\rThuốc ức chế CYP3A4 trung bình, ví dụ: Diltiazem, verapamil và một số thuốc nhóm macrolid.\r\r<strong>Sử dụng thận trong khi dùng đồng thời với các thuốc sau:</strong>\r\rThuốc chậm nhịp tim, thuốc làm giảm kali máu và một số thuốc macrolid sau góp phần làm kéo dài khoảng QT: Azithromycin và roxithromycin (chống chỉ định clarithromycin do là thuốc ức chế CYP3A4 mạnh).\r\rDanh sách các chất ở trên là các thuốc đại diện và không đầy đủ.\r<h2 class=\"QN2lPu\"><strong>Cách bảo quản </strong></h2>\r<div class=\"inner \">\r<div id=\"detail-content-6\" class=\"preservation\">\r<div class=\"inner \">\r<div id=\"detail-content-6\" class=\"preservation\">\r<ul>\r \t<li>\r<div class=\"inner \">\r<div id=\"detail-content-5\" class=\"preservation\">\r<div>\r\rBảo quản nơi khô ráo, tránh ánh sáng, nhiệt độ không quá 30°C.\r\r</div>\r</div>\r</div></li>\r</ul>\r</div>\r</div>\r</div>\r</div>\r<h2><strong>Quy cách</strong></h2>\r<ul>\r \t<li>Hộp 10 vỉ x 10 viên</li>\r</ul>";

  @override
  void initState() {
    super.initState();
    // ref.listenManual(logoutProvider, (previous, next) {
    //   if (next.isSuccess) context.pushReplacementNamed(Routes.login);
    // });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(productDetailProvider(widget.productId));
    final ProductResponseEntity? productDetail = state.productDetail;

    if (state.status == Status.loading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state.status == Status.error) {
      return Center(child: Text(state.error ?? 'Có lỗi xảy ra'));
    }
    return Scaffold(
      body: ProductDetailHeader(
        fadeHeight: 140,
        searchBar: Container(
          height: 40,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(22),
          ),
          child: const Row(
            children: [
              Icon(Icons.search, color: Colors.grey),
              SizedBox(width: 8),
              Text("Tìm kiếm", style: TextStyle(color: Colors.grey)),
            ],
          ),
        ),

        floatingActions: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _floatingBtn(Icons.arrow_back),

              Row(
                children: [
                  _floatingBtn(Icons.notifications_none),
                  const SizedBox(width: 10),
                  _floatingBtn(Icons.shopping_cart_outlined),
                ],
              ),
            ],
          ),
        ),

        body: [
          ProducBannerCarousel(listImages: productDetail?.images ?? []),
          const ProductPromoHeader(),
          ProductInfoSection(product: productMock),
          const SizedBox(height: 12),

          // Mã giảm giá section
          ProductPromotionSection(product: productMock),
          const SizedBox(height: 12),

          // Mua kèm deal tốt
          // const ProductBuyWithDealSection(),

          /// Mô tả sản phẩm
          HtmlSection(html: fullDescription),
          const SizedBox(height: 80),
        ],
        // ========================
        //     FOOTER PAYMENT
        // ========================
        footerPayment: SizedBox(height: 140, child: ProductCartFooter(context)),
      ),
    );
  }

  static Widget _floatingBtn(IconData icon) {
    return Container(
      width: 38,
      height: 38,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.06),
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: Colors.black54),
    );
  }
}
