import 'package:flutter/material.dart';

class RequiredTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;

  const RequiredTextField({
    super.key,
    required this.controller,
    required this.hintText,
  });

  @override
  State<RequiredTextField> createState() => _RequiredTextFieldState();
}

class _RequiredTextFieldState extends State<RequiredTextField> {
  final FocusNode _focusNode = FocusNode();

  bool get _showRequired {
    //return !_focusNode.hasFocus && widget.controller.text.isEmpty;
    return widget.controller.text.isEmpty;
  }

  @override
  void initState() {
    super.initState();

    _focusNode.addListener(() {
      setState(() {});
    });

    widget.controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      //padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: TextField(
        controller: widget.controller,
        focusNode: _focusNode,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: null, // 👈 KHÔNG dùng hintText mặc định
          hintStyle: const TextStyle(fontSize: 16),
          hint: _buildHint(),
        ),
        style: const TextStyle(fontSize: 16),
      ),
    );
  }

  Widget _buildHint() {
    return RichText(
      text: TextSpan(
        text: widget.hintText,
        style: const TextStyle(fontSize: 16, color: Colors.grey),
        children: _showRequired
            ? const [
                TextSpan(
                  text: " *",
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ]
            : [],
      ),
    );
  }
}
