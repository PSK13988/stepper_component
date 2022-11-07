import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:stepper_component/models/campaign_model.dart';
import 'package:stepper_component/utils/campaign_data_util.dart';

class CampaignDataProvider extends ChangeNotifier {
  final CampaignDataUtil _campaignDataUtil = CampaignDataUtil();

  List<CampaignModel> _campaignDataList = [];

  List<CampaignModel> get campaignDataList => _campaignDataList;

  int _index = 0;

  int get index => _index;

  int get stepSize => _campaignDataList.length - 1;

  CampaignDataProvider() {
    _loadCampaignData();
  }

  void _loadCampaignData() async {
    _campaignDataList = await _campaignDataUtil.getStepperData();
    notifyListeners();
  }

  void setIndex(int value) {
    _index = value;
    notifyListeners();
  }

  void onStepCancel() {
    if (index > 0) {
      final i = index - 1;
      updateIsCompleted(_index, false);
      setIndex(i);
    } else {
      updateIsCompleted(index, false);
      notifyListeners();
    }
  }

  void onStepContinue() {
    if (index < campaignDataList.length - 1) {
      final i = index + 1;
      updateIsCompleted(_index, true);
      setIndex(i);
    } else if (stepSize == index) {
      updateIsCompleted(index, true);
      notifyListeners();
      showToast('Reach to end of stepper');
    }
  }

  void updateIsCompleted(int index, bool value) =>
      _campaignDataList[index].isCompleted = value;

  void showToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
