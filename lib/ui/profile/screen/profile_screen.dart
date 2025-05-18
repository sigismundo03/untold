import 'package:flutter/material.dart';
import 'package:untold/ui/core/di/injection.dart';
import 'package:untold/ui/core/widgets/exports.dart';

import '../../../data/repositories/auth/auth_repository.dart';
import '../../../data/repositories/profile_repository/profile_repository.dart';
import '../../../routing/app_routes.dart';
import '../widgets/history_item_widget.dart';
import '../widgets/option_button_widget.dart.dart';
import '../widgets/subscription_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    getIt<AuthRepository>().finishOnboarding();
    getIt<ProfileRepository>().getUser();

    super.initState();
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
          onPressed: () {},
        ),
        actions: [
          TertiaryButtonWidget(
            borderSideColor: Color.fromRGBO(188, 76, 241, 0.2),
            text: 'Edit Profile',
            textColor: Color.fromRGBO(170, 115, 240, 1),
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.editProfile);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              AvatarWidget(
                assetName: 'assets/avatar.png',
                text: Text(
                  'Hello',
                  style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontSize: 14,
                  ),
                ),
                subtext: Text(
                  'Eva Mendes',
                  style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              OptionButtonWidget(
                icon: 'assets/lock.svg',
                title: "Change Password",
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.changePassword);
                },
              ),
              const SizedBox(height: 10),
              OptionButtonWidget(
                icon: 'assets/delete.svg',
                title: "Delete my account",
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return WarningShowModalBottomSheet(
                        subtitle:
                            """This action is irreversible and all of your data will be permanently deleted. If you're having any issues with our app, we'd love to help you resolve them.""",
                        title: 'Are you sure you want to delete your account? ',
                        onPrimaryButtonTap: () {
                          Navigator.pop(context);
                        },
                        onSecondaryButtonTap: () {
                          Navigator.pop(context);
                        },
                        primaryButtonText: 'Terminate Plan',
                        secondaryButtonText: 'Cancel',
                      );
                    },
                  );
                },
              ),
              const SizedBox(height: 30),
              const Text(
                "Subscriptions",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              SubscriptionWidget(),
              const SizedBox(height: 30),
              const Text(
                "History",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 100,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    HistoryItemWidget(
                        title: "Barbie",
                        year: "2023",
                        imagePath: "assets/barbie.png"),
                    const SizedBox(width: 12),
                    HistoryItemWidget(
                      title: "Everything",
                      year: "2022",
                      imagePath: "assets/everything.png",
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Center(
                child: TertiaryButtonWidget(
                  borderSideColor: Color.fromRGBO(255, 255, 255, 0.45),
                  text: 'Log out',
                  textColor: Color.fromRGBO(217, 218, 222, 1),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
