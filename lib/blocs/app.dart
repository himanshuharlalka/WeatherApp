import 'package:weather_app/repository/storage_manager.dart';

import 'base.dart';

class ApplicationBloc extends BaseBloc {
  bool currentWeatherWidgetAnimationState = true;
  final _applicationLocalRepository = ApplicationLocalRepository();
  int unit = 0;


  @override
  void dispose() {}



  void loadSavedUnit() async {
    unit = await _applicationLocalRepository.getSavedUnit();
  }

  void saveUnit(int unit) async {
    _applicationLocalRepository.saveUnit(unit);
    this.unit = unit;
  }

  bool isCelsius() {
    return unit == 0;
  }


}

final applicationBloc = ApplicationBloc();