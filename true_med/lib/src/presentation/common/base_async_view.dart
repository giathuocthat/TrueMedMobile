class BaseAsyncView<T> extends StatelessWidget {
  final Status status;
  final T? data;
  final Widget loading;
  final Widget Function(T data) onSuccess;
  final Widget? error;
  final Widget? empty;

  const BaseAsyncView({
    super.key,
    required this.status,
    required this.data,
    required this.loading,
    required this.onSuccess,
    this.error,
    this.empty,
  });

  @override
  Widget build(BuildContext context) {
    switch (status) {
      case Status.loading:
        return loading;

      case Status.success:
        if (data == null) return empty ?? const SizedBox();
        return onSuccess(data!);

      case Status.empty:
        return empty ?? const SizedBox();

      case Status.error:
      case Status.invalid:
        return error ?? const SizedBox();

      default:
        return const SizedBox();
    }
  }
}
