import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lykke_mobile_mavn/base/remote_data_source/api/campaign/response_model/campaign_response_model.dart';
import 'package:lykke_mobile_mavn/feature_campaigns_map/di/campaign_map_module.dart';
import 'package:lykke_mobile_mavn/library_dependency_injection/core.dart';

class MarkerHelper {
  List<CampaignResponseModel> getCampaignsForPartnerLocation({
    List<CampaignResponseModel> campaigns,
    String partnerId,
    double lat,
    double long,
  }) =>
      campaigns
          .where((element) =>
              element.partnerId == partnerId &&
              element.locations
                  .any((element) => element.long == long && element.lat == lat))
          .toList();
}

MarkerHelper useMarkerHelper() =>
    ModuleProvider.of<CampaignMapModule>(useContext()).markerHelper;
