part of '../router.dart';

List<GoRoute> _authenticationRoutes(ref) {
  return [
    GoRoute(
      path: Routes.login,
      name: Routes.login,
      pageBuilder: (context, state) {
        return const MaterialPage(child: LoginPage());
      },
      routes: [
        GoRoute(
          path: Routes.registration,
          name: Routes.registration,
          pageBuilder: (context, state) =>
              const MaterialPage(child: RegistrationPage()),
        ),
        GoRoute(
          path: Routes.bussinessType,
          name: Routes.bussinessType,
          pageBuilder: (context, state) =>
              const MaterialPage(child: BussinessTypePage()),
        ),
        GoRoute(
          path: Routes.accountInfo,
          name: Routes.accountInfo,
          pageBuilder: (context, state) =>
              const MaterialPage(child: AccountInfoPage()),
        ),
        GoRoute(
          path: Routes.bussinessAddress,
          name: Routes.bussinessAddress,
          pageBuilder: (context, state) =>
              const MaterialPage(child: BussinessAddressPage()),
        ),
        GoRoute(
          path: Routes.resetPassword,
          name: Routes.resetPassword,
          pageBuilder: (context, state) =>
              const MaterialPage(child: ResetPasswordPage()),
          routes: [
            GoRoute(
              path: Routes.emailVerification,
              name: Routes.emailVerification,
              pageBuilder: (context, state) =>
                  const MaterialPage(child: EmailVerificationPage()),
            ),
            GoRoute(
              path: Routes.createNewPassword,
              name: Routes.createNewPassword,
              pageBuilder: (context, state) =>
                  const MaterialPage(child: CreateNewPasswordPage()),
              routes: [
                GoRoute(
                  path: Routes.resetPasswordSuccess,
                  name: Routes.resetPasswordSuccess,
                  pageBuilder: (context, state) =>
                      const MaterialPage(child: ResetPasswordSuccessPage()),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  ];
}
