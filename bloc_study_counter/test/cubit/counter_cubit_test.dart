// import 'package:bloc_study_counter/logic/cubit/counter_cubit.dart';
// import 'package:bloc_test/bloc_test.dart';
// import 'package:test/expect.dart';
// import 'package:test/scaffolding.dart';

// void main() {
//   group('CounterCubit', () {
//     late CounterCubit counterCubit;
//     setUp(() {
//       counterCubit = CounterCubit();
//     });
//     tearDown(() {
//       counterCubit.close();
//     });

//     test("Initial state of counterCubit is CounterState(counterValue:0)", () {
//       expect(counterCubit.state, const CounterState(counterValue: 0));
//     });

//     blocTest(
//       "Cubit emits CounterState(counterValue:1) when incremented",
//       build: () => counterCubit,
//       act: (CounterCubit cubit) => cubit.increment(),
//       expect: () => [const CounterState(counterValue: 1, wasIncremented: true)],
//     );

//     blocTest("Cubit emits CounterState(counterValue:-1) when decremented",
//         build: () => counterCubit,
//         act: (CounterCubit cubit) => cubit.decrement(),
//         expect: () =>
//             [const CounterState(counterValue: -1, wasIncremented: false)]);
//   });
// }
