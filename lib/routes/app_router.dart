import 'package:auto_route/auto_route.dart';
import 'package:shoppos/features/OTP_verification/presentation/pages/OTP_verification_page.dart';
import 'package:shoppos/features/add_attributes/presentation/pages/add_attributes_page.dart';
import 'package:shoppos/features/add_category/presentation/pages/add_category_page.dart';
import 'package:shoppos/features/add_products/presentation/pages/add_product_page.dart';
import 'package:shoppos/features/add_settings_items/presentation/pages/add_settings_items_page.dart';
import 'package:shoppos/features/archive/presentation/pages/ArchivePage.dart';
import 'package:shoppos/features/attributes/presentation/pages/attributes_page.dart';
import 'package:shoppos/features/boarding_screen/presentation/pages/boarding_screen_page.dart';
import 'package:shoppos/features/category/presentation/pages/category_page.dart';
import 'package:shoppos/features/category_archive/presentation/pages/category_archive_page.dart';
import 'package:shoppos/features/change_password/presentation/pages/change_password_page.dart';
import 'package:shoppos/features/checkouts/presentation/pages/checkout_page.dart';
import 'package:shoppos/features/edit_profile/presentation/pages/edit_profile_page.dart';
import 'package:shoppos/features/forget_password/presentation/pages/forget_password_page.dart';
import 'package:shoppos/features/home/presentation/pages/home_page.dart';
import 'package:shoppos/features/login_screen/presentation/pages/login_screen_page.dart';
import 'package:shoppos/features/new_password/presentation/pages/new_password_page.dart';
import 'package:shoppos/features/product_details/presentation/pages/product_details_page.dart';
import 'package:shoppos/features/products/presentation/pages/products_page.dart';
import 'package:shoppos/features/qrscan/presentation/pages/qr_scan_page.dart';
import 'package:shoppos/features/setting_items_description/presentation/pages/setting_items_details.dart';
import 'package:shoppos/features/shopworker/presentation/pages/shopworker_page.dart';
import 'package:shoppos/features/splash_screen/presentation/pages/splash_screen_page.dart';
import 'package:shoppos/features/transaction_history/presentation/pages/transaction_history_page.dart';
import 'package:shoppos/features/upload_document/presentation/pages/upload_document_page.dart';
import 'package:shoppos/features/view_attributes/presentation/pages/view_attributes_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      page: SplashScreenPage,
      initial: true,
    ),
    AutoRoute(
      page: BoardingScreenPage,
    ),
    AutoRoute(
      page: LoginScreenPage,
    ),
    AutoRoute(
      page: ForgetPasswordPage,
    ),
    AutoRoute(
      page: NewPasswordPage,
    ),
    AutoRoute(
      page: OTPVerificationPage,
    ),
    AutoRoute(
      page: HomePage,
    ),
    AutoRoute(
      page: SettingItemsDetailsPage,
    ),
    AutoRoute(
      page: AddSettingItemsPage,
    ),
    AutoRoute(
      page: ArchivePage,
    ),
    AutoRoute(
      page: CategoryPage,
    ),
    AutoRoute(
      page: AddCategoryPage,
    ),
    AutoRoute(
      page: CategoryArchivePage,
    ),
    AutoRoute(page: AttributesPage),
    AutoRoute(page: AddAttributesPage),
    AutoRoute(page: ViewAttributesPage),
    AutoRoute(page: ProductsPage),
    AutoRoute(page: ProductDetailsPage),
    AutoRoute(page: AddProductPage),
    AutoRoute(page: EditProfilePage),
    AutoRoute(page: UploadDocumentPage),
    AutoRoute(page: CheckoutPage),
    AutoRoute(page: ChangePasswordPage),
    AutoRoute(page: ShopWorkerPage),
    AutoRoute(page: TransactionHistoryPage),
    AutoRoute(page: QRScanPage),
  ],
)
// extend the generated private router
class $AppRouter {}
