import 'package:dynamic_app_icon/dynamic_app_icon.dart';
import 'package:flutter/material.dart';

import 'package:rive/rive.dart';
// ignore: implementation_imports
// I didn't find another way to subscribe to animation
import 'package:rive/src/core/core.dart';

void main() {
  runApp(const DynamicAppIconExample());
}

class DynamicAppIconExample extends StatelessWidget {
  const DynamicAppIconExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dynamic App Icon Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const Demo(),
    );
  }
}

class NotifierController extends StateMachineController with ChangeNotifier {
  NotifierController(super.stateMachine);

  @override
  void apply(CoreContext core, double elapsedSeconds) {
    super.apply(core, elapsedSeconds);
    notifyListeners();
  }
}

NotifierController? notifierControllerFromArtboard(
  Artboard artboard,
  String name,
) {
  for (final animation in artboard.animations) {
    if (animation is StateMachine && animation.name == name) {
      return NotifierController(animation);
    }
  }

  return null;
}

class Demo extends StatefulWidget {
  const Demo({Key? key}) : super(key: key);

  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  NotifierController? ctrl;
  bool revealed = false;

  void onRiveInit(Artboard artboard) {
    setState(() {
      ctrl = notifierControllerFromArtboard(artboard, 'controller')!;
      ctrl!.isActive = false;
      artboard.addController(ctrl!);
    });
  }

  @override
  Widget build(BuildContext context) {
    final rive = RiveAnimation.asset(
      'assets/animated-emojis.riv',
      fit: BoxFit.contain,
      onInit: onRiveInit,
    );

    return AppIcon(
      animation: ctrl,
      icon: Transform.scale(
        scale: 1.5,
        child: Transform.translate(
          offset: const Offset(0, -50),
          child: Opacity(
            opacity: revealed ? 1 : 0,
            child: rive,
          ),
        ),
      ),
      child: Scaffold(
        body: Center(
          child: revealed
              ? const Text("You've been prank'd")
              : ElevatedButton(
                  onPressed: () {
                    setState(() {
                      revealed = true;
                      ctrl!.isActive = true;
                    });
                  },
                  child: const Text(
                    'Where is my app icon?',
                  ),
                ),
        ),
      ),
    );
  }
}
