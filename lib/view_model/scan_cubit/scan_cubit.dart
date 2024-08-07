import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'scan_state.dart';

class ScanCubit extends Cubit<ScanState> {
  ScanCubit() : super(ScanInitialState());

  String? _barcodeScanRes;
  void _clearBarcodeScanRes() {
    _barcodeScanRes = null;
  }

  Future<void> scanQR(BuildContext context) async {
    try {
      _barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666',
        'الغاء',
        true,
        ScanMode.QR,
      );
      if (_barcodeScanRes != "-1") {
        emit(ScanSuccessfulState(barcodeScanRes: _barcodeScanRes!));
        _clearBarcodeScanRes();
      } else {
        emit(ScanFailureState(error: "Failed to get platform version"));
        _clearBarcodeScanRes();
      }
    } catch (e) {
      emit(ScanFailureState(error: e.toString()));
      _clearBarcodeScanRes();
    }
  }
}
