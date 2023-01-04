import 'package:enayas_app/services/configs/appColors.dart';
import 'package:enayas_app/services/configs/appUtils.dart';
import 'package:enayas_app/view/widgets/text/kText.dart';
import 'package:flutter/material.dart';

class ChatListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(0, 110),
        child: BottomAppBar(
          elevation: 1,
          child: Padding(
            padding: Apputils.paddingH10,
            child: SafeArea(
              child: Column(
                children: [
                  Row(
                    children: [
                      KText(
                        text: 'Messages',
                        fontWeight: FontWeight.w600,
                      ),
                      Apputils.sizeW5,
                      TextButton.icon(
                        onPressed: () {},
                        icon: Icon(
                          Icons.cleaning_services_outlined,
                          size: 15,
                          color: AppColors.black54,
                        ),
                        label: KText(
                          text: 'Mark all as read',
                          fontSize: 12,
                          color: AppColors.black54,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: Apputils.paddingH10,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _button(
                          icon: Icons.chat_bubble_outline,
                          circleColor: Colors.green,
                          title: 'Chats',
                        ),
                        _button(
                          icon: Icons.shopify_outlined,
                          circleColor: Colors.blue,
                          title: 'Order',
                        ),
                        _button(
                          icon: Icons.notifications_active_outlined,
                          circleColor: AppColors.orange,
                          title: 'Notifications',
                        ),
                        _button(
                          icon: Icons.campaign_outlined,
                          circleColor: AppColors.pink,
                          title: 'Promos',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      backgroundColor: AppColors.grey100,
      body: Padding(
        padding: Apputils.paddingAll10,
        child: ListView(
          children: [
            KText(
              text: 'Last 7 days',
              fontSize: 11,
              color: AppColors.black54,
            ),
            Apputils.sizeH10,
            Card(
              elevation: .3,
              child: Container(
                // height: 100,
                child: Padding(
                  padding: Apputils.paddingAll10,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FlutterLogo(),
                          Apputils.sizeW10,
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              KText(
                                text: 'Jhon Doe',
                                fontSize: 12,
                              ),
                              KText(
                                text: 'Yesterday',
                                color: AppColors.black54,
                                fontSize: 9,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Apputils.sizeH5,
                      KText(
                        text: '''Hello! dear. it's available. You can pla...''',
                        color: AppColors.black54,
                        fontSize: 9,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _button({
    required IconData icon,
    required Color circleColor,
    required String title,
  }) {
    return Column(
      children: [
        CircleAvatar(
          radius: 17,
          backgroundColor: circleColor,
          child: Icon(
            icon,
            color: AppColors.white,
            size: 17,
          ),
        ),
        KText(
          text: title,
          color: AppColors.black54,
          fontSize: 11,
        ),
      ],
    );
  }
}
