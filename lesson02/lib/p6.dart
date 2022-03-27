import 'dart:math';

class Point {
  final int x;
  final int y;
  final int z;

  Point(this.x, this.y, this.z);

  factory Point.zero()
  {
    return Point(0, 0, 0);
  }

  factory Point.unitVector()
  {
    return Point(1, 1, 0);
  }

  double getDistanceTo(Point another)
  {
    return sqrt(pow(another.x - x, 2.0) + pow(another.y - y, 2.0) + pow(another.z - z, 2.0));
  }

  static double squareTriangle(Point one, Point two, Point three)
  {
    var ab = sqrt(pow(one.x - two.x, 2.0) + pow(one.y - two.y, 2.0) + pow(one.z - two.z, 2.0));
    var bc = sqrt(pow(two.x - three.x, 2.0) + pow(two.y - three.y, 2.0) + pow(two.z - three.z, 2.0));
    var ac = sqrt(pow(one.x - three.x, 2.0) + pow(one.y - three.y, 2.0) + pow(one.z - three.z, 2.0));

    var p = (ab + ac + bc) / 2;

    return sqrt(((p - ab) * (p - ac) * (p - bc)) * p);
  }
}