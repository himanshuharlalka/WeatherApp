class Weather {
  Location _location;
  Current _current;
  Forecast _forecast;

  Weather({Location location, Current current, Forecast forecast}) {
    this._location = location;
    this._current = current;
    this._forecast = forecast;
  }

  Location get location => _location;
  set location(Location location) => _location = location;
  Current get current => _current;
  set current(Current current) => _current = current;
  Forecast get forecast => _forecast;
  set forecast(Forecast forecast) => _forecast = forecast;

  Weather.fromJson(Map<String, dynamic> json) {
    _location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    _current =
    json['current'] != null ? new Current.fromJson(json['current']) : null;
    _forecast = json['forecast'] != null
        ? new Forecast.fromJson(json['forecast'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._location != null) {
      data['location'] = this._location.toJson();
    }
    if (this._current != null) {
      data['current'] = this._current.toJson();
    }
    if (this._forecast != null) {
      data['forecast'] = this._forecast.toJson();
    }
    return data;
  }
}

class Location {
  String _name;
  String _region;
  String _country;
  double _lat;
  double _lon;
  String _tzId;
  int _localtimeEpoch;
  String _localtime;

  Location(
      {String name,
        String region,
        String country,
        double lat,
        double lon,
        String tzId,
        int localtimeEpoch,
        String localtime}) {
    this._name = name;
    this._region = region;
    this._country = country;
    this._lat = lat;
    this._lon = lon;
    this._tzId = tzId;
    this._localtimeEpoch = localtimeEpoch;
    this._localtime = localtime;
  }

  String get name => _name;
  set name(String name) => _name = name;
  String get region => _region;
  set region(String region) => _region = region;
  String get country => _country;
  set country(String country) => _country = country;
  double get lat => _lat;
  set lat(double lat) => _lat = lat;
  double get lon => _lon;
  set lon(double lon) => _lon = lon;
  String get tzId => _tzId;
  set tzId(String tzId) => _tzId = tzId;
  int get localtimeEpoch => _localtimeEpoch;
  set localtimeEpoch(int localtimeEpoch) => _localtimeEpoch = localtimeEpoch;
  String get localtime => _localtime;
  set localtime(String localtime) => _localtime = localtime;

  Location.fromJson(Map<String, dynamic> json) {
    _name = json['name'];
    _region = json['region'];
    _country = json['country'];
    _lat = json['lat'];
    _lon = json['lon'];
    _tzId = json['tz_id'];
    _localtimeEpoch = json['localtime_epoch'];
    _localtime = json['localtime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this._name;
    data['region'] = this._region;
    data['country'] = this._country;
    data['lat'] = this._lat;
    data['lon'] = this._lon;
    data['tz_id'] = this._tzId;
    data['localtime_epoch'] = this._localtimeEpoch;
    data['localtime'] = this._localtime;
    return data;
  }
}

class Current {
  double _tempC;
  double _tempF;
  Condition _condition;
  double _windKph;
  String _windDir;
  double _pressureMb;
  int _humidity;
  int _cloud;
  double _feelslikeC;
  double _feelslikeF;
  double _visKm;
  double _uv;

  Current(
      {double tempC,
        double tempF,
        Condition condition,
        double windKph,
        String windDir,
        double pressureMb,
        int humidity,
        int cloud,
        double feelslikeC,
        double feelslikeF,
        double visKm,
        double uv}) {
    this._tempC = tempC;
    this._tempF = tempF;
    this._condition = condition;
    this._windKph = windKph;
    this._windDir = windDir;
    this._pressureMb = pressureMb;
    this._humidity = humidity;
    this._cloud = cloud;
    this._feelslikeC = feelslikeC;
    this._feelslikeF = feelslikeF;
    this._visKm = visKm;
    this._uv = uv;
  }

  double get tempC => _tempC;
  set tempC(double tempC) => _tempC = tempC;
  double get tempF => _tempF;
  set tempF(double tempF) => _tempF = tempF;
  Condition get condition => _condition;
  set condition(Condition condition) => _condition = condition;
  double get windKph => _windKph;
  set windKph(double windKph) => _windKph = windKph;
  String get windDir => _windDir;
  set windDir(String windDir) => _windDir = windDir;
  double get pressureMb => _pressureMb;
  set pressureMb(double pressureMb) => _pressureMb = pressureMb;
  int get humidity => _humidity;
  set humidity(int humidity) => _humidity = humidity;
  int get cloud => _cloud;
  set cloud(int cloud) => _cloud = cloud;
  double get feelslikeC => _feelslikeC;
  set feelslikeC(double feelslikeC) => _feelslikeC = feelslikeC;
  double get feelslikeF => _feelslikeF;
  set feelslikeF(double feelslikeF) => _feelslikeF = feelslikeF;
  double get visKm => _visKm;
  set visKm(double visKm) => _visKm = visKm;
  double get uv => _uv;
  set uv(double uv) => _uv = uv;

  Current.fromJson(Map<String, dynamic> json) {
    _tempC = json['temp_c'];
    _tempF = json['temp_f'];
    _condition = json['condition'] != null
        ? new Condition.fromJson(json['condition'])
        : null;
    _windKph = json['wind_kph'];
    _windDir = json['wind_dir'];
    _pressureMb = json['pressure_mb'];
    _humidity = json['humidity'];
    _cloud = json['cloud'];
    _feelslikeC = json['feelslike_c'];
    _feelslikeF = json['feelslike_f'];
    _visKm = json['vis_km'];
    _uv = json['uv'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['temp_c'] = this._tempC;
    data['temp_f'] = this._tempF;
    if (this._condition != null) {
      data['condition'] = this._condition.toJson();
    }
    data['wind_kph'] = this._windKph;
    data['wind_dir'] = this._windDir;
    data['pressure_mb'] = this._pressureMb;
    data['humidity'] = this._humidity;
    data['cloud'] = this._cloud;
    data['feelslike_c'] = this._feelslikeC;
    data['feelslike_f'] = this._feelslikeF;
    data['vis_km'] = this._visKm;
    data['uv'] = this._uv;
    return data;
  }
}

class Condition {
  String _text;
  String _icon;

  Condition({String text, String icon}) {
    this._text = text;
    this._icon = icon;
  }

  String get text => _text;
  set text(String text) => _text = text;
  String get icon => _icon;
  set icon(String icon) => _icon = icon;

  Condition.fromJson(Map<String, dynamic> json) {
    _text = json['text'];
    _icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this._text;
    data['icon'] = this._icon;
    return data;
  }
}

class Forecast {
  List<Forecastday> _forecastday;

  Forecast({List<Forecastday> forecastday}) {
    this._forecastday = forecastday;
  }

  List<Forecastday> get forecastday => _forecastday;
  set forecastday(List<Forecastday> forecastday) => _forecastday = forecastday;

  Forecast.fromJson(Map<String, dynamic> json) {
    if (json['forecastday'] != null) {
      _forecastday = new List<Forecastday>();
      json['forecastday'].forEach((v) {
        _forecastday.add(new Forecastday.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._forecastday != null) {
      data['forecastday'] = this._forecastday.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Forecastday {
  String _date;
  int _dateEpoch;
  Day _day;
  List<Hour> _hour;

  Forecastday({String date, int dateEpoch, Day day, List<Hour> hour}) {
    this._date = date;
    this._dateEpoch = dateEpoch;
    this._day = day;
    this._hour = hour;
  }

  String get date => _date;
  set date(String date) => _date = date;
  int get dateEpoch => _dateEpoch;
  set dateEpoch(int dateEpoch) => _dateEpoch = dateEpoch;
  Day get day => _day;
  set day(Day day) => _day = day;
  List<Hour> get hour => _hour;
  set hour(List<Hour> hour) => _hour = hour;

  Forecastday.fromJson(Map<String, dynamic> json) {
    _date = json['date'];
    _dateEpoch = json['date_epoch'];
    _day = json['day'] != null ? new Day.fromJson(json['day']) : null;
    if (json['hour'] != null) {
      _hour = new List<Hour>();
      json['hour'].forEach((v) {
        _hour.add(new Hour.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this._date;
    data['date_epoch'] = this._dateEpoch;
    if (this._day != null) {
      data['day'] = this._day.toJson();
    }
    if (this._hour != null) {
      data['hour'] = this._hour.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Day {
  double _avgtempC;
  double _avgtempF;
  double _maxwindKph;
  double _avghumidity;
  Condition _condition;

  Day(
      {double avgtempC,
        double avgtempF,
        double maxwindKph,
        double avghumidity,
        Condition condition}) {
    this._avgtempC = avgtempC;
    this._avgtempF = avgtempF;
    this._maxwindKph = maxwindKph;
    this._avghumidity = avghumidity;
    this._condition = condition;
  }

  double get avgtempC => _avgtempC;
  set avgtempC(double avgtempC) => _avgtempC = avgtempC;
  double get avgtempF => _avgtempF;
  set avgtempF(double avgtempF) => _avgtempF = avgtempF;
  double get maxwindKph => _maxwindKph;
  set maxwindKph(double maxwindKph) => _maxwindKph = maxwindKph;
  double get avghumidity => _avghumidity;
  set avghumidity(double avghumidity) => _avghumidity = avghumidity;
  Condition get condition => _condition;
  set condition(Condition condition) => _condition = condition;

  Day.fromJson(Map<String, dynamic> json) {
    _avgtempC = json['avgtemp_c'];
    _avgtempF = json['avgtemp_f'];
    _maxwindKph = json['maxwind_kph'];
    _avghumidity = json['avghumidity'];
    _condition = json['condition'] != null
        ? new Condition.fromJson(json['condition'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['avgtemp_c'] = this._avgtempC;
    data['avgtemp_f'] = this._avgtempF;
    data['maxwind_kph'] = this._maxwindKph;
    data['avghumidity'] = this._avghumidity;
    if (this._condition != null) {
      data['condition'] = this._condition.toJson();
    }
    return data;
  }
}

class Hour {
  int _timeEpoch;
  double _tempC;
  double _tempF;
  Condition _condition;

  Hour({int timeEpoch, double tempC, double tempF, Condition condition}) {
    this._timeEpoch = timeEpoch;
    this._tempC = tempC;
    this._tempF = tempF;
    this._condition = condition;
  }

  int get timeEpoch => _timeEpoch;
  set timeEpoch(int timeEpoch) => _timeEpoch = timeEpoch;
  double get tempC => _tempC;
  set tempC(double tempC) => _tempC = tempC;
  double get tempF => _tempF;
  set tempF(double tempF) => _tempF = tempF;
  Condition get condition => _condition;
  set condition(Condition condition) => _condition = condition;

  Hour.fromJson(Map<String, dynamic> json) {
    _timeEpoch = json['time_epoch'];
    _tempC = json['temp_c'];
    _tempF = json['temp_f'];
    _condition = json['condition'] != null
        ? new Condition.fromJson(json['condition'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['time_epoch'] = this._timeEpoch;
    data['temp_c'] = this._tempC;
    data['temp_f'] = this._tempF;
    if (this._condition != null) {
      data['condition'] = this._condition.toJson();
    }
    return data;
  }
}