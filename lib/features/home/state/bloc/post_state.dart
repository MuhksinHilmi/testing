part of 'post_bloc.dart';

sealed class PostState extends Equatable {
  const PostState();
  
  @override
  List<Object> get props => [];
}

final class PostInitial extends PostState {}
class PostLoading extends PostState {}
class PostLoaded extends PostState {
  final List<PostResponse> posts;
  const PostLoaded(this.posts);
}
class PostRefreshData extends PostState {}
class PostDeleteData extends PostState {}
class PostAddData extends PostState {}
class PostError extends PostState {
  final String message;
  const PostError(this.message);
}