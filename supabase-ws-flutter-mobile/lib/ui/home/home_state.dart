part of 'home_cubit.dart';

@freezed
class HomeBaseState with _$HomeBaseState {
  const factory HomeBaseState.state({
    @Default([]) List<UserMessage> messages,
  }) = HomeState;
}
