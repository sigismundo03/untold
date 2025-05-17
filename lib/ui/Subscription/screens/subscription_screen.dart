import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../login/widgets/primary_button_widget.dart';

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({super.key});

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  List<String> qualityList = [
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. ',
    'Lorem ipsum dolor sit amet',
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
    '4K+ Lorem ipsum dolor sit amet',
    'Lorem ipsum dolor sit amet, consectetur  adipiscing elit.',
    'Lorem ipsum dolor sit amet',
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Subscription'),
        centerTitle: true,
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
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            SvgPicture.asset(
              'assets/large_logo.svg',
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Color.fromRGBO(217, 217, 217, 1), BlendMode.srcIn),
            ),
            const SizedBox(height: 32),
            Expanded(
                child: ListView.builder(
              physics: ScrollPhysics(),
              itemCount: qualityList.length,
              itemBuilder: (context, index) {
                final text = qualityList[index];

                return Column(
                  children: [
                    Row(
                      spacing: 8,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: Icon(
                            Icons.check,
                            color: Color.fromRGBO(170, 115, 240, 1),
                            size: 16,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            text,
                            style: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 1),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                  ],
                );
              },
            )),
            Divider(
              thickness: 1,
              color: Color.fromRGBO(244, 244, 244, 0.2),
              endIndent: 1,
              indent: 1,
              height: 1,
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Plan renewal'),
                Text('Dec 12, 2023'),
              ],
            ),
            const SizedBox(height: 16),
            Divider(
              thickness: 1,
              color: Color.fromRGBO(244, 244, 244, 0.2),
              endIndent: 1,
              indent: 1,
              height: 1,
            ),
            const SizedBox(height: 16),
            PrimaryButton(
              onPressed: () {
                Navigator.pop(context);
              },
              text: 'Terminate Plan',
            ),
          ],
        ),
      ),
    );
  }
}
