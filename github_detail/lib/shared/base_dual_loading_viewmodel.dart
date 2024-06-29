import 'base_viewmodel.dart';

class BaseDualLoadingViewModel extends BaseViewModel {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  bool _isSecondaryLoading = false;

  bool get isSecondaryLoading => _isSecondaryLoading;

  set isSecondaryLoading(bool isSecondaryLoading) {
    _isSecondaryLoading = isSecondaryLoading;
    notifyListeners();
  }
}
