class Savedjobsmodel {
  String? title;
  String? subtitle;
  String? icon;
  String? posttime;
  Savedjobsmodel({
    this.title,
    this.subtitle,
    this.icon,
    this.posttime,
  });
}

List<Savedjobsmodel> savedlist = [
  Savedjobsmodel(
      title: 'Senior UI Designer',
      subtitle: 'Twitter • Jakarta, Indonesia ',
      icon: 'assets/images/Twitter.png',
      posttime: 'Posted 2 days ago'),
  Savedjobsmodel(
      title: 'UI Designer',
      subtitle: 'Spectrum • Jakarta, Indonesia ',
      icon: 'assets/images/Spectrum.png',
      posttime: 'Posted 2 days ago'),
  Savedjobsmodel(
      title: 'Senior UI Designer',
      subtitle: 'VK • Yogyakarta, Indonesia ',
      icon: 'assets/images/VK.png',
      posttime: 'Posted 2 days ago'),
  Savedjobsmodel(
      title: 'Senior UX Designer',
      subtitle: 'Discord • Jakarta, Indonesia ',
      icon: 'assets/images/Discord.png',
      posttime: 'Posted 2 days ago'),
  Savedjobsmodel(
      title: 'Junior UI Designer',
      subtitle: 'Invision • Jakarta, Indonesia ',
      icon: 'assets/images/Invision.png',
      posttime: 'Posted 2 days ago')
];
