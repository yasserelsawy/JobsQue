// ignore_for_file: public_member_api_docs, sort_constructors_first
class CompleteProfile {
  String title;
  String subtitle;
  CompleteProfile({
    required this.title,
    required this.subtitle,
  });
}

List<CompleteProfile> completeprofileList = [
  CompleteProfile(
      title: 'Personal Details',
      subtitle: 'Full name, email, phone number, and your address'),
  CompleteProfile(
      title: 'Education',
      subtitle:
          'Enter your educational history to be considered by the recruiter'),
  CompleteProfile(
      title: 'Experience',
      subtitle: 'Enter your work experience to be considered by the recruiter'),
  CompleteProfile(
      title: 'Portfolio',
      subtitle:
          'Create your portfolio. Applying for various types of jobs is easier.'),
];
