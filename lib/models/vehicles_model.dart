class VehiclesModel {
  int? _iD;
  String? _make;
  String? _model;
  String? _version;
  String? _image;
  int? _kM;
  String? _price;
  int? _yearModel;
  int? _yearFab;
  String? _color;

  VehiclesModel(
      {int? iD,
      String? make,
      String? model,
      String? version,
      String? image,
      int? kM,
      String? price,
      int? yearModel,
      int? yearFab,
      String? color}) {
    if (iD != null) {
      this._iD = iD;
    }
    if (make != null) {
      this._make = make;
    }
    if (model != null) {
      this._model = model;
    }
    if (version != null) {
      this._version = version;
    }
    if (image != null) {
      this._image = image;
    }
    if (kM != null) {
      this._kM = kM;
    }
    if (price != null) {
      this._price = price;
    }
    if (yearModel != null) {
      this._yearModel = yearModel;
    }
    if (yearFab != null) {
      this._yearFab = yearFab;
    }
    if (color != null) {
      this._color = color;
    }
  }

  int? get iD => _iD;
  set iD(int? iD) => _iD = iD;
  String? get make => _make;
  set make(String? make) => _make = make;
  String? get model => _model;
  set model(String? model) => _model = model;
  String? get version => _version;
  set version(String? version) => _version = version;
  String? get image => _image;
  set image(String? image) => _image = image;
  int? get kM => _kM;
  set kM(int? kM) => _kM = kM;
  String? get price => _price;
  set price(String? price) => _price = price;
  int? get yearModel => _yearModel;
  set yearModel(int? yearModel) => _yearModel = yearModel;
  int? get yearFab => _yearFab;
  set yearFab(int? yearFab) => _yearFab = yearFab;
  String? get color => _color;
  set color(String? color) => _color = color;

  VehiclesModel.fromJson(Map<String, dynamic> json) {
    _iD = json['ID'];
    _make = json['Make'];
    _model = json['Model'];
    _version = json['Version'];
    _image = json['Image'];
    _kM = json['KM'];
    _price = json['Price'];
    _yearModel = json['YearModel'];
    _yearFab = json['YearFab'];
    _color = json['Color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this._iD;
    data['Make'] = this._make;
    data['Model'] = this._model;
    data['Version'] = this._version;
    data['Image'] = this._image;
    data['KM'] = this._kM;
    data['Price'] = this._price;
    data['YearModel'] = this._yearModel;
    data['YearFab'] = this._yearFab;
    data['Color'] = this._color;
    return data;
  }
}
