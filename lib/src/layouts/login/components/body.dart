import 'package:flutter/material.dart';
import 'package:newsportal/constants.dart';
import 'package:newsportal/src/layouts/otp/otp.dart';

class Body extends StatefulWidget {
  final VoidCallback onSignedIn;
  const Body({Key key, this.onSignedIn}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _formKey = GlobalKey<FormState>();
  final _telController = new TextEditingController(text: "+880");

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(KdefaultPaddin),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _telController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.phone),
                  border: OutlineInputBorder(),
                  hintText: 'Enter Phone Number',
                ),
                validator: (value) {
                  if (value.isEmpty || !value.contains("+880")) {
                    return 'Please enter valid phone number';
                  }
                  return null;
                },
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      // Process data.
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => OTPscreen(
                              onSignedIn: widget.onSignedIn,
                              phone: _telController.text),
                        ),
                      );
                    }
                  },
                  icon: Icon(
                    Icons.forward,
                  ),
                  label: Text(
                    "Next",
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
