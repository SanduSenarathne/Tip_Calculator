import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tip_calculator/Controllers/tipCalculate_controller.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final TextEditingController billAmountController = TextEditingController();
  final TextEditingController tipPrecentageController = TextEditingController();
  final TextEditingController noPeopleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green[400],
        title: const Text(
          'Tip Calculator',
          style: TextStyle(
            color: Colors.black,
            fontStyle: FontStyle.italic,
            fontSize: 30,
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: billAmountController,
              decoration: InputDecoration(labelText: 'Bill Amount (\$)'),
              inputFormatters: [
                FilteringTextInputFormatter.allow(
                  RegExp(r'^\d+\.?\d{0,2}?$'),
                ),
              ],
              keyboardType: TextInputType.numberWithOptions(decimal: true),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: tipPrecentageController,
              decoration: InputDecoration(labelText: 'Tip Percentage (%)'),
              keyboardType: TextInputType.number,
              /*inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly,
              ],*/
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: noPeopleController,
              decoration: InputDecoration(labelText: 'Number of People'),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly,
              ],
            ),
            SizedBox(height: 16.0),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  TipCalculateControlller.tipProcess(
                    billAmountController.text,
                    tipPrecentageController.text,
                    noPeopleController.text,
                  );
                },
                child: Text(
                  'Calculate Tip',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            SizedBox(height: 32.0),
            Center(
              child: Container(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Obx(() => Text(
                          'Tip Amount:\$${TipCalculateControlller.tipAmount.value}',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        )),
                    Obx(() => Text(
                          'Total Amount:\$${TipCalculateControlller.totleAmount.value}',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        )),
                    Obx(() => Text(
                          'Total Per Person:\$${TipCalculateControlller.totlePerPerson.value}',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
