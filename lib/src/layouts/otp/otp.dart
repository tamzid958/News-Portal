import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newsportal/constants.dart';
import 'package:newsportal/src/layouts/home/home.dart';
import 'package:pinput/pin_put/pin_put.dart';

class OTPscreen extends StatefulWidget {
  final String phone;
  final VoidCallback onSignedIn;
  const OTPscreen({Key key, @required this.phone, this.onSignedIn})
      : super(key: key);

  @override
  _OTPscreenState createState() => _OTPscreenState(phone: phone);
}

class _OTPscreenState extends State<OTPscreen> {
  _OTPscreenState({this.phone});
  String _verificationCode;
  String phone;
  final _formKey = GlobalKey<FormState>();
  final _pinPutController = TextEditingController();
  final _pinPutFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _verifyPhone();
  }

  _verifyPhone() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '${widget.phone}',
      verificationCompleted: (PhoneAuthCredential credential) async {
        await FirebaseAuth.instance.signInWithCredential(credential).then(
          (value) async {
            if (value.user != null) {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeScreen(),
                ),
                (route) => false,
              );
            }
          },
        );
      },
      verificationFailed: (FirebaseAuthException e) {
        print(e.message);
      },
      codeSent: (String verficationID, int resendToken) {
        setState(() {
          _verificationCode = verficationID;
        });
      },
      codeAutoRetrievalTimeout: (String verificationID) {
        setState(() {
          _verificationCode = verificationID;
        });
      },
      timeout: Duration(seconds: 120),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.all(KdefaultPaddin),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text(
                "Phone Number: $phone",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: kTitleSize,
                ),
              ),
            ),
            SizedBox(
              height: KdefaultPaddin,
            ),
            Center(
              child: Text("Verification Code:" +
                  (_verificationCode != null ? _verificationCode : "")),
            ),
            SizedBox(
              height: KdefaultPaddin,
            ),
            Form(
              key: _formKey,
              child: PinPut(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                withCursor: true,
                fieldsCount: 6,
                fieldsAlignment: MainAxisAlignment.spaceAround,
                textStyle: TextStyle(fontSize: 25.0, color: Colors.black),
                eachFieldMargin: EdgeInsets.all(0),
                eachFieldWidth: 45.0,
                eachFieldHeight: 55.0,
                onSubmit: (String pin) async {
                  try {
                    await FirebaseAuth.instance
                        .signInWithCredential(
                      PhoneAuthProvider.credential(
                        verificationId: _verificationCode,
                        smsCode: pin,
                      ),
                    )
                        .then((value) async {
                      if (value.user != null) {
                        FocusScope.of(context).unfocus();
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(),
                          ),
                          (route) => false,
                        );
                      }
                    });
                  } catch (e) {
                    FocusScope.of(context).unfocus();
                  }
                },
                focusNode: _pinPutFocusNode,
                controller: _pinPutController,
                submittedFieldDecoration: pinPutDecoration,
                selectedFieldDecoration: pinPutDecoration.copyWith(
                  color: Colors.white,
                  border: Border.all(
                    width: 2,
                    color: Color.fromRGBO(160, 215, 220, 1),
                  ),
                ),
                followingFieldDecoration: pinPutDecoration,
                pinAnimationType: PinAnimationType.scale,
              ),
            ),
          ],
        ),
      ),
    );
  }

  BoxDecoration pinPutDecoration = BoxDecoration(
    color: const Color.fromRGBO(235, 236, 237, 1),
    borderRadius: BorderRadius.circular(5.0),
  );
}
