import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'scan_state.dart';

class ScanCubit extends Cubit<ScanState> {
  ScanCubit() : super(ScanInitialState());

  String? _barcodeScanRes;
  void _clearBarcodeScanRes() {
    _barcodeScanRes = null;
  }

  Future<void> qr(BuildContext context) async {
    try {
      emit(ScanLoadedState(isLoad: true));
      _barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666',
        'الغاء',
        true,
        ScanMode.QR,
      );
      if (_barcodeScanRes != "-1") {
        emit(ScanLoadedState(isLoad: false));
        emit(ScanSuccessfulState(barcodeScanRes: _barcodeScanRes!));
        _clearBarcodeScanRes();
      } else {
        emit(ScanLoadedState(isLoad: false));
        emit(ScanFailureState(error: "Failed to get platform version"));
        _clearBarcodeScanRes();
      }
    } catch (e) {
      emit(ScanLoadedState(isLoad: false));
      emit(ScanFailureState(error: e.toString()));
      _clearBarcodeScanRes();
    }
  }
}
