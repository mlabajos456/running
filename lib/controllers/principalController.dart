import 'dart:math';

import 'package:get/get.dart';
import 'package:pedometer/pedometer.dart';

class PrincipalController extends GetxController {
  String muestrePasos = "";
  String _km = "Unknow";
  String _calories = "Unknow";
  String _stepCountValue = "Unknow";

  double _numerox; //numero pasos
  double get numero => _numerox;
  double _convert;
  double get convert => _convert;
  double _kmx;

  double get kmx => _kmx;
  double burnedx;
  double _porciento;
  double get porciento => _porciento;

  Stream<StepCount> _stepCountStream;
  Stream<PedestrianStatus>
      _pedestrianStatusStream; //String StreamSubscription<int> _subscription ;

  void onInit() {
    super.onInit();
    initPlatformState();
    update();
  }

  @override
  void onReady() {
    super.onReady();
    update();
  }

  Future<void> initPlatformState() async {
    /// Init streams
    _pedestrianStatusStream = await Pedometer.pedestrianStatusStream;
    _stepCountStream = await Pedometer.stepCountStream;

    /// Listen to streams and handle errors
    _stepCountStream.listen(onStepCount).onError(onStepCountError);
    _pedestrianStatusStream
        .listen(onPedestrianStatusChanged)
        .onError(onPedestrianStatusError);
  }

  void onStepCount(StepCount event) {
    /// Handle step count changed
    int steps = event.steps;
    DateTime timeStamp = event.timeStamp;
    this._stepCountValue = "$event.steps";

    var dist = event.steps; //pasamos el entero a una variable llamada dist
    double y = (dist + .0); //lo convertimos a double una forma de varias

    _numerox =
        y; //lo pasamos a un estado para ser capturado ya convertido a double

    var long3 = (_numerox);
    long3 = num.parse(y.toStringAsFixed(2));
    var long4 = (long3 / 10000);

    int decimals = 1;
    int fac = pow(10, decimals);
    double d = long4;
    d = (d * fac).round() / fac;
    print("d: $d");
    getDistanceRun(_numerox);
    _convert = d;
    print(_convert);

    update();
  }

  void onPedestrianStatusChanged(PedestrianStatus event) {
    /// Handle status changed
    String status = event.status;
    DateTime timeStamp = event.timeStamp;
  }

  void onPedestrianStatusError(error) {
    /// Handle the error
  }

  void onStepCountError(error) {
    /// Handle the error
  }
  void getDistanceRun(double _numerox) {
    var distance = ((_numerox * 78) / 100000);
    distance = num.parse(distance.toStringAsFixed(2)); //dos decimales
    var distancekmx = distance * 34;
    distancekmx = num.parse(distancekmx.toStringAsFixed(2));
    //print(distance.runtimeType);
    _km = "$distance";
    _kmx = num.parse(distancekmx.toStringAsFixed(2));
    update();
  }
}
