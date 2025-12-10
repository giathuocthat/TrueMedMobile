import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class HtmlSection extends StatelessWidget {
  final String html;

  const HtmlSection({super.key, required this.html});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      color: Colors.white,
      child: _buildHtmlContent(),
    );
  }

  Widget _buildHtmlContent() {
    return Html(
      data: html,

      style: {
        "body": Style(
          margin: Margins.zero,
          padding: HtmlPaddings.zero,
          fontSize: FontSize(15),
          lineHeight: LineHeight.number(1.2),
          color: Colors.black87,
        ),

        "h2": Style(
          fontSize: FontSize(12),
          fontWeight: FontWeight.w400,
          margin: Margins.only(top: 4, bottom: 6),
        ),

        "h3": Style(
          fontSize: FontSize(11),
          fontWeight: FontWeight.w400,
          margin: Margins.only(top: 8, bottom: 6),
        ),

        "ul": Style(margin: Margins.only(left: 0, bottom: 6)),

        "li": Style(
          fontSize: FontSize(11),
          padding: HtmlPaddings.only(bottom: 6),
        ),
      },

      // Xử lý URL lỗi, iframe, table...
      // onLinkTap: (url, _, __) {
      //   debugPrint("Open link: $url");
      // },
    );
  }
}
