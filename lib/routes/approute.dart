part of 'routes.dart';

class AppRoute {
  static List<GetPage> getPages() => [
        GetPage(name: "/onboarding", page: () => const OnBoardingPage()),
        GetPage(name: "/jadwal", page: () => const JadwalPage()),
        GetPage(name: "/kiblat", page: () => const KiblatPage()),
        GetPage(name: "/konten", page: () => const KontenPage()),
        GetPage(name: "/detail", page: () => const DetailWidget()),
        GetPage(
            name: "/createOrUpdate",
            page: () => const CreateOrUpdateKontenWidget()),
        GetPage(
            name: "/home",
            page: () => const HomePage(),
            binding: HomeBinding()),
      ];
}
