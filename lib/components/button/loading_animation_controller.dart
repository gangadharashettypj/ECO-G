import 'package:signals/signals.dart';

class ButtonLoadingAnimationController {
  final _showLoading = signal(false);

  bool get showLoading => _showLoading.value;

  void startLoadingAnimation() {
    _showLoading.value = true;
  }

  void stopLoadingAnimation() {
    _showLoading.value = false;
  }
}
