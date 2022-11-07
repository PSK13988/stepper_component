import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import '../models/campaign_model.dart';

class CampaignDataUtil {
  static const platform =
      MethodChannel('stepper_component/getCampaignMethodChannel');

  Future<List<CampaignModel>> getStepperData() async {
    try {
      final campaignData = await platform.invokeMethod('getCampaignData');
      final jsonResponse = jsonDecode(campaignData);
      final data = jsonResponse['campaign_data'] as List;
      List<CampaignModel> campaignList = data
          .map((jsonResponse) => CampaignModel.fromJson(jsonResponse))
          .toList();
      debugPrint(campaignList.length.toString());
      return campaignList;
    } on PlatformException catch (e) {
      debugPrint("Failed to get stepper widget data: '${e.message}'.");
      return [];
    }
  }
}
