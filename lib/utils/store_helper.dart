import 'dart:ui';

void disposeStore(List<VoidCallback> disposers) {
  for (var disposer in disposers) {
    disposer();
  }
}
