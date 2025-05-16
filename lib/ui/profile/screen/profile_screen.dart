import 'package:flutter/material.dart';

import '../../../routing/app_routes.dart';
import '../widgets/avatar_widget.dart';
import '../widgets/historyItem_widget.dart';
import '../widgets/option_Button_widget.dart';
import '../widgets/subscription_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
                onTap: () {},
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

class TertiaryButtonWidget extends StatelessWidget {
  const TertiaryButtonWidget({
    super.key,
    required this.borderSideColor,
    this.textColor,
    required this.text,
    required this.onPressed,
  });
  final Color borderSideColor;
  final Color? textColor;
  final String text;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: borderSideColor),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
