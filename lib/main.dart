import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int activeStep = 0;
  int activeStep2 = 0;
  int reachedStep = 0;
  int upperBound = 5;
  double progress = 0.2;
  Set<int> reachedSteps = <int>{0, 2, 4, 5};

  void increaseProgress() {
    if (progress < 1) {
      setState(() => progress += 0.2);
    } else {
      setState(() => progress = 0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Example',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: Colors.purple,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.blue,
          accentColor: Colors.deepOrange,
          backgroundColor: Colors.white,
        ),
      ),
      home: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                EasyStepper(
                  
                  activeStep: activeStep,
                  lineStyle: const LineStyle(
                    defaultLineColor: Color(0xffEFF6FC),
                    activeLineColor: Color(0xffEFF6FC),
                    finishedLineColor: Color(0xff74ABDC),
                    lineLength: 50,
                    lineType: LineType.normal,
                    lineThickness: 3,
                    lineSpace: 0,
                    lineWidth: 10,
                    unreachedLineType: LineType.normal,
                  ),
                  stepShape: StepShape.circle,
                  stepBorderRadius: 15,
                  borderThickness: 2,
                  padding: const EdgeInsetsDirectional.symmetric(
                    horizontal: 30,
                    vertical: 20,
                  ),
                  stepRadius: 15,
                  finishedStepTextColor: Colors.white,
                  finishedStepBackgroundColor: const Color(0xff74ABDC),
                  unreachedStepBackgroundColor: const Color(0xffEFF6FC),
                  unreachedStepBorderType: BorderType.normal,
                  unreachedStepBorderColor: const Color(0xffEFF6FC),
                  activeStepBackgroundColor: const Color(0xff005CAF),
                  activeStepBorderColor: const Color(0xff005CAF),
                  showLoadingAnimation: false,
                  steps: [
                    EasyStep(
                      customStep: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Opacity(
                          opacity: activeStep >= 0 ? 1 : 0.3,
                          child: const Text('1', style: TextStyle(color: Colors.white),),
                        ),
                      ),
                    ),
                    EasyStep(
                      customStep: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Opacity(
                          opacity: activeStep >= 1 ? 1 : 0.3,
                          child: const Text('2', style: TextStyle(color: Colors.white),),
                        ),
                      ),
                    ),
                    EasyStep(
                      customStep: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Opacity(
                          opacity: activeStep >= 2 ? 1 : 0.3,
                          child:const Text('3', style: TextStyle(color: Colors.white),),
                        ),
                      ),
                    ),
                    EasyStep(
                      customStep: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Opacity(
                          opacity: activeStep >= 3 ? 1 : 0.3,
                          child: const Text('4', style: TextStyle(color: Colors.white),),
                        ),
                      ),
                    ),
                    EasyStep(
                      customStep: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Opacity(
                          opacity: activeStep >= 4 ? 1 : 0.3,
                          child: const Text('5', style: TextStyle(color: Colors.white),),
                        ),
                      ),
                    ),
                  ],
                  onStepReached: (index) => setState(() => activeStep = index),
                ),
                SizedBox(
                  height: 200,
                  width: double.infinity,
                  child: activeStep==0?const  Column(
                    children: [
                      Text('Personal Information'),
                       SizedBox(height: 5),
                      Text('Field'),
                        SizedBox(height: 5),
                      Text('Field'),
                        SizedBox(height: 5),
                      Text('Field'),
                        SizedBox(height: 5),
                      Text('Field'),

                    ],
                  ): activeStep==1?const Column(
                    children: [
                      Text('Contact Information'),
                       SizedBox(height: 5),
                      Text('Text Field'),
                        SizedBox(height: 5),
                      Text('Number Field'),
                        SizedBox(height: 5),
                      Text('Field'),
                        SizedBox(height: 5),
                      Text('Field'),
                    ],
                  ):const Column(
                    children: [
                      Text('Payment Information'),
                       SizedBox(height: 5),
                      Text('Bank'),
                        SizedBox(height: 5),
                      Text('MFS'),
                        SizedBox(height: 5),
                      Text('Field'),
                        SizedBox(height: 5),
                      Text('Field'),
                    ],
                  ),
                ),
                // 
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(onPressed: increaseProgress),
      ),
    );
  }

  
}
