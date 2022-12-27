import 'dart:math';

class Point {
  final double x;
  final double y;
  final double z;
  Point(this.x, this.y, this.z);
  distanceTo(Point another) {
    return (sqrt(
        pow(another.x - x, 2) + pow(another.y - y, 2) + pow(another.z - z, 2)));
  }

  static double areaOfTriangle(Point a,b,c)
  {
    double ab,bc,ca,p;
    ab=a.distanceTo(b);
    bc=b.distanceTo(c);
    ca=c.distanceTo(a);
    p=(ab+bc+ca)/2;
    return sqrt(p*(p-ab)*(p-bc)*(p-ca));
  }


  @override
  String toString() {
    return "(X:${x} Y:${y} Z:${z})";
  }

  static final _cashePoints = <Point>[Point(0, 0, 0), Point(1, 1, 1)];

  factory Point.zero() {
    return _cashePoints[0];
  }
  factory Point.one() {
    return _cashePoints[1];
  }
}
