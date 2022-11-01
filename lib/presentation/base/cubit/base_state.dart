// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'base_cubit.dart';

@immutable
abstract class BaseState {
  final StateFlow inputState;
  const BaseState({
    required this.inputState,
  });
}

class Loading extends BaseState {
  final StateFlow stateFlow;
  const Loading({required this.stateFlow}) : super(inputState: stateFlow);
}

class Success extends BaseState {
  final StateFlow stateFlow;
  const Success({
    required this.stateFlow,
  }) : super(inputState: stateFlow);
}

class Error extends BaseState {
  final StateFlow stateFlow;
  const Error({
    required this.stateFlow,
  }) : super(inputState: stateFlow);
}

class Content extends BaseState {
  final StateFlow stateFlow;
  const Content({
    required this.stateFlow,
  }) : super(inputState: stateFlow);
}

class Empty extends BaseState {
  final StateFlow stateFlow;
  const Empty({
    required this.stateFlow,
  }) : super(inputState: stateFlow);
}
