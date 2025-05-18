import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:untold/data/repositories/auth/auth_repository.dart';
import 'package:untold/data/repositories/auth/auth_repository_imp.dart';
import 'package:untold/data/repositories/profile_repository/profile_repository.dart';
import 'package:untold/ui/profile/view_model/profile_view_model.dart';
import 'package:untold/ui/sign_up/view_model/sign_up_view_model.dart';

import '../../../data/repositories/profile_repository/profile_repository_imp.dart';
import '../../../data/services/api_client/api_client.dart';
import '../../../data/services/api_client/dio_api_client.dart';
import '../../change_password/view_model/change_password_view_model.dart';
import '../../edit_profile/view_model/edit_profile_view_model.dart';
import '../../forgot_password/view_model/forgot_password_view_model.dart';
import '../../login/view_model/login_view_model.dart';
import '../../onboarding/view_model/onboarding_view_model.dart';

final GetIt getIt = GetIt.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();
final FirebaseAuth auth = FirebaseAuth.instance;

void setupDependencies() {
  // Services
  getIt.registerSingleton<ApiClient>(
    DioApiClient(baseUrl: 'https://untold-strapi.api.prod.loomi.com.br/api'),
  );

  // Repositories
  getIt.registerSingleton<AuthRepository>(
    AuthRepositoryImp(
      apiClient: getIt(),
      auth: auth,
      googleSignIn: googleSignIn,
    ),
  );

  getIt.registerSingleton<ProfileRepository>(
    ProfileRepositoryImp(apiClient: getIt(), auth: auth),
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
  getIt.registerFactory<ProfileViewModel>(
    () => ProfileViewModel(
      profileRepository: getIt(),
      authRepository: getIt(),
    ),
  );
  getIt.registerFactory<ChangePasswordViewModel>(
    () => ChangePasswordViewModel(
      profileRepository: getIt(),
    ),
  );

  getIt.registerFactory<EditProfileViewModel>(
    () => EditProfileViewModel(
      profileRepository: getIt(),
    ),
  );
  getIt.registerFactory<ForgotPasswordViewModel>(
    () => ForgotPasswordViewModel(
      authRepository: getIt(),
    ),
  );
}
