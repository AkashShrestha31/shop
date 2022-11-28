// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i27;
import 'package:flutter/cupertino.dart' as _i29;
import 'package:flutter/material.dart' as _i28;

import '../features/add_attributes/presentation/pages/add_attributes_page.dart'
    as _i15;
import '../features/add_category/presentation/pages/add_category_page.dart'
    as _i12;
import '../features/add_products/presentation/pages/add_product_page.dart'
    as _i19;
import '../features/add_settings_items/presentation/pages/add_settings_items_page.dart'
    as _i9;
import '../features/archive/presentation/pages/ArchivePage.dart' as _i10;
import '../features/attributes/presentation/pages/attributes_page.dart' as _i14;
import '../features/boarding_screen/presentation/pages/boarding_screen_page.dart'
    as _i2;
import '../features/category/presentation/pages/category_page.dart' as _i11;
import '../features/category_archive/presentation/pages/category_archive_page.dart'
    as _i13;
import '../features/change_password/presentation/pages/change_password_page.dart'
    as _i23;
import '../features/checkouts/presentation/pages/checkout_page.dart' as _i22;
import '../features/edit_profile/presentation/pages/edit_profile_page.dart'
    as _i20;
import '../features/forget_password/presentation/pages/forget_password_page.dart'
    as _i4;
import '../features/home/presentation/pages/home_page.dart' as _i7;
import '../features/login_screen/presentation/pages/login_screen_page.dart'
    as _i3;
import '../features/new_password/presentation/pages/new_password_page.dart'
    as _i5;
import '../features/OTP_verification/presentation/pages/OTP_verification_page.dart'
    as _i6;
import '../features/product_details/presentation/pages/product_details_page.dart'
    as _i18;
import '../features/products/presentation/pages/products_page.dart' as _i17;
import '../features/qrscan/presentation/pages/qr_scan_page.dart' as _i26;
import '../features/setting_items_description/presentation/pages/setting_items_details.dart'
    as _i8;
import '../features/shopworker/presentation/pages/shopworker_page.dart' as _i24;
import '../features/splash_screen/presentation/pages/splash_screen_page.dart'
    as _i1;
import '../features/transaction_history/presentation/pages/transaction_history_page.dart'
    as _i25;
import '../features/upload_document/presentation/pages/upload_document_page.dart'
    as _i21;
import '../features/view_attributes/presentation/pages/view_attributes_page.dart'
    as _i16;

