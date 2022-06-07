abstract class BaseViewModel extends BaseViewModelInputs
    with BaseViewModelOutputs {
  // Contains shared variables and functions that will be used by any child ViewModel
}

abstract class BaseViewModelInputs {
  void start(); // start ViewModel job
  void dispose(); // called to dispose ViewModel
}

abstract class BaseViewModelOutputs {}
