
class OnboardingData {
  final String image;
  final String title;
  final String subtitle;

  OnboardingData({
    required this.image,
    required this.title,
    required this.subtitle,
  });
}

final List<OnboardingData> onboardingItems = [
  OnboardingData(
    image: "assets/image/start1.png",
    title: "Selamat Datang\ndi Competify",
    subtitle: "Temukan tim, mentor, dan lomba terbaik.\nSemua dalam satu tempat!",
  ),
  OnboardingData(
    image: "assets/image/start2.png",
    title: "Kolaborasi Lebih Mudah",
    subtitle: "Temukan tim dan mentor untuk membangun\nstrategi terbaik.",
  ),
  OnboardingData(
    image: "assets/image/start3.png",
    title: "Menangkan Kompetisi",
    subtitle: "Ikuti berbagai kompetisi menarik dan\nraih kemenangan bersama timmu!",
  ),
];
