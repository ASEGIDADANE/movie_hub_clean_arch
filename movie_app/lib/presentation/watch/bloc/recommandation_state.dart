abstract class RecommandationState {}

class RecommandationLoadingState extends RecommandationState {}

class RecommandationLoadedState extends RecommandationState {
  final List<dynamic> recommandationList;
  RecommandationLoadedState({required this.recommandationList});
}

class FaliureState extends RecommandationState {
  final String message;
  FaliureState({required this.message});
}

