import 'dart:async';


// this is a custom made debouncer class for providing debouncers so that we can call the database fuction in a delay
// for specific operations
class Debouncer {
  final int milliseconds;
  Debouncer({required this.milliseconds});
  Timer? _timer;
// the method used to callback the given function in the argument in a delay as specified
  run({required Function() action}) {
    if (_timer != null) _timer!.cancel();
    _timer = Timer(Duration(milliseconds: milliseconds), action);
   
  }
}
