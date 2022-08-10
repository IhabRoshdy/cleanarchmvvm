import 'package:cleanarchmvvm/app/constants.dart';
import 'package:cleanarchmvvm/presentation/common/state_renderer/state_renderer.dart';
import 'package:cleanarchmvvm/presentation/resources/strings_manager.dart';
import 'package:flutter/material.dart';

abstract class StateFlow {
  StateRendererType getStateRendererType();
  String getMessage();
}

// Loading state (Popup || Full screen)
class LoadingState extends StateFlow {
  StateRendererType stateRendererType;
  String message;

  LoadingState(
      {required this.stateRendererType, this.message = AppStrings.loading});

  @override
  String getMessage() {
    return message;
  }

  @override
  StateRendererType getStateRendererType() {
    return stateRendererType;
  }
}

class SuccessState extends StateFlow {
  String message;

  SuccessState({required this.message});

  @override
  String getMessage() {
    return message;
  }

  @override
  StateRendererType getStateRendererType() {
    return StateRendererType.successState;
  }
}

// Error state (Popup || Full screen)
class ErrorState extends StateFlow {
  StateRendererType stateRendererType;
  String message;

  ErrorState(this.stateRendererType, this.message);

  @override
  String getMessage() {
    return message;
  }

  @override
  StateRendererType getStateRendererType() {
    return stateRendererType;
  }
}

// Content state
class ContentState extends StateFlow {
  @override
  String getMessage() {
    return Constants.empty;
  }

  @override
  StateRendererType getStateRendererType() {
    return StateRendererType.contentState;
  }
}

// Empty state
class EmptyState extends StateFlow {
  String message;

  EmptyState(this.message);

  @override
  String getMessage() {
    return message;
  }

  @override
  StateRendererType getStateRendererType() {
    return StateRendererType.fullScreenEmptyState;
  }
}

extension StateFlowExtension on StateFlow {
  Widget getScreenWidget(BuildContext context, Widget contentScreenWidget,
      Function retryActionFunction) {
    switch (runtimeType) {
      case LoadingState:
        {
          if (getStateRendererType() == StateRendererType.popupLoadingState) {
            // Show dialog
            showPopup(context, getStateRendererType(), getMessage());
            // Show screen content
            return contentScreenWidget;
          } else {
            // Fullscreen loading state
            return StateRenderer(
                stateRendererType: getStateRendererType(),
                retryActionFunction: retryActionFunction,
                message: getMessage());
          }
        }
      case ErrorState:
        {
          _dismissDialog(context);
          if (getStateRendererType() == StateRendererType.popupErrorState) {
            // Show error dialog
            showPopup(context, getStateRendererType(), getMessage());
            // Show screen content
            return contentScreenWidget;
          } else {
            // Fullscreen loading state
            return StateRenderer(
                stateRendererType: getStateRendererType(),
                retryActionFunction: retryActionFunction,
                message: getMessage());
          }
        }
      case SuccessState:
        {
          _dismissDialog(context);
          showPopup(
            context,
            getStateRendererType(),
            getMessage(),
            title: AppStrings.success,
          );
          return contentScreenWidget;
        }
      case EmptyState:
        {
          return StateRenderer(
            stateRendererType: getStateRendererType(),
            retryActionFunction: () {},
            message: getMessage(),
          );
        }
      case ContentState:
        {
          _dismissDialog(context);
          return contentScreenWidget;
        }
      default:
        {
          _dismissDialog(context);
          return contentScreenWidget;
        }
    }
  }

  // Check if there is a dialog already displayed
  _isCurrentDialogShowing(BuildContext context) {
    return ModalRoute.of(context)?.isCurrent != true;
  }

  _dismissDialog(BuildContext context) {
    if (_isCurrentDialogShowing(context)) {
      Navigator.of(context, rootNavigator: true).pop(true);
    }
  }

  showPopup(
      BuildContext context, StateRendererType stateRendererType, String message,
      {String title = Constants.empty}) {
    WidgetsBinding.instance?.addPostFrameCallback((_) => showDialog(
        context: context,
        builder: (context) => StateRenderer(
              stateRendererType: stateRendererType,
              retryActionFunction: (() {}),
              message: message,
              title: title,
            )));
  }
}
