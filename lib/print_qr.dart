import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class PrintQR extends StatefulWidget {
  const PrintQR({Key? key}) : super(key: key);

  @override
  State<PrintQR> createState() => _PrintQRState();
}

class _PrintQRState extends State<PrintQR> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Print QR Code "),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              QrImage(
                data: controller.text,
                size: 200,
                backgroundColor: Colors.white,
              ),
              const SizedBox(
                height: 40,
              ),
              buildTextField(context),
              const SizedBox(
                height: 40,
              ),
              ElevatedButton(
                  onPressed: () {
                    //Print function (print qr according to the text field data)
                    printQR(controller.text);
                  },
                  child: const Text("Print QR"))
            ],
          ),
        ),
      ),
    );
  }

//Function to perform QR code Printing
  void printQR(String qrCode) {
    //actions to print Qr
  }
  Widget buildTextField(BuildContext context) => TextField(
      controller: controller,
      style: const TextStyle(
        color: Colors.green,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
      decoration: InputDecoration(
        hintText: 'Enter the data',
        hintStyle: const TextStyle(color: Colors.grey),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.black87),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.lightGreen),
        ),
        suffixIcon: IconButton(
          icon: const Icon(
            Icons.done,
            size: 30,
          ),
          color: Colors.green,
          onPressed: () {
            setState(() {});
          },
        ),
      ));
}
