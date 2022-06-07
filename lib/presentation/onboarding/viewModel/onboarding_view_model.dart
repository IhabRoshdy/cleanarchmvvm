import 'package:cleanarchmvvm/presentation/base/base_view_model.dart';

class OnBoardingViewModel extends BaseViewModel
    with OnBoardingViewModelInputs, OnBoardingViewModelOutputs {
  @override
  void dispose() {}

  @override
  void start() {}

  @override
  void goToNextSlide() {}

  @override
  void goToPreviousSlide() {}

  @override
  void onPageChanged(int index) {}
}

// Actions received from View
abstract class OnBoardingViewModelInputs {
  void goToNextSlide();
  void goToPreviousSlide();
  void onPageChanged(int index);
}

abstract class OnBoardingViewModelOutputs {}
