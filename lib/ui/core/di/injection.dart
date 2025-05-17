import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:untold/data/repositories/auth/auth_repository.dart';
import 'package:untold/data/repositories/auth/auth_repository_imp.dart';
import 'package:untold/ui/sign_up/view_model/sign_up_view_model.dart';

import '../../../data/services/api_client/api_client.dart';
import '../../../data/services/api_client/dio_api_client.dart';
import '../../login/view_model/login_view_model.dart';
import '../../onboarding/view_model/onboarding_view_model.dart';

final GetIt getIt = GetIt.instance;

void setupDependencies() {
  // Services
  getIt.registerSingleton<ApiClient>(
    DioApiClient(baseUrl: 'https://untold-strapi.api.prod.loomi.com.br/api'),
  );

  // Repositories
  getIt.registerSingleton<AuthRepository>(
    AuthRepositoryImp(
      apiClient: getIt(),
      auth: FirebaseAuth.instance,
      googleSignIn: GoogleSignIn(),
    ),
  );

  // ViewModels (Factory para instâncias por tela)
  // getIt.registerFactory<AuthViewModel>(
  //   () => AuthViewModel(getIt<AuthService>()),
  // );
  getIt.registerFactory<LoginViewModel>(
    () => LoginViewModel(
      authRepository: getIt(),
    ),
  );

  getIt.registerFactory<SingUpViewModel>(
    () => SingUpViewModel(
      authRepository: getIt(),
    ),
  );

  getIt.registerFactory<OnboardingViewModel>(
    () => OnboardingViewModel(
      authRepository: getIt(),
    ),
  );
}
