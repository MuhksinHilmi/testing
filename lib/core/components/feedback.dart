
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note/core/components/feedback_form.dart';
import 'package:note/features/home/state/cubit/feedback_cubit.dart';

class FeedbackScreen extends StatelessWidget {
  const FeedbackScreen({super.key});

  void onSubmitFeedback(BuildContext context, int surveyId) {
    context.read<FeedbackCubit>().submitFeedback();
  }

  @override
  Widget build(BuildContext context) {
    
    return BlocBuilder<FeedbackCubit, FeedbackState>(
      builder: (context, state) {
        return Dialog(
                backgroundColor: Colors.transparent,
                insetPadding: const EdgeInsets.all(24),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  width: 350,
                  decoration: BoxDecoration(
                    color: Colors.black87, // atau ubah ke Theme.of(context).cardColor
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withAlpha((0.1 * 255).round()),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const FeedbackForm(),

                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 300),
                        child: state.rating == 0
                            ? const SizedBox.shrink()
                            : SizedBox(
                                width: double.infinity,
                                height: 40,
                                child: ElevatedButton(
                                  onPressed: state.rating.values.first > 0
                                      ? () =>
                                          onSubmitFeedback(context, 1)
                                      : null,
                                  child: Text(
                                    "Kirim",
                                    style: TextStyle(
                                        color: state.rating == 0
                                            ? Colors.white
                                            : Colors.black),
                                  ),
                                ),
                              ),
                      ),
                    ],
                  ),
                ),
              );
            }
          
    );
  }
}
