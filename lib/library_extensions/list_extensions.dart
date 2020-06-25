import 'dart:math' as dart_math;

extension ListNumExtensions on List<num> {
  num max() => fold(0, dart_math.max);
}
