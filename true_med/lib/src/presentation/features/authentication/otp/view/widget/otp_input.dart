import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/constants/app_text_styles.dart';

class OtpInput extends StatefulWidget {
  const OtpInput({super.key, this.length = 4, this.onCompleted});

  final int length;
  final ValueChanged<String>? onCompleted;

  @override
  State<OtpInput> createState() => _OtpInputState();
}

class _OtpInputState extends State<OtpInput> {
  late final List<TextEditingController> _controllers;
  late final List<FocusNode> _focusNodes;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(widget.length, (_) => TextEditingController());
    _focusNodes = List.generate(widget.length, (_) => FocusNode());
  }

  @override
  void dispose() {
    for (final c in _controllers) {
      c.dispose();
    }
    for (final f in _focusNodes) {
      f.dispose();
    }
    super.dispose();
  }

  void _onChanged(String value, int index) {
    if (value.isNotEmpty && index < widget.length - 1) {
      _focusNodes[index + 1].requestFocus();
    }

    final otp = _controllers.map((e) => e.text).join();
    if (otp.length == widget.length) {
      widget.onCompleted?.call(otp);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(widget.length, (index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),

          child: AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: _focusNodes[index].hasFocus
                  ? [
                      BoxShadow(
                        offset: Offset(0, 1),
                        blurRadius: 2,
                        spreadRadius: 0,
                        color: AppColors.bgBrandSolid.withOpacity(0.5),
                      ),
                    ]
                  : [
                      BoxShadow(
                        offset: Offset(0, 1),
                        blurRadius: 2,
                        spreadRadius: 0,
                        color: AppColors.boxShadowInset.withOpacity(0.5),
                      ),
                    ],
            ),

            child: KeyboardListener(
              focusNode: FocusNode(), // focus riêng để bắt phím
              onKeyEvent: (KeyEvent event) {
                if (event is KeyDownEvent &&
                    event.logicalKey == LogicalKeyboardKey.backspace) {
                  if (_controllers[index].text.isEmpty && index > 0) {
                    _focusNodes[index - 1].requestFocus();
                    _controllers[index - 1].clear();
                  }
                }
              },
              child: TextField(
                controller: _controllers[index],
                focusNode: _focusNodes[index],
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                expands: true,
                maxLines: null,
                textAlignVertical: TextAlignVertical.center,

                maxLength: 1,
                style: AppTextStyles.displayMidiumLg.copyWith(
                  color: AppColors.bgBrandSolid,
                ),
                decoration: InputDecoration(
                  counterText: '',
                  filled: true,
                  fillColor: Colors.transparent,
                  contentPadding: EdgeInsets.zero,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: AppColors.borderPrimary,
                      width: 1,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: AppColors.bgBrandSolid,
                      width: 2,
                    ),
                  ),
                ),
                onChanged: (value) => _onChanged(value, index),
                onTap: () {
                  // ❌ Không cho focus ô sau nếu ô trước còn trống
                  if (index > 0 && _controllers[index - 1].text.isEmpty) {
                    _focusNodes[index - 1].requestFocus();
                  }
                },
              ),
            ),
          ),
        );
      }),
    );
  }
}
