import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stepper_component/providers/campaign_data_provider.dart';
import 'package:stepper_component/views/stepper_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stepper Component',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: _createStepperPage(),
    );
  }

  _createStepperPage() => ChangeNotifierProvider(
        child: const StepperPage(),
        create: (_) => CampaignDataProvider(),
      );
}
