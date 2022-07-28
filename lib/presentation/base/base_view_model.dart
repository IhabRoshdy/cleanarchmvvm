import 'dart:async';

import 'package:cleanarchmvvm/presentation/common/state_renderer/state_renderer_impl.dart';

abstract class BaseViewModel extends BaseViewModelInputs
    with BaseViewModelOutputs {
  final StreamController _inputStreamController =
      StreamController<StateFlow>.broadcast();

  @override
  void dispose() {
    _inputStreamController.close();
  }

  @override
  Sink get inputState => _inputStreamController.sink;

  @override
  Stream<StateFlow> get outputState =>
      _inputStreamController.stream.map((stateFlow) => stateFlow);
}

abstract class BaseViewModelInputs {
  void start(); // start ViewModel job
  void dispose(); // called to dispose ViewModel

  Sink get inputState;
}

abstract class BaseViewModelOutputs {
  Stream<StateFlow> get outputState;
}
