import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note/features/home/state/cubit/feedback_cubit.dart';

class FeedbackForm extends StatelessWidget {
  
  const FeedbackForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeedbackCubit, FeedbackState>(
      builder: (context, state) {
        return Column(
          children: [
            const Text(
              "Bagaimana apakah anda puas dengan layanan kami?",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                final star = index + 1;
                return IconButton(
                  icon: Icon(
                    Icons.star,
                    size: 32,
                    color: star <= state.rating.values.first
                        ? Colors.orange
                        : Colors.grey,
                  ),
                  onPressed: () {
                    context
                        .read<FeedbackCubit>()
                        .setRating(1, star);
                  },
                );
              }),
            ),
            const SizedBox(height: 16),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: state.rating.values.first < 4
                  ? TextField(
                      key: const ValueKey("feedbackField"),
                      onChanged: (value) => context
                          .read<FeedbackCubit>()
                          .setFeedback(2, value),
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: "Kami menghargai setiap masukan",
                        labelStyle:
                            const TextStyle(color: Colors.white, fontSize: 14),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white, width: 2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
            if (state.error != null)
              state.rating.values.first < 4
                  ? Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        state.error!,
                        textAlign: TextAlign.justify,
                        style: const TextStyle(color: Colors.red, fontSize: 12),
                      ),
                    )
                  : const SizedBox.shrink(),
            const SizedBox(height: 16),
          ],
        );
      },
    );
  }
}
