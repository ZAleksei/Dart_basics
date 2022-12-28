extension MainMath on num {
  num _mainAbs(num x) {
    return (x < 0) ? -x : x;
  }

  num mainRoot(num pow) {
    if (this < 0) {
      throw ArgumentError("значение меньше нуля");
    }
    if (pow < 0) {
      throw ArgumentError("степень меньше нуля");
    }
    if (pow == 0) {
      if (this < 1) {
        return 0;
      } else if (this >= 1) {
        return double.infinity;
      }
    }
    num value = this;

    num eps = 0.0001;
    num root = value / pow;
    num rn = value;
    while (_mainAbs(root - rn) >= eps) {
      rn = value;
      for (int i = 1; i < pow; i++) {
        rn = rn / root;
      }
      root = 0.5 * (rn + root);
    }

    return ((root / eps).round()) * eps;
  }
}
