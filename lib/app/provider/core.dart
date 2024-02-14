import 'package:flutter/material.dart';
import 'package:sphia/app/tray.dart';
import 'package:sphia/core/core.dart';

class CoreProvider extends ChangeNotifier {
  List<Core> cores = [];
  bool coreRunning = false;

  Core get proxy => cores.firstWhere((core) => !core.isRouting);
  Core get routing => cores.firstWhere((core) => core.isRouting);

  void updateCoreRunning(bool newCoreRunning) {
    coreRunning = newCoreRunning;
    notifyListeners();
    SphiaTray.setIcon(coreRunning);
    if (coreRunning) {
      SphiaTray.setMenuItem('coreStart', true);
      SphiaTray.setMenuItem('coreStop', false);
    } else {
      SphiaTray.setMenuItem('coreStart', false);
      SphiaTray.setMenuItem('coreStop', true);
    }
  }
}
