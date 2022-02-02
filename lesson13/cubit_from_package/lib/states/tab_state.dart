class TabState {
  final int activeTabIndex;

  TabState({this.activeTabIndex = 0});

  TabState copyWith({
    int? activeTabIndex,
  }) {
    return TabState(
      activeTabIndex: activeTabIndex ?? this.activeTabIndex,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TabState &&
          runtimeType == other.runtimeType &&
          activeTabIndex == other.activeTabIndex;

  @override
  int get hashCode => activeTabIndex.hashCode;

  @override
  String toString() =>
      'TabState{activeIndexTab: $activeTabIndex}';
}
