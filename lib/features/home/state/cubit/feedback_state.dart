part of 'feedback_cubit.dart';

class FeedbackState extends Equatable {
  final bool showFeedback;
  final Map<int, String> feedback;
  final Map<int, int> rating;
  final String? error;

  const FeedbackState({
    this.showFeedback = false,
    this.feedback = const {0: ""},
    this.rating = const {0: 0},
    this.error,
  });

  FeedbackState copyWith({
    bool? showFeedback,
    Map<int, String>? feedback,
    Map<int, int>? rating,
    String? error,
  }) {
    return FeedbackState(
      showFeedback: showFeedback ?? this.showFeedback,
      feedback: feedback ?? this.feedback,
      rating: rating ?? this.rating,
      error: error,
    );
  }

  @override
  List<Object?> get props => [showFeedback, feedback, rating, error];
}

class LoadingPoststate extends FeedbackState {}
