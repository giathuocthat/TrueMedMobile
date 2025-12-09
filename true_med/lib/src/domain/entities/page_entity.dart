interface class PaginationEntity {}

class PaginationRequestEntity extends PaginationEntity {}

class PaginationResponseEntity<T> extends PaginationEntity {
  PaginationResponseEntity({required this.data, required this.page});

  final List<T> data;
  final PageEntity page;
}

interface class PageEntity {}

class PageRequestEntity extends PageEntity {}

class PageResponseEntity extends PageEntity {
  PageResponseEntity({
    required this.pageNumber,
    required this.pageSize,
    required this.totalCount,
    required this.totalPages,
  });

  final int pageNumber;
  final int pageSize;
  final int totalCount;
  final int totalPages;
}
