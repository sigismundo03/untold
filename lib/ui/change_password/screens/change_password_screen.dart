import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:untold/ui/change_password/view_model/change_password_view_model.dart';

import '../../core/di/injection.dart';
import '../../core/widgets/primary_button_widget.dart';
import '../../core/widgets/primary_text_field_widget.dart';
import '../../sign_up/screen/sign_up_screen.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final ChangePasswordViewModel _viewModel =
      getIt.get<ChangePasswordViewModel>();
  final TextEditingController _newPassword = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();
  final TextEditingController _currentPassword = TextEditingController();

  void showError(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => AlertDialogWidget(
              title: 'Erro ',
              subtitle: 'Verifique os campos e tente novamente.',
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios,
              color: Color.fromRGBO(170, 115, 240, 1)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      spacing: 16,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Change ',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                                color: Color.fromRGBO(255, 255, 255, 1),
                              ),
                            ),
                            Text(
                              'Password',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                                color: Color.fromRGBO(255, 255, 255, 1),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Observer(builder: (_) {
                          return PrimaryTextFieldWidget(
                            hintText: 'Current password',
                            obscureText: false,
                            suffixIcon: IconButton(
                              onPressed: () {
                                _viewModel.setObscure(!_viewModel.isObscure);
                              },
                              icon: Icon(
                                _viewModel.isObscure
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Color.fromRGBO(108, 109, 122, 1),
                                size: 20,
                              ),
                            ),
                            controller: _currentPassword,
                            onChanged: (value) {
                              _viewModel.setPassword(value);
                            },
                          );
                        }),
                        const SizedBox(height: 16),
                        Divider(
                          thickness: 1,
                          color: Color.fromRGBO(244, 244, 244, 0.2),
                          endIndent: 1,
                          indent: 1,
                          height: 1,
                        ),
                        const SizedBox(height: 16),
                        Observer(builder: (_) {
                          return PrimaryTextFieldWidget(
                            hintText: 'New password',
                            obscureText: false,
                            suffixIcon: IconButton(
                              onPressed: () {
                                _viewModel.setObscureConfirmPassWord(
                                    !_viewModel.isObscureConfirmPassWord);
                              },
                              icon: Icon(
                                _viewModel.isObscureConfirmPassWord
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Color.fromRGBO(108, 109, 122, 1),
                                size: 20,
                              ),
                            ),
                            controller: _newPassword,
                            onChanged: (value) {
                              _viewModel.setNewPassword(value);
                            },
                          );
                        }),
                        Observer(builder: (_) {
                          return PrimaryTextFieldWidget(
                            hintText: 'Confirm new password',
                            obscureText: false,
                            suffixIcon: IconButton(
                              onPressed: () {
                                _viewModel.setObscureConfirmNewPassWord(
                                    !_viewModel.isObscureConfirmNewPassWord);
                              },
                              icon: Icon(
                                _viewModel.isObscureConfirmNewPassWord
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Color.fromRGBO(108, 109, 122, 1),
                                size: 20,
                              ),
                            ),
                            controller: _confirmPassword,
                            onChanged: (value) {
                              _viewModel.setConfirmPassword(value);
                            },
                          );
                        }),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Observer(builder: (_) {
                      return Center(
                        child: _viewModel.validPassword
                            ? CircularProgressIndicator()
                            : PrimaryButtonWidget(
                                onPressed: () async {
                                  if (_viewModel.validPassword) {
                                    await _viewModel.changePassword();
                                    if (_viewModel.status.isSuccess) {
                                      Navigator.pop(context);
                                    } else {
                                      showError(context);
                                    }
                                  } else {
                                    showError(context);
                                  }
                                },
                                text: 'Update Password',
                              ),
                      );
                    }),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
