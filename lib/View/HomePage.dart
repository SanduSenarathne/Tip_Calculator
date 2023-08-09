import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
                  double billAmount = double.parse(billAmountController.text);
                  int tipPresentage = int.parse(tipPrecentageController.text);
                  int noPeople = int.parse(noPeopleController.text);
                  print(billAmount);
                  print(tipPresentage);
                  print(noPeople);
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
                    Text(
                      'Tip Amount:',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      'Total Amount:',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      'Total Per Person:',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
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
