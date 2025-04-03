abstract class SimilarState {}

class SimilarLoadingState extends SimilarState {}

class SimilarLoadedState extends SimilarState {
  final List<dynamic> SimilarList;
  SimilarLoadedState({required this.SimilarList});
}

class FaliureState extends SimilarState {
  final String message;
  FaliureState({required this.message});
}

