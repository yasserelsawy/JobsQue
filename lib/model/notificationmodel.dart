// ignore_for_file: public_member_api_docs, sort_constructors_first
class Notifications {
  String? title;
  String? subtitle;
  String? icon;
  String? time;
  Notifications({
    this.title,
    this.subtitle,
    this.icon,
    this.time,
  });
}

List<Notifications> notificationList = [
  Notifications(
      title: 'Dana',
      subtitle: 'Posted new design jobs',
      icon: 'assets/images/Dana.png',
      time: '10.00AM'),
  Notifications(
      title: 'Shoope',
      subtitle: 'Posted new design jobs',
      icon: 'assets/images/Shoope.png',
      time: '10.00AM'),
  Notifications(
      title: 'Slack',
      subtitle: 'Posted new design jobs',
      icon: 'assets/images/Slack.png',
      time: '10.00AM'),
  Notifications(
      title: 'Facebook',
      subtitle: 'Posted new design jobs',
      icon: 'assets/images/Facebook2.png',
      time: '10.00AM')
];

class OldNotification {
  String? title;
  String? subtitle;
  String? icon;
  String? time;
  OldNotification({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.time,
  });
}

List<OldNotification> oldnotificationList = [
  OldNotification(
      title: 'Email setup successful',
      subtitle:
          'Your email setup was successful with the following details: Your new email is rafifdianganz@gmail.com.',
      icon: 'assets/images/email2.png',
      time: '10.00AM'),
  OldNotification(
      title: 'Welcome to Jobsque',
      subtitle:
          'Hello Rafif Dian Axelingga, thank you for registering Jobsque. Enjoy the various features that....',
      icon: 'assets/images/welcomelogo.png',
      time: '8.00AM'),
];
