import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'feedback_state.dart';

class FeedbackCubit extends Cubit<FeedbackState> {
  FeedbackCubit() : super(FeedbackState());

  void showFeedback(bool show) {
    emit(state.copyWith(showFeedback: show));
  }

  void setFeedback(int id, String feedback) {
    final newFeedback = {id: feedback};
    emit(state.copyWith(feedback: newFeedback));
  }

  void setRating(int id, int rating) {
    if (rating < 0 || rating > 5) return;
    final newRating = {id: rating};
    emit(state.copyWith(rating: newRating));
  }

  void fetchPost() {
    emit(LoadingPoststate());
    
  }

  void submitFeedback() {
    final currentRating = state.rating.values.firstOrNull ?? 0;
    final currentFeedback = state.feedback.values.firstOrNull?.trim() ?? '';

    if (currentRating < 4 && currentFeedback.isEmpty) {
      emit(state.copyWith(
          error:
              "Kami mohon masukan Anda agar kami bisa memberikan pengalaman yang lebih baik ke depannya"));
    } else {
      // proses kirim data ke backend, misalnya
      emit(state.copyWith(error: null));
      emit(const FeedbackState());
    }
  }
}
