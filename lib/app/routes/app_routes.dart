part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const HOME = _Paths.HOME;
  static const LOGIN = _Paths.LOGIN;
  static const REGISTER = _Paths.REGISTER;
  static const SPLASH = _Paths.SPLASH;
  static const BOOK = _Paths.BOOK;
  static const PROFILE = _Paths.PROFILE;
  static const PEMINJAMAN = _Paths.PEMINJAMAN;
  static const ADD_PEMINJAMAN = _Paths.ADD_PEMINJAMAN;
  static const DETAIL = _Paths.DETAIL;
  static const DETAIL_PEMINJAMAN = _Paths.DETAIL_PEMINJAMAN;
  static const EDIT_PROFILE = _Paths.EDIT_PROFILE;
  static const RATING = _Paths.RATING;
}

abstract class _Paths {
  _Paths._();
  static const HOME = '/home';
  static const LOGIN = '/login';
  static const REGISTER = '/register';
  static const SPLASH = '/splash';
  static const BOOK = '/book';
  static const PROFILE = '/profile';
  static const PEMINJAMAN = '/peminjaman';
  static const ADD_PEMINJAMAN = '/add-peminjaman';
  static const DETAIL = '/detail';
  static const DETAIL_PEMINJAMAN = '/detail-peminjaman';
  static const EDIT_PROFILE = '/edit-profile';
  static const RATING = '/rating';
}
