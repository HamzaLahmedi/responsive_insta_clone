import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:insta_clone/core/widgets/custom_elevated_button.dart';
import 'package:insta_clone/core/widgets/custom_text_form_field.dart';
import 'package:insta_clone/views/responsive/mobile/screens/register_view.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  bool isVisible = true;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Center(
      child: Padding(
        padding: screenWidth > 600
            ? EdgeInsets.symmetric(horizontal: screenWidth * .3)
            : const EdgeInsets.all(33.0),
        child: SingleChildScrollView(
          child: Form(
            //key: _formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 33,
                ),
                CustomTextFormField(
                  text: 'Enter Your Email : ',
                  keyboardType: TextInputType.emailAddress,
                  suffixIcon: const Icon(
                    Icons.email,
                  ),
                  validator: (value) {
                    return value != null && !EmailValidator.validate(value)
                        ? "Enter a valid email"
                        : null;
                  },
                  controller: emailController,
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
                  validator: (value) {
                    return value!.length < 6
                        ? "Enter at least 6 characters"
                        : null;
                  },
                  controller: passwordController,
                ),
                const SizedBox(
                  height: 33,
                ),
                const CustomElevatedButton(
                  title: 'Login',
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
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const RegisterView()),
                          );
                        },
                        child: const Text('Sign Up',
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
