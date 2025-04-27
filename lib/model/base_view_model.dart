import 'package:flutter_rickandmortyinfo/model/screen_event.dart';

abstract mixin class BaseViewModel {
  void handleEvent(ScreenEvent event);
}