class LoginModel {
  String? id;
  String? username;
  Menu? menu;
  List<Vehicles>? vehicles;
  int? code;
  String? message;

  LoginModel(
      {this.id,
        this.username,
        this.menu,
        this.vehicles,
        this.code,
        this.message});

  LoginModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    menu = json['menu'] != null ?  Menu.fromJson(json['menu']) : null;
    if (json['vehicles'] != null) {
      vehicles = <Vehicles>[];
      json['vehicles'].forEach((v) {
        vehicles!.add(Vehicles.fromJson(v));
      });
    }
    code = json['code'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['username'] = username;
    if (menu != null) {
      data['menu'] = menu!.toJson();
    }
    if (vehicles != null) {
      data['vehicles'] = vehicles!.map((v) => v.toJson()).toList();
    }
    data['code'] = code;
    data['message'] = message;
    return data;
  }
}

class Menu {
  bool? currentPosition;
  bool? todaysTrack;
  bool? secureParking;
  bool? trackHistory;
  bool? fuelFilling;
  bool? feedback;
  bool? adminTrip;
  bool? report;
  bool? preInfo;
  bool? vehicleObservation;
  bool? drivingObservation;
  bool? marketObservation;
  bool? leaveApplication;
  bool? appliedLeaves;
  bool? temperature;
  bool? maintenance;
  bool? driverProfile;
  bool? satellite;
  bool? violation;
  bool? lease;
  bool? load;
  bool? fuel;
  bool? supplyChain;
  bool? video;
  bool? asset;
  bool? fleetView;

  Menu(
      {this.currentPosition,
        this.todaysTrack,
        this.secureParking,
        this.trackHistory,
        this.fuelFilling,
        this.feedback,
        this.adminTrip,
        this.report,
        this.preInfo,
        this.vehicleObservation,
        this.drivingObservation,
        this.marketObservation,
        this.leaveApplication,
        this.appliedLeaves,
        this.temperature,
        this.maintenance,
        this.driverProfile,
        this.satellite,
        this.violation,
        this.lease,
        this.load,
        this.fuel,
        this.supplyChain,
        this.video,
        this.asset,
        this.fleetView});

  Menu.fromJson(Map<String, dynamic> json) {
    currentPosition = json['CurrentPosition'];
    todaysTrack = json['TodaysTrack'];
    secureParking = json['SecureParking'];
    trackHistory = json['TrackHistory'];
    fuelFilling = json['FuelFilling'];
    feedback = json['Feedback'];
    adminTrip = json['AdminTrip'];
    report = json['Report'];
    preInfo = json['PreInfo'];
    vehicleObservation = json['VehicleObservation'];
    drivingObservation = json['DrivingObservation'];
    marketObservation = json['MarketObservation'];
    leaveApplication = json['LeaveApplication'];
    appliedLeaves = json['AppliedLeaves'];
    temperature = json['Temperature'];
    maintenance = json['Maintenance'];
    driverProfile = json['DriverProfile'];
    satellite = json['Satellite'];
    violation = json['Violation'];
    lease = json['Lease'];
    load = json['Load'];
    fuel = json['Fuel'];
    supplyChain = json['SupplyChain'];
    video = json['Video'];
    asset = json['Asset'];
    fleetView = json['FleetView'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['CurrentPosition'] = currentPosition;
    data['TodaysTrack'] = todaysTrack;
    data['SecureParking'] = secureParking;
    data['TrackHistory'] = trackHistory;
    data['FuelFilling'] = fuelFilling;
    data['Feedback'] = feedback;
    data['AdminTrip'] = adminTrip;
    data['Report'] = report;
    data['PreInfo'] = preInfo;
    data['VehicleObservation'] = vehicleObservation;
    data['DrivingObservation'] = drivingObservation;
    data['MarketObservation'] = marketObservation;
    data['LeaveApplication'] = leaveApplication;
    data['AppliedLeaves'] = appliedLeaves;
    data['Temperature'] = temperature;
    data['Maintenance'] = maintenance;
    data['DriverProfile'] = driverProfile;
    data['Satellite'] = satellite;
    data['Violation'] = violation;
    data['Lease'] = lease;
    data['Load'] = load;
    data['Fuel'] = fuel;
    data['SupplyChain'] = supplyChain;
    data['Video'] = video;
    data['Asset'] = asset;
    data['FleetView'] = fleetView;
    return data;
  }
}

class Vehicles {
  String? fFID;
  String? regNo;
  String? driverName;
  String? vehicleMade;
  String? vehicleModel;
  String? color;
  String? corpname;

  Vehicles(
      {this.fFID,
        this.regNo,
        this.driverName,
        this.vehicleMade,
        this.vehicleModel,
        this.color,
        this.corpname});

  Vehicles.fromJson(Map<String, dynamic> json) {
    fFID = json['FFID'];
    regNo = json['RegNo'];
    driverName = json['DriverName'];
    vehicleMade = json['VehicleMade'];
    vehicleModel = json['VehicleModel'];
    color = json['Color'];
    corpname = json['Corpname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['FFID'] = fFID;
    data['RegNo'] = regNo;
    data['DriverName'] = driverName;
    data['VehicleMade'] = vehicleMade;
    data['VehicleModel'] = vehicleModel;
    data['Color'] = color;
    data['Corpname'] = corpname;
    return data;
  }
}
