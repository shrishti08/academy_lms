import 'package:academy_lms/Locale/locales.dart';
import 'package:academy_lms/Theme/colors.dart';
import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class NotificationList {
  final String? message;
  final String time;

  NotificationList(this.message, this.time);
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var locale = AppLocalizations.of(context)!;
    List<NotificationList> _notificationList = [
      NotificationList(locale.notificationOne, '12:29 pm'),
      NotificationList(locale.notificationTwo, '11:33 pm'),
      NotificationList(locale.notificationThree, '12:29 pm'),
      NotificationList(locale.notificationOne, '12:29 pm'),
      NotificationList(locale.notificationTwo, '12:29 pm'),
      NotificationList(locale.notificationThree, '12:29 pm'),
      NotificationList(locale.notificationOne, '11:33 pm'),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          locale.notifications!,
          style: theme.textTheme.headline6,
        ),
      ),
      body: FadedSlideAnimation(
        Stack(
          children: [
            Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 50,
                  color: theme.primaryColor,
                ),
                Expanded(
                  child: Container(
                    color: textFieldColor,
                    height: double.infinity,
                  ),
                ),
              ],
            ),
            ListView.builder(
                itemCount: _notificationList.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return FadedScaleAnimation(
                    Container(
                      padding: EdgeInsets.all(12),
                      margin: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: theme.scaffoldBackgroundColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ListTile(
                        title: Text(
                          _notificationList[index].message!,
                          style: theme.textTheme.subtitle1!.copyWith(
                            color: textColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        subtitle: Text(
                          _notificationList[index].time,
                          style: theme.textTheme.subtitle2!.copyWith(
                            height: 2,
                          ),
                        ),
                      ),
                    ),
                  );
                })
          ],
        ),
        beginOffset: Offset(0, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }
}
