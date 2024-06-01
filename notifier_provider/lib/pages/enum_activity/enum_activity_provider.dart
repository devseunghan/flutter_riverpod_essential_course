import 'package:notifier_provider/models/activity.dart';
import 'package:notifier_provider/providers/dio_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:notifier_provider/pages/enum_activity/enum_activity_state.dart';

part 'enum_activity_provider.g.dart';

@riverpod
class MyCounter extends _$MyCounter {
  @override
  int build() {
    return 0;
  }

  void increment() => state++;
}

@riverpod
class EnumActivity extends _$EnumActivity {
  int _errorCounter = 0;
  @override
  EnumActivityState build() {
    ref.onDispose(() {
      print('[enumAcitivityProvider] disposed');
    });
    ref.watch(myCounterProvider);
    print('hashCode: $hashCode');
    return EnumActivityState.initial();
  }

  Future<void> fetchActivity(String activityType) async {
    print('hashCode in fetchActiviry: $hashCode');
    state = state.copyWith(status: ActivityStatus.loading);

    try {
      print ('_errorCounter: $_errorCounter');
      if (_errorCounter++ % 2 != 1) {
        await Future.delayed(const Duration(milliseconds: 50));
        throw 'Fail to fetch activity';
      }
      final response = await ref.read(dioProvider).get('?type=$activityType');
      
      final activity = Activity.fromJson(response.data);

      state = state.copyWith(
        status: ActivityStatus.success, 
        activity: activity
      );
    } catch (e) {
      state = state.copyWith(
        status: ActivityStatus.failure,
        error: e.toString()
      );
    }
  }
}