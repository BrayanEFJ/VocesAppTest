import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const _Header(),
              const SizedBox(height: 40),
              const _LoginForm(),
              const SizedBox(height: 20),
              const _Divider(),
              const SizedBox(height: 20),
              _CustomButton(
                text: 'Regístrate',
                onPressed: () {},
                isOutlined: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Image.asset('assets/icons/icon.png', height: 50, width: 50),
            const SizedBox(width: 10),
            const Text(
              'Iniciar sesión',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(height: 5),
        const Text(
          'Tu voz importa. Tu bienestar también.',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black54),
          textAlign: TextAlign.start,
        ),
      ],
    );
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _CustomTextField(hintText: 'Usuario', icon: Icons.person_outline),
        const SizedBox(height: 20),
        _CustomTextField(hintText: 'Contraseña', icon: Icons.lock_outline, isPassword: true),
        const SizedBox(height: 10),
        _RememberMeAndForgotPassword(),
        const SizedBox(height: 10),
        _CustomButton(
          text: 'Iniciar sesión',
          onPressed: () {},
          isOutlined: false,
        ),
      ],
    );
  }
}

class _RememberMeAndForgotPassword extends StatelessWidget {
  const _RememberMeAndForgotPassword();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Checkbox(value: false, onChanged: (bool? newValue) {}),
            const Text("Recuérdame", style: TextStyle(fontSize: 14)),
          ],
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            'Recuperar Contraseña',
            style: TextStyle(color: Color.fromARGB(255, 39, 107, 225), fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}

class _CustomTextField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final bool isPassword;

  const _CustomTextField({required this.hintText, required this.icon, this.isPassword = false});

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isPassword,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.blueGrey),
        hintText: hintText,
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(vertical: 15),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.grey, width: 2.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Color.fromARGB(255, 39, 107, 225), width: 2.0),
        ),
      ),
    );
  }
}

class _CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isOutlined;

  const _CustomButton({required this.text, required this.onPressed, this.isOutlined = false});

  @override
  Widget build(BuildContext context) {
    return isOutlined
        ? OutlinedButton(
            onPressed: onPressed,
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Color.fromARGB(255, 39, 107, 225)),
              minimumSize: const Size(double.infinity, 55),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            ),
            child: Text(
              text,
              style: const TextStyle(color: Color.fromARGB(255, 39, 107, 225), fontSize: 18, fontWeight: FontWeight.bold),
            ),
          )
        : ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 39, 107, 225),
              minimumSize: const Size(double.infinity, 55),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            ),
            child: Text(
              text,
              style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
            ),
          );
  }
}

class _Divider extends StatelessWidget {
  const _Divider();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Expanded(child: Divider(color: Colors.grey)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text('O'),
        ),
        Expanded(child: Divider(color: Colors.grey)),
      ],
    );
  }
}