class AppRouter extends _i27.RootStackRouter {
  AppRouter([_i28.GlobalKey<_i28.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i27.PageFactory> pagesMap = {
    SplashScreenRoute.name: (routeData) {
      return _i27.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SplashScreenPage());
    },
    BoardingScreenRoute.name: (routeData) {
      return _i27.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.BoardingScreenPage());
    },
    LoginScreenRoute.name: (routeData) {
      return _i27.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.LoginScreenPage());
    },
    ForgetPasswordRoute.name: (routeData) {
      final args = routeData.argsAs<ForgetPasswordRouteArgs>(
          orElse: () => const ForgetPasswordRouteArgs());
      return _i27.MaterialPageX<dynamic>(
          routeData: routeData, child: _i4.ForgetPasswordPage(key: args.key));
    },
    NewPasswordRoute.name: (routeData) {
      final args = routeData.argsAs<NewPasswordRouteArgs>(
          orElse: () => const NewPasswordRouteArgs());
      return _i27.MaterialPageX<dynamic>(
          routeData: routeData, child: _i5.NewPasswordPage(key: args.key));
    },
    OTPVerificationRoute.name: (routeData) {
      return _i27.MaterialPageX<dynamic>(
          routeData: routeData, child: _i6.OTPVerificationPage());
    },
    HomeRoute.name: (routeData) {
      return _i27.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.HomePage());
    },
    SettingItemsDetailsRoute.name: (routeData) {
      return _i27.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i8.SettingItemsDetailsPage());
    },
    AddSettingItemsRoute.name: (routeData) {
      return _i27.MaterialPageX<dynamic>(
          routeData: routeData, child: _i9.AddSettingItemsPage());
    },
    ArchiveRoute.name: (routeData) {
      return _i27.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i10.ArchivePage());
    },
    CategoryRoute.name: (routeData) {
      final args = routeData.argsAs<CategoryRouteArgs>();
      return _i27.MaterialPageX<dynamic>(
          routeData: routeData, child: _i11.CategoryPage(name: args.name));
    },
    AddCategoryRoute.name: (routeData) {
      final args = routeData.argsAs<AddCategoryRouteArgs>();
      return _i27.MaterialPageX<dynamic>(
          routeData: routeData, child: _i12.AddCategoryPage(name: args.name));
    },
    CategoryArchiveRoute.name: (routeData) {
      final args = routeData.argsAs<CategoryArchiveRouteArgs>();
      return _i27.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i13.CategoryArchivePage(name: args.name));
    },
    AttributesRoute.name: (routeData) {
      final args = routeData.argsAs<AttributesRouteArgs>();
      return _i27.MaterialPageX<dynamic>(
          routeData: routeData, child: _i14.AttributesPage(name: args.name));
    },
    AddAttributesRoute.name: (routeData) {
      final args = routeData.argsAs<AddAttributesRouteArgs>();
      return _i27.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i15.AddAttributesPage(
              name: args.name, subAttributeList: args.subAttributeList));
    },
    ViewAttributesRoute.name: (routeData) {
      final args = routeData.argsAs<ViewAttributesRouteArgs>();
      return _i27.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i16.ViewAttributesPage(
              name: args.name, subAttributeList: args.subAttributeList));
    },
    ProductsRoute.name: (routeData) {
      final args = routeData.argsAs<ProductsRouteArgs>();
      return _i27.MaterialPageX<dynamic>(
          routeData: routeData, child: _i17.ProductsPage(name: args.name));
    },
    ProductDetailsRoute.name: (routeData) {
      return _i27.MaterialPageX<dynamic>(
          routeData: routeData, child: _i18.ProductDetailsPage());
    },
    AddProductRoute.name: (routeData) {
      final args = routeData.argsAs<AddProductRouteArgs>();
      return _i27.MaterialPageX<dynamic>(
          routeData: routeData, child: _i19.AddProductPage(title: args.title));
    },
    EditProfileRoute.name: (routeData) {
      return _i27.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i20.EditProfilePage());
    },
    UploadDocumentRoute.name: (routeData) {
      return _i27.MaterialPageX<dynamic>(
          routeData: routeData, child: _i21.UploadDocumentPage());
    },
    CheckoutRoute.name: (routeData) {
      return _i27.MaterialPageX<dynamic>(
          routeData: routeData, child: _i22.CheckoutPage());
    },
    ChangePasswordRoute.name: (routeData) {
      return _i27.MaterialPageX<dynamic>(
          routeData: routeData, child: _i23.ChangePasswordPage());
    },
    ShopWorkerRoute.name: (routeData) {
      return _i27.MaterialPageX<dynamic>(
          routeData: routeData, child: _i24.ShopWorkerPage());
    },
    TransactionHistoryRoute.name: (routeData) {
      return _i27.MaterialPageX<dynamic>(
          routeData: routeData, child: _i25.TransactionHistoryPage());
    },
    QRScanRoute.name: (routeData) {
      return _i27.MaterialPageX<dynamic>(
          routeData: routeData, child: _i26.QRScanPage());
    }
  };

  @override
  List<_i27.RouteConfig> get routes => [
        _i27.RouteConfig(SplashScreenRoute.name, path: '/'),
        _i27.RouteConfig(BoardingScreenRoute.name,
            path: '/boarding-screen-page'),
        _i27.RouteConfig(LoginScreenRoute.name, path: '/login-screen-page'),
        _i27.RouteConfig(ForgetPasswordRoute.name,
            path: '/forget-password-page'),
        _i27.RouteConfig(NewPasswordRoute.name, path: '/new-password-page'),
        _i27.RouteConfig(OTPVerificationRoute.name,
            path: '/o-tp-verification-page'),
        _i27.RouteConfig(HomeRoute.name, path: '/home-page'),
        _i27.RouteConfig(SettingItemsDetailsRoute.name,
            path: '/setting-items-details-page'),
        _i27.RouteConfig(AddSettingItemsRoute.name,
            path: '/add-setting-items-page'),
        _i27.RouteConfig(ArchiveRoute.name, path: '/archive-page'),
        _i27.RouteConfig(CategoryRoute.name, path: '/category-page'),
        _i27.RouteConfig(AddCategoryRoute.name, path: '/add-category-page'),
        _i27.RouteConfig(CategoryArchiveRoute.name,
            path: '/category-archive-page'),
        _i27.RouteConfig(AttributesRoute.name, path: '/attributes-page'),
        _i27.RouteConfig(AddAttributesRoute.name, path: '/add-attributes-page'),
        _i27.RouteConfig(ViewAttributesRoute.name,
            path: '/view-attributes-page'),
        _i27.RouteConfig(ProductsRoute.name, path: '/products-page'),
        _i27.RouteConfig(ProductDetailsRoute.name,
            path: '/product-details-page'),
        _i27.RouteConfig(AddProductRoute.name, path: '/add-product-page'),
        _i27.RouteConfig(EditProfileRoute.name, path: '/edit-profile-page'),
        _i27.RouteConfig(UploadDocumentRoute.name,
            path: '/upload-document-page'),
        _i27.RouteConfig(CheckoutRoute.name, path: '/checkout-page'),
        _i27.RouteConfig(ChangePasswordRoute.name,
            path: '/change-password-page'),
        _i27.RouteConfig(ShopWorkerRoute.name, path: '/shop-worker-page'),
        _i27.RouteConfig(TransactionHistoryRoute.name,
            path: '/transaction-history-page'),
        _i27.RouteConfig(QRScanRoute.name, path: '/q-rscan-page')
      ];
}

