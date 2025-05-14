import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note/core/components/feedback.dart';
import 'package:note/features/home/state/bloc/home_bloc.dart';
import 'package:note/features/home/state/bloc/post_bloc.dart';
import 'package:note/features/home/state/cubit/counter_cubit.dart';
import 'package:note/features/home/state/cubit/feedback_cubit.dart';
import 'package:note/features/home/view/home.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FeedbackCubit(),
        ),
        BlocProvider(
          create: (context) => CounterCubit(),
        ),
        BlocProvider(create: (context) => PostBloc()),
        BlocProvider(create: (context) => HomeBloc())
      ],
      child: MaterialApp(
        title: 'Note App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: BlocBuilder<FeedbackCubit, FeedbackState>(
          builder: (context, state) {
            final isShow = state.showFeedback;

            return BlocListener<PostBloc, PostState>(
              listener: (context, state) {
                debugPrint("${state}");
              },
              child: Stack(
                children: [
                  const HomeScreen(),
                  if (isShow) const FeedbackScreen(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
