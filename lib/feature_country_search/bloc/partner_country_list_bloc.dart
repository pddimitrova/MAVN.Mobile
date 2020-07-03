import 'package:flutter/foundation.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lykke_mobile_mavn/base/dependency_injection/app_module.dart';
import 'package:lykke_mobile_mavn/base/remote_data_source/api/country/response_model/partner_country_list_response_model.dart';
import 'package:lykke_mobile_mavn/base/remote_data_source/api/error/exception_to_message_mapper.dart';
import 'package:lykke_mobile_mavn/base/repository/country/country_repository.dart';
import 'package:lykke_mobile_mavn/base/repository/local/local_settings_repository.dart';
import 'package:lykke_mobile_mavn/feature_country_search/bloc/partner_country_list_bloc_output.dart';
import 'package:lykke_mobile_mavn/library_bloc/core.dart';
import 'package:lykke_mobile_mavn/library_dependency_injection/core.dart';
import 'package:pedantic/pedantic.dart';

export 'package:lykke_mobile_mavn/base/common_blocs/country_list_bloc_output.dart';

class PartnerCountryListBloc extends Bloc<PartnerCountryListState> {
  PartnerCountryListBloc(
    this._countryRepository,
    this._exceptionToMessageMapper,
    this._localSettingsRepository,
  );

  final CountryRepository _countryRepository;
  final ExceptionToMessageMapper _exceptionToMessageMapper;
  final LocalSettingsRepository _localSettingsRepository;

  @override
  PartnerCountryListState initialState() =>
      PartnerCountryListUninitializedState();

  Future<void> loadPartnerCountryList() async {
    setState(PartnerCountryListLoadingState());

    try {
      final countryListResponse =
          await _countryRepository.getPartnerCountryList();

      setState(PartnerCountryListLoadedState(
        countryList: countryListResponse.countryList,
      ));

      ///check if the user has previously selected a country
      final selectedCountryIso3 =
          _localSettingsRepository.getPartnerCountryIso3();
      if (selectedCountryIso3 == null) return;

      final selectedCountry = countryListResponse.countryList.firstWhere(
          (element) => element.countryIso3Code == selectedCountryIso3,
          orElse: () => null);

      if (selectedCountry == null) return;

      setState(PartnerCountrySelectedState(
        countryList: countryListResponse.countryList,
        partnerCountry: selectedCountry,
      ));

      sendEvent(
          PartnerCountrySelectedEvent(userPartnerCountry: selectedCountry));
    } on Exception catch (e) {
      final errorMessage = _exceptionToMessageMapper.map(e);

      setState(PartnerCountryListErrorState(errorMessage));
    }
  }

  Future<void> selectCountry({@required PartnerCountry partnerCountry}) {
    _localSettingsRepository.setPartnerCountryIso3(
        iso3Code: partnerCountry.countryIso3Code);
    if (currentState is PartnerCountryListLoadedState) {
      setState(PartnerCountrySelectedState(
        countryList:
            (currentState as PartnerCountryListLoadedState).countryList,
        partnerCountry: partnerCountry,
      ));
    }

    sendEvent(PartnerCountrySelectedEvent(userPartnerCountry: partnerCountry));
  }

  Future<void> selectCountryByName({@required String countryName}) async {
    if (currentState is! PartnerCountryListLoadedState) return;
    final selectedCountry = (currentState as PartnerCountryListLoadedState)
        .countryList
        .firstWhere(
            (element) => element.name
                .toLowerCase()
                .startsWith(countryName.toLowerCase()),
            orElse: () => null);

    if (selectedCountry == null) return;

    unawaited(selectCountry(partnerCountry: selectedCountry));
  }
}

PartnerCountryListBloc usePartnerCountryListBloc() =>
    ModuleProvider.of<AppModule>(useContext()).partnerCountryBloc;
