import 'package:flutter/material.dart';
import 'auth_controller.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isLoading = false;
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  Future<void> _submit() async {
    if (!formKey.currentState!.validate()) return;
    FocusScope.of(context).unfocus();
    
    setState(() => isLoading = true);
    await AuthController.signUp(
      emailController.text.trim(),
      passwordController.text.trim(),
      context,
    );
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          TextFormField(
            controller: emailController,
            decoration: InputDecoration(
              hintText: 'Email',
              prefixIcon: const Icon(Icons.person_outlined),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            ),
            validator: (value) => value!.isEmpty ? 'Enter your email' : null,
          ),
          const SizedBox(height: 15),
          TextFormField(
            controller: passwordController,
            obscureText: !_isPasswordVisible,
            decoration: InputDecoration(
              hintText: 'Password',
              prefixIcon: const Icon(Icons.lock_open),
              suffixIcon: IconButton(
                icon: Icon(_isPasswordVisible ? Icons.visibility : Icons.visibility_off),
                onPressed: () => setState(() => _isPasswordVisible = !_isPasswordVisible),
              ),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            ),
            validator: (value) => value!.length < 6 ? 'Password must be at least 6 characters' : null,
          ),
          const SizedBox(height: 15),
          TextFormField(
            controller: confirmPasswordController,
            obscureText: !_isConfirmPasswordVisible,
            decoration: InputDecoration(
              hintText: 'Confirm Password',
              prefixIcon: const Icon(Icons.lock),
              suffixIcon: IconButton(
                icon: Icon(_isConfirmPasswordVisible ? Icons.visibility : Icons.visibility_off),
                onPressed: () => setState(() => _isConfirmPasswordVisible = !_isConfirmPasswordVisible),
              ),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            ),
            validator: (value) => value != passwordController.text ? 'Passwords do not match' : null,
          ),
          const SizedBox(height: 20),
          isLoading
              ? const CircularProgressIndicator()
              : ElevatedButton(
                  onPressed: _submit,
                  child: const Text('REGISTER'),
                ),
        ],
      ),
    );
  }
}
