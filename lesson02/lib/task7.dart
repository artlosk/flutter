extension Task7 on int {
  double mabs(double x) {
    return (x < 0) ? -x : x;
  }

  double findSqrt(int rootDegree) {

    if (this < 0) {
      throw ArgumentError('Only positive number');
    }

    if (!(this is int)) {
      throw ArgumentError('Only integer number');
    }

    double eps = 0.00001;
    double root = this / rootDegree;
    double rn = this.toDouble();
    double rn1;

    while (mabs(root - rn) >= eps) {
      rn1 = 1.0;
      for (int i = 1; i < rootDegree; i++) {
        rn1 = rn1 * root;
      }
      rn = root;
      root = rn * (1.0 - 1 / rootDegree) + (1.0 / rootDegree) * this / rn1;
    }

    return root;
  }
}
