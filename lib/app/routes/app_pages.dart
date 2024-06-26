import 'package:get/get.dart';

import '../modules/add_peminjaman/bindings/add_peminjaman_binding.dart';
import '../modules/add_peminjaman/views/add_peminjaman_view.dart';
import '../modules/book/bindings/book_binding.dart';
import '../modules/book/views/book_view.dart';
import '../modules/detail/bindings/detail_binding.dart';
import '../modules/detail/views/detail_view.dart';
import '../modules/detail_peminjaman/bindings/detail_peminjaman_binding.dart';
import '../modules/detail_peminjaman/views/detail_peminjaman_view.dart';
import '../modules/disukai/bindings/disukai_binding.dart';
import '../modules/disukai/views/disukai_view.dart';
import '../modules/edit_profile/bindings/edit_profile_binding.dart';
import '../modules/edit_profile/views/edit_profile_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/peminjaman/bindings/peminjaman_binding.dart';
import '../modules/peminjaman/views/peminjaman_view.dart';
import '../modules/pengembalian/bindings/pengembalian_binding.dart';
import '../modules/pengembalian/views/pengembalian_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/rating/bindings/rating_binding.dart';
import '../modules/rating/views/rating_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/riwayat_pinjam/bindings/riwayat_pinjam_binding.dart';
import '../modules/riwayat_pinjam/views/riwayat_pinjam_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.BOOK,
      page: () => const BookView(),
      binding: BookBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.PEMINJAMAN,
      page: () => const PeminjamanView(),
      binding: PeminjamanBinding(),
    ),
    GetPage(
      name: _Paths.ADD_PEMINJAMAN,
      page: () => const AddPeminjamanView(),
      binding: AddPeminjamanBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL,
      page: () => const DetailView(),
      binding: DetailBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_PEMINJAMAN,
      page: () => const DetailPeminjamanView(),
      binding: DetailPeminjamanBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_PROFILE,
      page: () => const EditProfileView(),
      binding: EditProfileBinding(),
    ),
    GetPage(
      name: _Paths.RATING,
      page: () => const RatingView(),
      binding: RatingBinding(),
    ),
    GetPage(
      name: _Paths.DISUKAI,
      page: () => const DisukaiView(),
      binding: DisukaiBinding(),
    ),
    GetPage(
      name: _Paths.RIWAYAT_PINJAM,
      page: () => const RiwayatPinjamView(),
      binding: RiwayatPinjamBinding(),
    ),
    GetPage(
      name: _Paths.PENGEMBALIAN,
      page: () => const PengembalianView(),
      binding: PengembalianBinding(),
    ),
  ];
}
