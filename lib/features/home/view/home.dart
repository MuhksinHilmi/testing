import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note/features/home/state/bloc/post_bloc.dart';
import 'package:note/features/home/state/cubit/feedback_cubit.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

void onShowFeedback(BuildContext context, bool current) {  
  context.read<FeedbackCubit>().showFeedback(!current);
}
  @override
  Widget build(BuildContext context) {
    final feedbackState = context.watch<FeedbackCubit>().state;
    debugPrint("${feedbackState.showFeedback}");
    // final currentShow = feedbackState.showFeedback;
    return Scaffold(
      appBar: AppBar(title: const Text("Home"),),
      body: BlocBuilder<PostBloc, PostState>(
        builder: (context, state) {
          if (state is PostLoading) {
            ///loading screen
            return Center(child: CircularProgressIndicator());
          } else if (state is PostError) {
            /// error screen
            return Center(child: Text(state.message));
          } else if (state is PostLoaded) {
            /// success screen
            return ListView.builder(
              itemCount: state.posts.length,
              itemBuilder: (context, index) {
                final post = state.posts[index];
                return ListTile(
                  title: Text(post.title),
                  subtitle: Text(post.body),
                );
              },
            );
          }
          return Center(child: Text('Press button to load posts'));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<PostBloc>().add(FetchPosts()),
        child: Icon(Icons.refresh),
      ),
    );
  }
}