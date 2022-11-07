import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stepper_component/providers/campaign_data_provider.dart';

class StepperPage extends StatelessWidget {
  const StepperPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => createLayout();

  Widget createLayout() => Scaffold(
        appBar: AppBar(
          title: const Text('Stepper Component'),
        ),
        body: Column(
          children: const [
            Expanded(
              child: StepperWidget(),
            ),
          ],
        ),
      );
}

class StepperWidget extends StatelessWidget {
  const StepperWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CampaignDataProvider>(
      builder: (context, provider, child) => provider.campaignDataList.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : Stepper(
              controlsBuilder: (context, controls) =>
                  createStepperButtons(provider, controls),
              currentStep: provider.index,
              onStepCancel: provider.onStepCancel,
              onStepContinue: provider.onStepContinue,
              onStepTapped: provider.setIndex,
              steps: provider.campaignDataList
                  .map(
                    (e) => Step(
                      state: e.isCompleted ?? false
                          ? StepState.complete
                          : StepState.indexed,
                      title: Text(e.title ?? ''),
                      subtitle: Text(e.isDone ?? false ? 'Last step' : ''),
                      content: Text(e.message ?? ''),
                      isActive: e.isNext!,
                    ),
                  )
                  .toList(),
            ),
    );
  }

  Row createStepperButtons(
          CampaignDataProvider provider, ControlsDetails controls) =>
      Row(
        children: <Widget>[
          provider.index == provider.stepSize
              ? ElevatedButton(
                  onPressed: controls.onStepContinue,
                  child: const Text('FINISH'),
                )
              : ElevatedButton(
                  onPressed: controls.onStepContinue,
                  child: const Text('CONTINUE'),
                ),
          TextButton(
            onPressed: controls.onStepCancel,
            child: const Text('BACK'),
          ),
        ],
      );
}
