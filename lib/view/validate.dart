import 'package:flutter/material.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:passwordvalidate/controller/success_provider.dart';
import 'package:provider/provider.dart';

class Validate extends StatefulWidget {
  const Validate({super.key});

  @override
  State<Validate> createState() => _ValidateState();
}

class _ValidateState extends State<Validate> {
  @override
  Widget build(BuildContext context) {
    final successProvider = Provider.of<SuccessProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            successProvider.success ? Colors.green : Colors.redAccent,
        title: Column(
          children: [
            Text(
              "Password Validation",
              style: GoogleFonts.mPlus1(fontWeight: FontWeight.w500),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 12),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 100),
                child: SizedBox(
                  width: double.infinity,
                  height: 200,
                  child: successProvider.success
                      ? Lottie.network(
                          "https://lottie.host/b72d482a-8285-41a6-aed9-19ff59a21d4f/2un8X2czPh.json")
                      : Lottie.network(
                          "https://lottie.host/d72b2890-7775-4eb3-865e-cc57d9d7cc8e/6DVlsAUQnJ.json"),
                ),
              ),
              SizedBox(
                height: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2.0),
                      child: Consumer<SuccessProvider>(
                        builder: (context, value, child) {
                          return TextField(
                              controller: successProvider.controller,
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Color.fromARGB(
                                              255, 207, 207, 207),
                                          width: 2),
                                      borderRadius: BorderRadius.circular(5)),
                                  floatingLabelStyle: GoogleFonts.mPlus1(
                                    color: Colors.black,
                                    fontSize: 18,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: successProvider.success
                                            ? Colors.green
                                            : Colors.red,
                                        width: 2),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  hintText: "Password",
                                  hintStyle:
                                      GoogleFonts.mPlus1(color: Colors.black),
                                  border: const OutlineInputBorder(
                                      borderSide: BorderSide())));
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Expanded(
                      child: FlutterPwValidator(
                        defaultColor: Colors.grey.shade300,
                        controller: successProvider.controller,
                        successColor: Colors.green.shade700,
                        minLength: 8,
                        uppercaseCharCount: 2,
                        numericCharCount: 3,
                        specialCharCount: 1,
                        normalCharCount: 3,
                        width: 400,
                        height: 150,
                        onSuccess: () {
                          successProvider.setSuccess(true);
                        },
                        onFail: () {
                          successProvider.setSuccess(false);
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
