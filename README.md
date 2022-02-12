# Dart benchmarks

```sh
# sync_future
Future(RunTime): 15.675725510161959 us.
SyncFutureGenerator(RunTime): 5.4679169970199855 us.

# generator
List(RunTime): 24.16890099821575 us.
sync*(RunTime): 165.70969345484673 us.
```

## Running benchmark

```sh
dart pub get
dart run dart_benchmarks:sync_future <future|sync>
dart run dart_benchmarks:generator <list|iterator>
```

## LICENSE

MIT
