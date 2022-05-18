import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tune_hop_app/services/auth.dart';

import 'loading.dart';

class UserOnboardingPage extends StatefulWidget {
  const UserOnboardingPage({Key? key}) : super(key: key);

  @override
  State<UserOnboardingPage> createState() => _UserOnboardingPageState();
}

class _UserOnboardingPageState extends State<UserOnboardingPage> {
  final AuthService _authService = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;

  String displayName = '';

  @override
  Widget build(BuildContext context) {
    return isLoading ? const Loading() : Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.symmetric(horizontal: 50.0),
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/background.jpg"),
                fit: BoxFit.cover),
          ),
          child: Center(
            child: Container(
              width: double.infinity,
              height: 500,
              child: Column(
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.0)),
                      padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 20.0),
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: Image.asset(
                                'assets/images/logo.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                const SizedBox(height: 20.0),
                                TextFormField(
                                  validator: (val) => val != null && val.isEmpty ? 'Upiši svoje ime ili nadimak.': null,
                                  onChanged: (val) {
                                    setState(() => displayName = val);
                                  },
                                  decoration: InputDecoration(
                                      hintText: "Ime ili nadimak"
                                  ),
                                ),
                                const SizedBox(height: 20.0),
                                TextButton(
                                    onPressed: () async {
                                      if (_formKey.currentState!.validate()) {
                                        setState(() => isLoading = true);
                                        dynamic result = _authService.signInAnon(displayName);
                                        if (result == null) {
                                          setState(() { isLoading = false; });
                                        }
                                      }
                                    },
                                    child: const Text('Dalje',
                                    style: TextStyle(
                                      fontSize: 18.0
                                    )),
                                    style: TextButton.styleFrom(
                                      primary: Colors.white,
                                      backgroundColor: const Color(0xFF8ab23b),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20.0),
                                      ),
                                      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0)
                                    ))
                              ],
                            ),
                          ),
                        ],
                      )),
                ],
              ),
            ),
          ),
        ));
  }
}
