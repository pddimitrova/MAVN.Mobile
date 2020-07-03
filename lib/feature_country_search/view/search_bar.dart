import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lykke_mobile_mavn/app/resources/color_styles.dart';
import 'package:lykke_mobile_mavn/app/resources/localized_strings.dart';
import 'package:lykke_mobile_mavn/app/resources/svg_assets.dart';
import 'package:lykke_mobile_mavn/app/resources/text_styles.dart';
import 'package:lykke_mobile_mavn/base/remote_data_source/api/country/response_model/partner_country_list_response_model.dart';
import 'package:lykke_mobile_mavn/feature_country_search/bloc/partner_country_list_bloc.dart';
import 'package:lykke_mobile_mavn/feature_country_search/bloc/partner_country_list_bloc_output.dart';
import 'package:lykke_mobile_mavn/library_bloc/core.dart';
import 'package:lykke_mobile_mavn/library_ui_components/misc/scaled_down_svg.dart';
import 'package:lykke_mobile_mavn/library_ui_components/misc/spinner.dart';

class SearchBar extends HookWidget {
  const SearchBar({
    @required this.inputGlobalKey,
    @required this.selectedCountryValueNotifier,
  });

  static const preferredHeight = 43.0;

  final ValueNotifier<PartnerCountry> selectedCountryValueNotifier;
  final GlobalKey<AutoCompleteTextFieldState<PartnerCountry>> inputGlobalKey;

  @override
  Widget build(BuildContext context) {
    final localizedStrings = useLocalizedStrings();

    final partnerCountryBloc = usePartnerCountryListBloc();
    final partnerCountryState = useBlocState(partnerCountryBloc);

    final textEditingController = useTextEditingController();

    useBlocEventListener(partnerCountryBloc, (event) {
      if (event is PartnerCountrySelectedEvent) {
        selectedCountryValueNotifier.value = event.userPartnerCountry;
        textEditingController.text = event.userPartnerCountry.name;
      }
    });

    useEffect(() {
      partnerCountryBloc.loadPartnerCountryList();
    }, [partnerCountryBloc]);

    return Container(
      color: ColorStyles.transparent,
      child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          decoration: BoxDecoration(
            color: ColorStyles.wildSand,
            borderRadius: const BorderRadius.all(Radius.circular(25)),
          ),
          child: partnerCountryState is PartnerCountryListLoadedState
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    ScaledDownSvg(asset: SvgAssets.search),
                    const SizedBox(width: 8),
                    Expanded(
                      child: AutoCompleteTextField<PartnerCountry>(
                        key: inputGlobalKey,
                        style: TextStyles.darkBodyBody2RegularHigh,
                        decoration: InputDecoration(
                          hintText: localizedStrings.searchForCountries,
                          border: InputBorder.none,
                          hintStyle: TextStyles.darkBodyBody2RegularHigh,
                          contentPadding: const EdgeInsets.all(0),
                          isDense: true,
                        ),
                        itemBuilder: (context, item) => _buildItem(item),
                        suggestions:
                            partnerCountryState is PartnerCountryListLoadedState
                                ? partnerCountryState.countryList
                                : [],
                        itemSubmitted: (item) => partnerCountryBloc
                            .selectCountry(partnerCountry: item),
                        textSubmitted: (text) => partnerCountryBloc
                            .selectCountryByName(countryName: text),
                        itemSorter: (a, b) => a.name.compareTo(b.name),
                        itemFilter: (suggestion, query) => suggestion.name
                            .toLowerCase()
                            .startsWith(query.toLowerCase()),
                        clearOnSubmit: false,
                        textCapitalization: TextCapitalization.words,
                        controller: textEditingController,
                      ),
                    ),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[Spinner()],
                )),
    );
  }

  Widget _buildItem(PartnerCountry partnerCountry) => Container(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: <Widget>[
            if (selectedCountryValueNotifier.value?.countryIso3Code ==
                partnerCountry.countryIso3Code)
              Container(
                  height: 24,
                  width: 24,
                  child: SvgPicture.asset(SvgAssets.checkMark))
            else
              const SizedBox(width: 24),
            Text(
              partnerCountry.name,
              style: TextStyles.darkBodyBody1RegularHigh.copyWith(height: 1.2),
            ),
          ],
        ),
      );
}
