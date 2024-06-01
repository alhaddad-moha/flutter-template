import 'package:flutter/material.dart';

class BaseChangeNotifier extends ChangeNotifier{

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }


  bool _isBusy = false;

  bool get isBusy => _isBusy;

  set isBusy(bool value) {
    _isBusy = value;
    notifyListeners();
  }

  bool _isLoadingMore = false;

  bool get isLoadingMore => _isLoadingMore;

  set isLoadingMore(bool value) {
    _isLoadingMore = value;
    notifyListeners();
  }


}