import 'package:mobx/mobx.dart';
import 'package:untold/data/repositories/auth/auth_repository.dart';
import 'package:untold/domain/models/user_model.dart';

part 'login_view_model.g.dart';

class LoginViewModel = _LoginViewModelBase with _$LoginViewModel;

abstract class _LoginViewModelBase with Store {
  UserModel user = UserModel();
  final AuthRepository _authRepository;

  _LoginViewModelBase({required AuthRepository authRepository})
      : _authRepository = authRepository;

  @observable
  bool isLoading = false;
  @observable
  bool isObscure = true;

  @observable
  String? error;

  @computed
  bool get isFormValid =>
      user.email != null &&
      user.password != null &&
      user.email!.isNotEmpty &&
      user.password!.isNotEmpty;

  @action
  void setObscure(bool value) {
    isObscure = value;
  }

  @action
  void setLoading(bool value) {
    isLoading = value;
  }

  @action
  void setError(String? value) {
    error = value;
  }

  @action
  void setEmail(String value) {
    user = user.copyWith(email: value);
  }

  @action
  void setPassword(String value) {
    user = user.copyWith(password: value);
  }

  @action
  Future<void> login() async {
    isLoading = true;
    error = null;
    if (user.email == null || user.password == null) {
      error = 'Invalid email or password';
      isLoading = false;
      return;
    }

    final result =
        await _authRepository.signInWithEmail(user.email!, user.password!);
    if (result == null) error = 'Invalid email or password';

    isLoading = false;
  }

  @action
  Future<void> loginWithGoogle() async {
    isLoading = true;
    error = null;
    final result = await _authRepository.signInWithGoogle();
    if (result == null) error = 'Invalid email or password';

    isLoading = false;
  }

  @action
  Future<void> loginWithApple() async {}
}
