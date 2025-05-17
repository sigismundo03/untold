import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../login/widgets/primary_button_widget.dart';
import '../../login/widgets/primary_text_field_widget.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
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
                              onPressed: () {},
                              icon: Icon(
                                Icons.visibility_off,
                                color: Color.fromRGBO(108, 109, 122, 1),
                                size: 20,
                              ),
                            ),
                            controller: TextEditingController(),
                            onChanged: (_) {},
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
                              onPressed: () {},
                              icon: Icon(
                                Icons.visibility_off,
                                color: Color.fromRGBO(108, 109, 122, 1),
                                size: 20,
                              ),
                            ),
                            controller: TextEditingController(),
                            onChanged: (_) {},
                          );
                        }),
                        Observer(builder: (_) {
                          return PrimaryTextFieldWidget(
                            hintText: 'Confirm new password',
                            obscureText: false,
                            suffixIcon: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.visibility_off,
                                color: Color.fromRGBO(108, 109, 122, 1),
                                size: 20,
                              ),
                            ),
                            controller: TextEditingController(),
                            onChanged: (_) {},
                          );
                        }),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Observer(builder: (_) {
                      return Center(
                        child: PrimaryButtonWidget(
                          onPressed: () {
                            Navigator.pop(context);
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
