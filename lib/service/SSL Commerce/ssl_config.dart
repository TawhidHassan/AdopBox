import 'package:flutter/material.dart';
import 'package:flutter_sslcommerz/model/SSLCSdkType.dart';
import 'package:flutter_sslcommerz/model/SSLCTransactionInfoModel.dart';
import 'package:flutter_sslcommerz/model/SSLCommerzInitialization.dart';
import 'package:flutter_sslcommerz/model/SSLCurrencyType.dart';
import 'package:flutter_sslcommerz/sslcommerz.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:logger/logger.dart';



class SslConfig{
  Future<void> sslCommerzGeneralCall({double? ammount, String? tranId,int? invoiceId,BuildContext? context}) async {
    Sslcommerz sslcommerz = Sslcommerz(
      initializer: SSLCommerzInitialization(
        //Use the ipn if you have valid one, or it will fail the transaction.
        ipn_url: "www.ipnurl.com",
        multi_card_name: "",
        currency: SSLCurrencyType.BDT,
        product_category: "Food",
        sdkType:  SSLCSdkType.TESTBOX,
        // sdkType:   SSLCSdkType.LIVE,
        store_id: "aslkj6200e40d4696d",
        store_passwd: "aslkj6200e40d4696d@ssl",
        total_amount: ammount!,
        tran_id: tranId!,
      ),
    );
    try {
      SSLCTransactionInfoModel result = await sslcommerz.payNow();

      if (result.status!.toLowerCase() == "failed") {
        Fluttertoast.showToast(
          msg: "Transaction is Failed....",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      }
      else if (result.status!.toLowerCase() == "closed") {
        Fluttertoast.showToast(
          msg: "SDK Closed by User",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      } else {
        Fluttertoast.showToast(
            msg:
            "Transaction is ${result.status} and Amount is ${result.amount}",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0);
        Logger().w(result.bankTranId);
        Logger().w(result.status);
        Logger().w(result.cardType);
        Logger().w(result.amount);
        Logger().w(result.tranDate);
        // Logger().w(result.tranId);
        Logger().w(result.currencyType);
        Logger().w(result.currencyAmount);

        var data = {
          "id":invoiceId,
          "bank_tran_id":result.bankTranId!,
          "card_type":result.cardType,
          "store_amount":result.amount,
          "tran_date":result.tranDate,
          "currency":result.currencyType,
          "status":"Complete"
        };
        // Get.find<CartController>().updateInvoice(data,context);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}