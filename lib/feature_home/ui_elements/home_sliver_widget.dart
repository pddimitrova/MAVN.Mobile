import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lykke_mobile_mavn/base/common_blocs/generic_details_bloc_state.dart';
import 'package:lykke_mobile_mavn/feature_home/bloc/campaign_of_day_bloc.dart';
import 'package:lykke_mobile_mavn/feature_home/bloc/expiring_voucher_bloc.dart';
import 'package:lykke_mobile_mavn/feature_home/bloc/pending_voucher_bloc.dart';
import 'package:lykke_mobile_mavn/feature_home/ui_elements/campaign_of_day_widget.dart';
import 'package:lykke_mobile_mavn/feature_home/ui_elements/expiring_voucher_widget.dart';
import 'package:lykke_mobile_mavn/feature_home/ui_elements/pending_voucher_widget.dart';
import 'package:lykke_mobile_mavn/feature_voucher_details/bloc/cancel_voucher_bloc.dart';
import 'package:lykke_mobile_mavn/feature_voucher_details/bloc/cancel_voucher_bloc_state.dart';
import 'package:lykke_mobile_mavn/feature_voucher_purchase/bloc/voucher_purchase_success_bloc.dart';
import 'package:lykke_mobile_mavn/feature_voucher_purchase/bloc/voucher_purchase_success_bloc_output.dart';
import 'package:lykke_mobile_mavn/feature_voucher_usage/bloc/voucher_usage_success_bloc.dart';
import 'package:lykke_mobile_mavn/feature_voucher_usage/bloc/voucher_usage_success_bloc_output.dart';
import 'package:lykke_mobile_mavn/library_bloc/core.dart';
import 'package:lykke_mobile_mavn/library_ui_components/error/network_error.dart';
import 'package:lykke_mobile_mavn/library_ui_components/misc/spinner.dart';

class HomeSliverWidget extends HookWidget {
  static const height = 240.0;

  @override
  Widget build(BuildContext context) {
    final pendingVoucherBloc = usePendingVoucherBloc();
    final pendingVoucherState = useBlocState(pendingVoucherBloc);
    final expiringVoucherBloc = useExpiringVoucherBloc();
    final expiringVoucherState = useBlocState(expiringVoucherBloc);
    final campaignOfDayBloc = useCampaignOfDayBloc();
    final campaignOfDayState = useBlocState(campaignOfDayBloc);

    final cancelVoucherBloc = useCancelVoucherBloc();
    final voucherPurchaseSuccessBloc = useVoucherPurchaseSuccessBloc();
    final voucherUsageBloc = useVoucherUsageSuccessBloc();

    void loadData() {
      pendingVoucherBloc.getDetails();
      expiringVoucherBloc.getDetails();
      campaignOfDayBloc.getDetails();
    }

    useBlocEventListener(cancelVoucherBloc, (event) {
      if (event is CancelVoucherSuccessEvent) {
        loadData();
      }
    });

    useBlocEventListener(voucherPurchaseSuccessBloc, (event) {
      if (event is VoucherPurchaseSuccessSuccessEvent) {
        loadData();
      }
    });

    useBlocEventListener(voucherUsageBloc, (event) {
      if (event is VoucherUsageSuccessEvent) {
        loadData();
      }
    });

    useEffect(() {
      loadData();
    }, [pendingVoucherBloc, expiringVoucherBloc, campaignOfDayBloc]);

    final isLoading = [
      pendingVoucherState,
      expiringVoucherBloc,
      campaignOfDayState
    ].any((state) => state is GenericDetailsLoadingState);

    final isNetworkError = [
      pendingVoucherState,
      expiringVoucherBloc,
      campaignOfDayState
    ].any((state) => state is GenericDetailsNetworkErrorState);

    return Container(
      child: Column(
        children: <Widget>[
          if (isLoading) const Spinner(),
          if (isNetworkError) NetworkErrorWidget(onRetry: loadData),
          _buildSliverWidget(
            pendingVoucherState,
            expiringVoucherState,
            campaignOfDayState,
          ),
        ],
      ),
    );
  }

  Widget _buildSliverWidget(
    GenericDetailsState pendingVoucherState,
    GenericDetailsState expiringVoucherState,
    GenericDetailsState campaignOfDayState,
  ) {
    if (pendingVoucherState is GenericDetailsLoadedState) {
      return PendingVoucherWidget();
    }
    if (expiringVoucherState is GenericDetailsLoadedState) {
      return ExpiringVoucherWidget();
    }
    if (campaignOfDayState is GenericDetailsLoadedState) {
      return CampaignOfDayWidget();
    }
    return Container();
  }
}
