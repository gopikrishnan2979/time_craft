import 'dart:async';

class Debouncer {

  final int milliseconds;
  Debouncer({required this.milliseconds});
  Timer? _timer;



  run({required Function() action}) {
    if (_timer?.isActive ?? false) _timer!.cancel();
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}
