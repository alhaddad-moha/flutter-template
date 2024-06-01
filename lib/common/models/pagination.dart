class PaginationParameters {
  int page;
  int perPage;

  PaginationParameters({this.page = 1, this.perPage = 4});

  Map<String, dynamic> toQueryParameter() => {'page': page, 'row': perPage};

  int get totalLength => page * perPage;
}

class WrapPaginationResultModel<T> extends Iterable<T> {
  final int total;
  final List<T> list;

  WrapPaginationResultModel({
    required this.total,
    required this.list,
  });

  @override
  Iterator<T> get iterator => list.iterator;

  @override
  List<T> toList({bool growable = true}) => list.toList(growable: growable);

  @override
  String toString() {
    return 'WrapPaginationResultModel{total: $total, list: $list}';
  }

  static WrapPaginationResultModel<T> empty<T>() {
    return WrapPaginationResultModel<T>(total: 0, list: []);
  }
}
