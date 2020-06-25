import 'package:lykke_mobile_mavn/app/resources/lazy_localized_strings.dart';
import 'package:lykke_mobile_mavn/base/common_blocs/base_bloc_output.dart';
import 'package:lykke_mobile_mavn/base/remote_data_source/api/country/response_model/partner_country_list_response_model.dart';
import 'package:lykke_mobile_mavn/library_bloc/core.dart';
import 'package:meta/meta.dart';

abstract class PartnerCountryListState extends BaseState {}

class PartnerCountryListUninitializedState extends PartnerCountryListState {}

class PartnerCountryListLoadingState extends PartnerCountryListState
    with BaseLoadingState {}

class PartnerCountryListErrorState extends PartnerCountryListState {
  PartnerCountryListErrorState(this.error);

  final LocalizedStringBuilder error;

  @override
  List get props => super.props..addAll([error]);
}

class PartnerCountryListLoadedState extends PartnerCountryListState {
  PartnerCountryListLoadedState({
    @required this.countryList,
  });

  final List<PartnerCountry> countryList;
}

class PartnerCountrySelectedState extends PartnerCountryListLoadedState {
  PartnerCountrySelectedState({
    @required List<PartnerCountry> countryList,
    @required this.partnerCountry,
  }) : super(countryList: countryList);

  final PartnerCountry partnerCountry;
}

class PartnerCountrySelectedEvent extends BlocEvent {
  PartnerCountrySelectedEvent({this.userPartnerCountry});

  final PartnerCountry userPartnerCountry;
}
