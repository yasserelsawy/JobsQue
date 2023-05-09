class Contacts {
  String? name;
  String? message;
  String? image;
  dynamic time;
  Contacts(
      {required this.name,
      required this.message,
      required this.image,
      required this.time});
}

List<Contacts> contactslist = [
  Contacts(
      name: 'Twitter',
      message: 'Here is the link: http://zoom.com/',
      image: 'assets/images/twitter2.png',
      time: '12.39'),
  Contacts(
      name: 'Gojek Indonesia',
      message: 'Lets keep in touch.',
      image: 'assets/images/Gojek2.png',
      time: ' 12.39'),
  Contacts(
      name: 'Shoope',
      message: 'Thank You David!',
      image: 'assets/images/Shoope.png',
      time: '09.45'),
  Contacts(
      name: 'Dana',
      message: 'Thank you for your attention!',
      image: 'assets/images/Dana.png',
      time: 'Yesterday'),
  Contacts(
      name: 'Slack',
      message: 'You: I look forward to hearing from you',
      image: 'assets/images/Slack.png',
      time: '12/8'),
  Contacts(
      name: 'Facebook',
      message: 'You: What about the interview stage?',
      image: 'assets/images/Facebook2.png',
      time: '12/8')
];

class Unreadmessages {
  String? name;
  String? message;
  String? image;
  dynamic time;
  Unreadmessages(
      {required this.name,
      required this.message,
      required this.image,
      required this.time});
}

List<Unreadmessages> unreadmessageslist = [
  Unreadmessages(
      name: 'Twitter',
      message: 'Here is the link: http://zoom.com/',
      image: 'assets/images/twitter2.png',
      time: '12.39'),
  Unreadmessages(
      name: 'Gojek Indonesia',
      message: 'Lets keep in touch.',
      image: 'assets/images/Gojek2.png',
      time: ' 12.39'),
  Unreadmessages(
      name: 'Dana',
      message: 'Thank you for your attention!',
      image: 'assets/images/Dana.png',
      time: 'Yesterday'),
];
