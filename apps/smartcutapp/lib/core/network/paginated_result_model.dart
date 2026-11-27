class PaginatedResult<T> {
  final List<T> items;
  final int page;
  final int total;
  final int totalPages;

  PaginatedResult({
    required this.items,
    required this.page,
    required this.total,
    required this.totalPages,
  });
}