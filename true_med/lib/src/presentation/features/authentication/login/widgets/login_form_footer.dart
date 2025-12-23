part of '../view/login_page.dart';

class _FormFooter extends ConsumerWidget {
  const _FormFooter({required this.shouldRemember});

  final ValueNotifier<bool> shouldRemember;

  void _toggleRememberMe(bool? value) {
    shouldRemember.value = value ?? false;
  }

  void _navigateToResetPassword(BuildContext context) {
    context.pushNamed(Routes.resetPassword);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTextStyle(
      style: AppTextStyles.bodyTextSmSemiBold.copyWith(
        color: AppColors.textBrandSecondary,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Transform.translate(
            offset: const Offset(-10, 0),
            child: Row(
              children: [
                ValueListenableBuilder(
                  valueListenable: shouldRemember,
                  builder: (context, value, _) {
                    return Checkbox(value: value, onChanged: _toggleRememberMe);
                  },
                ),
                Text(
                  'Ghi nhớ đăng nhập',
                  style: AppTextStyles.bodyTextSmSemiBold.copyWith(
                    color: AppColors.textBrandSecondary,
                  ),
                ),
              ],
            ),
          ),
          Transform.translate(
            offset: const Offset(10, 0),
            child: Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () => _navigateToResetPassword(context),
                child: Text(
                  'Quên mật khẩu',
                  style: AppTextStyles.bodyTextSmSemiBold.copyWith(
                    color: AppColors.textBrandSecondary,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
