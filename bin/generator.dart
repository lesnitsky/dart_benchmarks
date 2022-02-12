import 'dart:math';

import 'package:benchmark_harness/benchmark_harness.dart';

final _r = Random(255);
const max = 255;
const length = 500;

final list = List.generate(500, (index) => _r.nextInt(max));

final iterator = (() sync* {
  for (int i = 0; i < length; i++) {
    yield _r.nextInt(max);
  }
})();

class Benchmark extends BenchmarkBase {
  final Iterable<int> it;

  const Benchmark(String title, this.it) : super(title);

  static void main(String title, Iterable<int> it) {
    Benchmark(title, it).report();
  }

  @override
  void run() async {
    it.fold<int>(0, (a, b) => a + b);
  }

  @override
  void teardown() {}
}

void main(List<String> args) {
  switch (args.first) {
    case 'list':
      Benchmark.main('List', list);
      break;

    case 'iterator':
      Benchmark.main('sync*', iterator);
      break;
  }
}
