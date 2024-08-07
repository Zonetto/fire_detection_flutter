abstract class ScanState {}

class ScanInitialState extends ScanState {}

class ScanLoadedState extends ScanState {
  final bool isLoad;
  ScanLoadedState({required this.isLoad});
}

class ScanFailureState extends ScanState {
  final String error;

  ScanFailureState({required this.error});
}

class ScanSuccessfulState extends ScanState {
  final String barcodeScanRes;

  ScanSuccessfulState({required this.barcodeScanRes});
}
