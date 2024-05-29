import 'dart:async';

import 'package:alt_sms_autofill/alt_sms_autofill.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class Otp extends StatefulWidget {
  final int currentTime;
  final bool resend;
  final VoidCallback? resendOTP;
  final Widget resendOTPWidget;
  final Function(String) handleOTP;
  final TextEditingController valueController1;
  final TextEditingController valueController2;
  final TextEditingController valueController3;
  final TextEditingController valueController4;
  final TextEditingController valueController5;
  final TextEditingController valueController6;

  const Otp({
    Key? key,
    required this.currentTime,
    this.resendOTP,
    this.resendOTPWidget = const SizedBox(),
    this.resend = true,
    required this.handleOTP,
    required this.valueController1,
    required this.valueController2,
    required this.valueController3,
    required this.valueController4, required this.valueController5, required this.valueController6,
  }) : super(key: key);

  @override
  _OtpState createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  StreamController<ErrorAnimationType> errorController = StreamController<ErrorAnimationType>();

  TextEditingController textEditingController1 = TextEditingController();

  String _comingSms = 'Unknown';

  Future<void> initSmsListener() async {
    Map<Permission, PermissionStatus> permission = await [ Permission.sms ].request();
    print(permission);
    String? comingSms;
    try {
      comingSms = await AltSmsAutofill().listenForSms;
    } on PlatformException {
      comingSms = 'Failed to get Sms.';
    }
    if (!mounted) return;

    print("====>Message: ${comingSms}");
    print(comingSms);
    print("${_comingSms[32]}");
    // textEditingController1.text = _comingSms[32] + _comingSms[33] + _comingSms[34] + _comingSms[35]
    //     + _comingSms[36] + _comingSms[37]; //used to set the code in the message to a string and setting it to a textcontroller. message length is 38. so my code is in string index 32-37.
  }

  @override
  void initState() {
    super.initState();
    textEditingController1 = TextEditingController();
    // initSmsListener();
  }

  @override
  void dispose() {
    textEditingController1.dispose();
    AltSmsAutofill().unregisterListener();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(28),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                PinCodeTextField(
                  appContext: context,
                  length: 6,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  autoDismissKeyboard: true,
                  keyboardType: TextInputType.number,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderWidth: 1,
                    borderRadius: BorderRadius.circular(8),
                    fieldHeight: 50,
                    fieldWidth: 50,
                    activeFillColor: Colors.transparent,
                    activeColor: const Color.fromRGBO(61, 61, 61, 1),
                    disabledColor: Colors.transparent,
                    selectedColor: Theme.of(context).colorScheme.onPrimary,
                    inactiveColor: const Color.fromRGBO(61, 61, 61, 1),
                    inactiveFillColor: Colors.transparent,
                    selectedFillColor: Colors.transparent,
                    errorBorderColor: Colors.red,
                  ),
                  enableActiveFill: true,
                  enablePinAutofill: true,

                  errorAnimationController: errorController,
                  controller: widget.valueController1,
                  onCompleted: widget.handleOTP,
                  onChanged: (value) {
                    print(value);
                  },
                  beforeTextPaste: (text) {
                    print("Allowing to paste $text");
                    //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                    //but you can show anything you want here, like your pop up saying wrong paste format or etc
                    return true;
                  },
                  validator: (v) {
                    if (v != null && v.length < 6) {
                      return "";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 8.0),
                widget.resend == true
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            widget.currentTime <= 0
                                ? 'Didn\'t received OTP.'
                                : 'Resending OTP in ${widget.currentTime} seconds.',
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                              fontSize: 14,
                                color: const Color(0xFFAAACAE)),
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              textStyle: TextStyle(
                                  fontSize: 14.0,
                                  color: widget.currentTime <= 0
                                      ? Theme.of(context).primaryColor
                                      : Colors.grey),
                              shape: const StadiumBorder(),
                            ),
                            onPressed: widget.currentTime <= 0
                                ? widget.resendOTP
                                : null,
                            child: Container(
                              padding: const EdgeInsets.only(bottom: 1.0),
                              decoration:   const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color:Color.fromRGBO(31, 42, 57, 1)  ,
                                    width: 1,

                                  )
                                )
                              ),
                              child: Text(
                                'Resend',
                                style: Theme.of(context).textTheme.caption?.copyWith(
                                  color: widget.currentTime <= 0
                                      ? Theme.of(context).colorScheme.secondaryContainer
                                      : const Color.fromRGBO(31, 42, 57, 1),

                                ),

                              ),
                            )
                            ,
                          ),
                        ],
                      )
                    : widget.resendOTPWidget,
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _textFieldOTP(
      {required bool first,
      last,
      required TextEditingController textEditingController}) {
    return Container(
      height: 60,
      child: AspectRatio(
        aspectRatio: 1.0,
        child: TextFormField(
          inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[0-9/]")),],
          autofocus: true,
          controller: textEditingController,
          onChanged: (value) {
            if (value.length == 1 && last == false) {
              FocusScope.of(context).nextFocus();
            }
            if (value.length == 0 && first == false) {
              FocusScope.of(context).previousFocus();
            }
            widget.handleOTP(
                '${widget.valueController1.text}${widget.valueController2.text}${widget.valueController3.text}${widget.valueController4.text}${widget.valueController5.text}${widget.valueController6.text}');
          },
          showCursor: true,
          readOnly: false,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          keyboardType: TextInputType.numberWithOptions(decimal: false),
          maxLength: 1,
          decoration: InputDecoration(
            counter: Offstage(),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(width: 2, color: Colors.black12),
                borderRadius: BorderRadius.circular(0)),
            focusedBorder: UnderlineInputBorder(
                borderSide:
                    BorderSide(width: 2, color: Theme.of(context).primaryColor),
                borderRadius: BorderRadius.circular(0)),
          ),
        ),
      ),
    );
  }
}
