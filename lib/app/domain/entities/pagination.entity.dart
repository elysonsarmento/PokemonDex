class Pagination<T> {
  int _currentOffset = 0;
  int _limit = 20;
  final List<T> _data = <T>[];

  List<T> get data => _data;

  int get currentOffset => _currentOffset;
  int get limit => _limit;

  void nextPage() {
    _currentOffset += _limit;
  }

  void previousPage() {
    if (_currentOffset > 0) {
      _currentOffset -= _limit;
    }
  }

  void reset() {
    _currentOffset = 0;
  }
}
