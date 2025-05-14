import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:untold/data/repositories/auth/auth_repository.dart';
import 'package:untold/data/repositories/auth/auth_repository_imp.dart';

import '../../../data/services/api_client/api_client.dart';
import '../../../data/services/api_client/dio_api_client.dart';

final GetIt getIt = GetIt.instance;

void setupDependencies() {
  // Services
  getIt.registerSingleton<ApiClient>(
    DioApiClient(baseUrl: 'https://untold-strapi.api.prod.loomi.com.br/api'),
  );
  getIt.registerSingleton<FirebaseAuth>(FirebaseAuth.instance);
  getIt.registerSingleton<GoogleSignIn>(GoogleSignIn());

  // Repositories
  getIt.registerSingleton<AuthRepository>(
    AuthRepositoryImp(
      apiClient: getIt(),
      auth: getIt(),
      googleSignIn: getIt(),
    ),
  );

  // ViewModels (Factory para instâncias por tela)
  // getIt.registerFactory<AuthViewModel>(
  //   () => AuthViewModel(getIt<AuthService>()),
  // );
}
