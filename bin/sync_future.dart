import 'dart:math';
import 'dart:async';

import 'package:benchmark_harness/benchmark_harness.dart';
import 'package:dart_benchmarks/syncronous_future.dart';

abstract class Generator {
  List<int> get values;
  Future<int> generate();
}

class FutureGenerator implements Generator {
  @override
  final values = [];

  @override
  Future<int> generate() async {
    return _r.nextInt(255);
  }
}

class SyncFutureGenerator implements Generator {
  @override
  final values = [];

  @override
  Future<int> generate() {
    return SynchronousFuture(_r.nextInt(255));
  }
}

final _r = Random(255);

class Benchmark extends BenchmarkBase {
  final Generator generator;
  const Benchmark(String title, this.generator) : super(title);

  static void main(String title, Generator generator) {
    Benchmark(title, generator).report();
  }

  @override
  void run() async {
    final v = await generator.generate();
    generator.values.add(v);
  }
}

void main(List<String> args) {
  switch (args.first) {
    case 'future':
      Benchmark.main('Future', FutureGenerator());
      break;

    case 'sync':
      Benchmark.main('SyncFutureGenerator', SyncFutureGenerator());
      break;
  }
}
