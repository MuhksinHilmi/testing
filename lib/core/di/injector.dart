import 'package:get_it/get_it.dart';
import 'package:note/core/network/api_client.dart';
import 'package:note/data/providers/post_provider.dart';
import 'package:note/data/repositories/post_repository.dart';

final getIt = GetIt.instance;

Future<void> setupDependencies() async {
  // Register API Client
  getIt.registerSingleton<ApiClient>(
    ApiClient('https://jsonplaceholder.typicode.com'),
  );

  // Register Providers and Repositories
  getIt.registerSingleton<PostProvider>(
    PostProvider(getIt<ApiClient>()),
  );

  getIt.registerSingleton<PostRepository>(
    PostRepository(getIt<PostProvider>()),
  );
}
