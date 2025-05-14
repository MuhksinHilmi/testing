import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:note/data/models/response/post_response.dart';
import 'package:note/data/repositories/post_repository.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostRepository _repo = GetIt.I<PostRepository>();
  PostBloc() : super(PostInitial()) {
    // on<PostEvent>((event, emit) async {
    //   // TODO: implement event handler
    //   switch (event) {
    //     case FetchPosts():
    //       // TODO: Handle this case.
    //       emit(PostLoading());
    //       try {
    //         final posts = await _repo.getPosts();
    //         emit(PostLoaded(posts));
    //       } catch (e) {
    //         emit(PostError(e.toString()));
    //       }
    //   }
    // });
    on<FetchPosts>((event, emit) async {
      emit(PostLoading());
      try {
        final posts = await _repo.getPosts();
        emit(PostLoaded(posts));
      } catch (e) {
        emit(PostError(e.toString()));
      }
    });
  }
}
