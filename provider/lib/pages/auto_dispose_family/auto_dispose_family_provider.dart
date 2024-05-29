import 'package:equatable/equatable.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auto_dispose_family_provider.g.dart';

class Counter extends Equatable {
  final int count;
  const Counter({
    required this.count,
  });

  @override
  String toString() => 'Counter(count: $count)';

  @override
  List<Object> get props => [count];
}

final counterProvider = Provider.autoDispose.family<int, Counter>((ref, c) {
  ref.onDispose(() {
    print('[CounterProvider($c) disposed]');
  });
  return c.count;
});

final autoDisposeFamilyProvider = 
    Provider.autoDispose.family<String, String>((ref, name) {
  ref.onDispose(() {
    print('[autoDisposefamilyHelloProvider($name)] disposed');
  });
  return 'Hello $name';
});

@riverpod
String autoDisposeFamilyHello(AutoDisposeFamilyHelloRef ref, {required String there}) {
  ref.onDispose(() {
    print('[autoDisposefamilyHelloProvider($there)] disposed');
  });
  return 'Hello $there';
}