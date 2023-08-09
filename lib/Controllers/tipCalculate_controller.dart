import 'package:get/get.dart';

class TipCalculateControlller {
  static RxString tipAmount = ''.obs;
  static RxString totleAmount = ''.obs;
  static RxString totlePerPerson = ''.obs;

  static void tipProcess(
      String billAmount, String tipPrecentage, String noPeople) {
    double Tipresult =
        double.parse(billAmount) * (double.parse(tipPrecentage) / 100);
    double totalBill = double.parse(billAmount) + Tipresult;
    double perPerson = totalBill / int.parse(noPeople);

    tipAmount.value = Tipresult.toStringAsFixed(2);
    totleAmount.value = totalBill.toStringAsFixed(2);
    totlePerPerson.value = perPerson.toStringAsFixed(2);
  }
}
