import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:p2p_store/features/products/presentation/manager/theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState(isDarkToggled: false));

  void changeTheme() {
    emit(state.copyWith(isDarkToggled: !state.isDarkToggled));
  }
}
