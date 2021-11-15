part of 'routes.dart';

class AppRoute {
  static List<GetPage> getPages() => [
        GetPage(name: "/onboardingpage", page: () => const OnBoardingPage()),
        GetPage(name: "/jadwalpage", page: () => const JadwalPage()),
        GetPage(name: "/kiblatpage", page: () => KiblatPage()),
        GetPage(
            name: "/homepage",
            page: () => const HomePage(),
            binding: HomeBinding()),
      ];
}
