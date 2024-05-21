import 'package:flutter/material.dart';
import 'package:insta_clone/core/widgets/custom_elevated_button.dart';
import 'package:insta_clone/core/widgets/custom_text_form_field.dart';
import 'package:insta_clone/views/responsive/mobile/screens/widgets/register_header.dart';

class RegisterBodyView extends StatefulWidget {
  const RegisterBodyView({super.key});

  @override
  State<RegisterBodyView> createState() => _RegisterBodyViewState();
}

bool isVisible = true;

class _RegisterBodyViewState extends State<RegisterBodyView> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(33.0),
        child: SingleChildScrollView(
          child: Form(
            //key: _formKey,
            child: Column(
              children: [
                const RegisterHeader(),
                const SizedBox(
                  height: 33,
                ),
                const CustomTextFormField(
                  text: 'Enter Your Name : ',
                  suffixIcon: Icon(
                    Icons.person,
                  ),
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(
                  height: 22,
                ),
                const CustomTextFormField(
                  text: 'Enter Your title : ',
                  suffixIcon: Icon(
                    Icons.person,
                  ),
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(
                  height: 22,
                ),
                const CustomTextFormField(
                  text: 'Enter Your Email : ',
                  keyboardType: TextInputType.emailAddress,
                  suffixIcon: Icon(
                    Icons.email,
                  ),
                ),
                const SizedBox(
                  height: 22,
                ),
                CustomTextFormField(
                  text: 'Enter Your Password : ',
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        isVisible = !isVisible;
                      });
                    },
                    icon: isVisible
                        ? const Icon(Icons.visibility)
                        : const Icon(Icons.visibility_off),
                  ),
                  keyboardType: TextInputType.text,
                  isObsecure: isVisible,
                ),
                const SizedBox(
                  height: 33,
                ),
                const CustomElevatedButton(
                  title: 'Register',
                ),
                const SizedBox(
                  height: 33,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Do not have an account?",
                        style: TextStyle(fontSize: 18)),
                    TextButton(
                        onPressed: () {
                          /*  Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => Login()),
                            );*/
                        },
                        child: const Text('sign in',
                            style: TextStyle(
                                fontSize: 18,
                                decoration: TextDecoration.underline))),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
