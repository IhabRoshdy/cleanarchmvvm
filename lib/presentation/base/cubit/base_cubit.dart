import 'package:bloc/bloc.dart';
import 'package:cleanarchmvvm/presentation/common/state_renderer/state_renderer.dart';
import 'package:cleanarchmvvm/presentation/common/state_renderer/state_renderer_impl.dart';
import 'package:meta/meta.dart';

part 'base_state.dart';

class BaseCubit extends Cubit<BaseState> {
  BaseCubit() : super(Content(stateFlow: ContentState()));

  void switchToLoadingState() {
    emit(Loading(
        stateFlow: LoadingState(
            stateRendererType: StateRendererType.popupLoadingState)));
  }

  void switchToContentState() {
    emit(Content(stateFlow: ContentState()));
  }

  void switchToSuccessState(String message) {
    emit(Success(stateFlow: SuccessState(message: message)));
  }

  void switchToErrorState(StateRendererType rendererType, String message) {
    emit(Error(stateFlow: ErrorState(rendererType, message)));
  }
}
