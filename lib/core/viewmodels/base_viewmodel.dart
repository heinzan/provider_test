import 'package:flutter/foundation.dart';
import 'package:providertest/util/view_state.dart';

class BaseViewModel extends ChangeNotifier{
  ViewState _state = ViewState.Idle;
  ViewState get state => _state;

  void setState(ViewState viewState){
    _state = viewState;
    notifyListeners();
  }
}