/// generated route for
/// [_i1.SplashScreenPage]
class SplashScreenRoute extends _i27.PageRouteInfo<void> {
  const SplashScreenRoute() : super(SplashScreenRoute.name, path: '/');

  static const String name = 'SplashScreenRoute';
}

/// generated route for
/// [_i2.BoardingScreenPage]
class BoardingScreenRoute extends _i27.PageRouteInfo<void> {
  const BoardingScreenRoute()
      : super(BoardingScreenRoute.name, path: '/boarding-screen-page');

  static const String name = 'BoardingScreenRoute';
}

/// generated route for
/// [_i3.LoginScreenPage]
class LoginScreenRoute extends _i27.PageRouteInfo<void> {
  const LoginScreenRoute()
      : super(LoginScreenRoute.name, path: '/login-screen-page');

  static const String name = 'LoginScreenRoute';
}

/// generated route for
/// [_i4.ForgetPasswordPage]
class ForgetPasswordRoute extends _i27.PageRouteInfo<ForgetPasswordRouteArgs> {
  ForgetPasswordRoute({_i29.Key? key})
      : super(ForgetPasswordRoute.name,
            path: '/forget-password-page',
            args: ForgetPasswordRouteArgs(key: key));

  static const String name = 'ForgetPasswordRoute';
}

class ForgetPasswordRouteArgs {
  const ForgetPasswordRouteArgs({this.key});

  final _i29.Key? key;

