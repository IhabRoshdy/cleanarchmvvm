import 'dart:async';

import 'package:cleanarchmvvm/domain/models/models.dart';
import 'package:cleanarchmvvm/presentation/base/base_view_model.dart';
import 'package:cleanarchmvvm/presentation/resources/assets_manager.dart';
import 'package:cleanarchmvvm/presentation/resources/strings_manager.dart';

class OnBoardingViewModel extends BaseViewModel
    with OnBoardingViewModelInputs, OnBoardingViewModelOutputs {
  final StreamController _streamController =
      StreamController<SliderViewObject>();
  late final List<SliderObject> _list;
  int _currentIndex = 0;

  @override
  void dispose() {
    _streamController.close();
  }

  @override
  void start() {
    _list = _getSliderData();
    _postDataToView();
  }

  @override
  int goToNextSlide() {
    int nextIndex = ++_currentIndex;
    if (nextIndex == _list.length) {
      nextIndex = 0;
    }
    return nextIndex;
  }

  @override
  int goToPreviousSlide() {
    int previousIndex = --_currentIndex;
    if (previousIndex == -1) {
      previousIndex = _list.length - 1;
    }
    return previousIndex;
  }

  @override
  void onPageChanged(int index) {
    _currentIndex = index;
    _postDataToView();
  }

  @override
  Sink get sliderViewObjectInput => _streamController.sink;

  @override
  Stream<SliderViewObject> get sliderViewObjectOutput =>
      _streamController.stream.map((sliderViewObject) => sliderViewObject);

  List<SliderObject> _getSliderData() => [
        SliderObject(AppStrings.onBoardingSubtitle1,
            AppStrings.onBoardingSubtitle1, ImageAssets.onBoardingLogo1),
        SliderObject(AppStrings.onBoardingSubtitle2,
            AppStrings.onBoardingSubtitle2, ImageAssets.onBoardingLogo2),
        SliderObject(AppStrings.onBoardingSubtitle3,
            AppStrings.onBoardingSubtitle3, ImageAssets.onBoardingLogo3),
        SliderObject(AppStrings.onBoardingSubtitle4,
            AppStrings.onBoardingSubtitle4, ImageAssets.onBoardingLogo4),
      ];

  void _postDataToView() {
    sliderViewObjectInput.add(
        SliderViewObject(_list[_currentIndex], _list.length, _currentIndex));
  }
}

// Actions received from View
abstract class OnBoardingViewModelInputs {
  int goToNextSlide();
  int goToPreviousSlide();
  void onPageChanged(int index);

  Sink get sliderViewObjectInput;
}

abstract class OnBoardingViewModelOutputs {
  Stream<SliderViewObject> get sliderViewObjectOutput;
}
