class OnBoarding {
  final String title;
  final String image;
  final String description;

  OnBoarding(
      {required this.title, required this.image, required this.description});
}

List<OnBoarding> onboardingContents = [
  OnBoarding(
      title: 'Welcome',
      image: 'assets/welcome.png',
      description:
          'Welcome to Brighter You. Where you can check future analysis of your Problems, Career, Vehicle and much more.'),
  OnBoarding(
      title: 'Question Analysis',
      image: 'assets/question.png',
      description:
          'Check your question analysis by simple questionnaire. Unlimited analysis and much more.'),
  OnBoarding(
      title: 'Health Analysis',
      image: 'assets/fitness.png',
      description:
          'Check your health analysis by simple questionnaire. Unlimited analysis and much more.'),
  OnBoarding(
      title: 'Vehicle Analysis',
      image: 'assets/car.png',
      description:
          'Check your vehicle analysis by simple questionnaire. Unlimited analysis and much more.'),
  OnBoarding(
      title: 'Career Analysis',
      image: 'assets/career.png',
      description:
          'Check your career analysis by simple questionnaire. Unlimited analysis and much more.')
];