  @override
  String toString() {
    return 'ForgetPasswordRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i5.NewPasswordPage]
class NewPasswordRoute extends _i27.PageRouteInfo<NewPasswordRouteArgs> {
  NewPasswordRoute({_i29.Key? key})
      : super(NewPasswordRoute.name,
            path: '/new-password-page', args: NewPasswordRouteArgs(key: key));

  static const String name = 'NewPasswordRoute';
}

class NewPasswordRouteArgs {
  const NewPasswordRouteArgs({this.key});

  final _i29.Key? key;

  @override
  String toString() {
    return 'NewPasswordRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i6.OTPVerificationPage]
class OTPVerificationRoute extends _i27.PageRouteInfo<void> {
  const OTPVerificationRoute()
      : super(OTPVerificationRoute.name, path: '/o-tp-verification-page');

  static const String name = 'OTPVerificationRoute';
}

/// generated route for
/// [_i7.HomePage]
class HomeRoute extends _i27.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '/home-page');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i8.SettingItemsDetailsPage]
class SettingItemsDetailsRoute extends _i27.PageRouteInfo<void> {
  const SettingItemsDetailsRoute()
      : super(SettingItemsDetailsRoute.name,
            path: '/setting-items-details-page');

  static const String name = 'SettingItemsDetailsRoute';
}

/// generated route for
/// [_i9.AddSettingItemsPage]
class AddSettingItemsRoute extends _i27.PageRouteInfo<void> {
  const AddSettingItemsRoute()
      : super(AddSettingItemsRoute.name, path: '/add-setting-items-page');

  static const String name = 'AddSettingItemsRoute';
}

/// generated route for
/// [_i10.ArchivePage]
class ArchiveRoute extends _i27.PageRouteInfo<void> {
  const ArchiveRoute() : super(ArchiveRoute.name, path: '/archive-page');

  static const String name = 'ArchiveRoute';
}

/// generated route for
/// [_i11.CategoryPage]
class CategoryRoute extends _i27.PageRouteInfo<CategoryRouteArgs> {
  CategoryRoute({required String? name})
      : super(CategoryRoute.name,
            path: '/category-page', args: CategoryRouteArgs(name: name));

  static const String name = 'CategoryRoute';
}

class CategoryRouteArgs {
  const CategoryRouteArgs({required this.name});

  final String? name;

  @override
  String toString() {
    return 'CategoryRouteArgs{name: $name}';
  }
}

/// generated route for
/// [_i12.AddCategoryPage]
class AddCategoryRoute extends _i27.PageRouteInfo<AddCategoryRouteArgs> {
  AddCategoryRoute({required String? name})
      : super(AddCategoryRoute.name,
            path: '/add-category-page', args: AddCategoryRouteArgs(name: name));

  static const String name = 'AddCategoryRoute';
}

class AddCategoryRouteArgs {
  const AddCategoryRouteArgs({required this.name});

  final String? name;

  @override
  String toString() {
    return 'AddCategoryRouteArgs{name: $name}';
  }
}

/// generated route for
/// [_i13.CategoryArchivePage]
class CategoryArchiveRoute
    extends _i27.PageRouteInfo<CategoryArchiveRouteArgs> {
  CategoryArchiveRoute({required String? name})
      : super(CategoryArchiveRoute.name,
            path: '/category-archive-page',
            args: CategoryArchiveRouteArgs(name: name));

  static const String name = 'CategoryArchiveRoute';
}

class CategoryArchiveRouteArgs {
  const CategoryArchiveRouteArgs({required this.name});

  final String? name;

  @override
  String toString() {
    return 'CategoryArchiveRouteArgs{name: $name}';
  }
}

/// generated route for
/// [_i14.AttributesPage]
class AttributesRoute extends _i27.PageRouteInfo<AttributesRouteArgs> {
  AttributesRoute({required String? name})
      : super(AttributesRoute.name,
            path: '/attributes-page', args: AttributesRouteArgs(name: name));

  static const String name = 'AttributesRoute';
}

class AttributesRouteArgs {
  const AttributesRouteArgs({required this.name});

  final String? name;

  @override
  String toString() {
    return 'AttributesRouteArgs{name: $name}';
  }
}

/// generated route for
/// [_i15.AddAttributesPage]
class AddAttributesRoute extends _i27.PageRouteInfo<AddAttributesRouteArgs> {
  AddAttributesRoute(
      {required String? name, required List<_i29.Widget> subAttributeList})
      : super(AddAttributesRoute.name,
            path: '/add-attributes-page',
            args: AddAttributesRouteArgs(
                name: name, subAttributeList: subAttributeList));

  static const String name = 'AddAttributesRoute';
}

class AddAttributesRouteArgs {
  const AddAttributesRouteArgs(
      {required this.name, required this.subAttributeList});

  final String? name;

  final List<_i29.Widget> subAttributeList;

  @override
  String toString() {
    return 'AddAttributesRouteArgs{name: $name, subAttributeList: $subAttributeList}';
  }
}

/// generated route for
/// [_i16.ViewAttributesPage]
class ViewAttributesRoute extends _i27.PageRouteInfo<ViewAttributesRouteArgs> {
  ViewAttributesRoute(
      {required String? name, required List<_i29.Widget> subAttributeList})
      : super(ViewAttributesRoute.name,
            path: '/view-attributes-page',
            args: ViewAttributesRouteArgs(
                name: name, subAttributeList: subAttributeList));

  static const String name = 'ViewAttributesRoute';
}

class ViewAttributesRouteArgs {
  const ViewAttributesRouteArgs(
      {required this.name, required this.subAttributeList});

  final String? name;

  final List<_i29.Widget> subAttributeList;

  @override
  String toString() {
    return 'ViewAttributesRouteArgs{name: $name, subAttributeList: $subAttributeList}';
  }
}

/// generated route for
/// [_i17.ProductsPage]
class ProductsRoute extends _i27.PageRouteInfo<ProductsRouteArgs> {
  ProductsRoute({required String? name})
      : super(ProductsRoute.name,
            path: '/products-page', args: ProductsRouteArgs(name: name));

  static const String name = 'ProductsRoute';
}

class ProductsRouteArgs {
  const ProductsRouteArgs({required this.name});

  final String? name;

  @override
  String toString() {
    return 'ProductsRouteArgs{name: $name}';
  }
}

/// generated route for
/// [_i18.ProductDetailsPage]
class ProductDetailsRoute extends _i27.PageRouteInfo<void> {
  const ProductDetailsRoute()
      : super(ProductDetailsRoute.name, path: '/product-details-page');

  static const String name = 'ProductDetailsRoute';
}

/// generated route for
/// [_i19.AddProductPage]
class AddProductRoute extends _i27.PageRouteInfo<AddProductRouteArgs> {
  AddProductRoute({required String? title})
      : super(AddProductRoute.name,
            path: '/add-product-page', args: AddProductRouteArgs(title: title));

  static const String name = 'AddProductRoute';
}

class AddProductRouteArgs {
  const AddProductRouteArgs({required this.title});

  final String? title;

  @override
  String toString() {
    return 'AddProductRouteArgs{title: $title}';
  }
}

/// generated route for
/// [_i20.EditProfilePage]
class EditProfileRoute extends _i27.PageRouteInfo<void> {
  const EditProfileRoute()
      : super(EditProfileRoute.name, path: '/edit-profile-page');

  static const String name = 'EditProfileRoute';
}

/// generated route for
/// [_i21.UploadDocumentPage]
class UploadDocumentRoute extends _i27.PageRouteInfo<void> {
  const UploadDocumentRoute()
      : super(UploadDocumentRoute.name, path: '/upload-document-page');

  static const String name = 'UploadDocumentRoute';
}

/// generated route for
/// [_i22.CheckoutPage]
class CheckoutRoute extends _i27.PageRouteInfo<void> {
  const CheckoutRoute() : super(CheckoutRoute.name, path: '/checkout-page');

  static const String name = 'CheckoutRoute';
}

/// generated route for
/// [_i23.ChangePasswordPage]
class ChangePasswordRoute extends _i27.PageRouteInfo<void> {
  const ChangePasswordRoute()
      : super(ChangePasswordRoute.name, path: '/change-password-page');

  static const String name = 'ChangePasswordRoute';
}

/// generated route for
/// [_i24.ShopWorkerPage]
class ShopWorkerRoute extends _i27.PageRouteInfo<void> {
  const ShopWorkerRoute()
      : super(ShopWorkerRoute.name, path: '/shop-worker-page');

  static const String name = 'ShopWorkerRoute';
}

/// generated route for
/// [_i25.TransactionHistoryPage]
class TransactionHistoryRoute extends _i27.PageRouteInfo<void> {
  const TransactionHistoryRoute()
      : super(TransactionHistoryRoute.name, path: '/transaction-history-page');

  static const String name = 'TransactionHistoryRoute';
}

/// generated route for
/// [_i26.QRScanPage]
class QRScanRoute extends _i27.PageRouteInfo<void> {
  const QRScanRoute() : super(QRScanRoute.name, path: '/q-rscan-page');

  static const String name = 'QRScanRoute';
}
