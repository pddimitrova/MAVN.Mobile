import 'package:lykke_mobile_mavn/base/local_data_source/shared_preferences_manager/shared_preferences_manager.dart';
import 'package:lykke_mobile_mavn/base/router/router.dart';
import 'package:lykke_mobile_mavn/lib_dynamic_links/routes/dynamic_link_route_base.dart';
import 'package:lykke_mobile_mavn/library_bloc/core.dart';

import '../dynamic_link_routes.dart';

class AppInstallDynamicLinkRoute extends DynamicLinkRouteBase {
  AppInstallDynamicLinkRoute(Router router, this._sharedPreferencesManager)
      : super(router);

  final SharedPreferencesManager _sharedPreferencesManager;

  @override
  String get routeName => DynamicLinkRoutes.appInstallRoute;

  @override
  Future<void> processRequest(Uri uri) async {
    await _sharedPreferencesManager.write(
      key: SharedPreferencesKeys.appReferralCode,
      value: uri.queryParameters['referral-code'],
    );
  }

  @override
  Future<bool> routePendingRequest(BlocEvent fromEvent) async => false;
}
