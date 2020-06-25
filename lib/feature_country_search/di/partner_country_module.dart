import 'package:lykke_mobile_mavn/feature_country_search/bloc/partner_country_list_bloc.dart';
import 'package:lykke_mobile_mavn/library_dependency_injection/core.dart';

class PartnerCountryModule extends Module {
  PartnerCountryListBloc get partnerCountryBloc => get();

  @override
  void provideInstances() {
    provideSingleton(() => PartnerCountryListBloc(get(), get(), get()));
  }
}
