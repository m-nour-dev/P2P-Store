class ThemeState {
  bool isDarkToggled;
  ThemeState({required this.isDarkToggled});
  ThemeState copyWith({bool? isDarkToggled}) {
    return ThemeState(isDarkToggled: isDarkToggled ?? this.isDarkToggled);
  }
}
