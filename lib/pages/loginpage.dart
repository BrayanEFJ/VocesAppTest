import 'package:flutter/material.dart';
import '../controllers/login_controller.dart';
import './home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final LoginController _loginController = LoginController();
  bool _rememberMe = false;
  bool _isLoading = false;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleLogin() async {
    setState(() {
      _isLoading = true;
    });

    final username = _usernameController.text;
    final password = _passwordController.text;

    if (username.isEmpty || password.isEmpty) {
      _showErrorDialog('Por favor, completa todos los campos');
      setState(() {
        _isLoading = false;
      });
      return;
    }

    try {
      final success = await _loginController.login(username, password);
      
      if (success) {
        // Navegamos a la página de inicio si el login es exitoso
        if (mounted) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomePage(username: username)),
          );
        }
      } else {
        if (mounted) {
          _showErrorDialog('Credenciales incorrectas' + success.toString());
        }
      }
    } catch (e) {
      if (mounted) {
        _showErrorDialog('Error de conexión');
      }
    }

    if (mounted) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Error'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Aceptar'),
          ),
        ],
      ),
    );
  }

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
              _LoginForm(
                usernameController: _usernameController,
                passwordController: _passwordController,
                rememberMe: _rememberMe,
                onRememberMeChanged: (value) {
                  setState(() {
                    _rememberMe = value ?? false;
                  });
                },
                onLogin: _handleLogin,
                isLoading: _isLoading,
              ),
              const SizedBox(height: 20),
              const _Divider(),
              const SizedBox(height: 20),
              _CustomButton(
                text: 'Regístrate',
                onPressed: () {
                  // Aquí puedes implementar la navegación a la página de registro
                },
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
  final TextEditingController usernameController;
  final TextEditingController passwordController;
  final bool rememberMe;
  final Function(bool?) onRememberMeChanged;
  final VoidCallback onLogin;
  final bool isLoading;

  const _LoginForm({
    required this.usernameController,
    required this.passwordController,
    required this.rememberMe,
    required this.onRememberMeChanged,
    required this.onLogin,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _CustomTextField(
          hintText: 'Usuario',
          icon: Icons.person_outline,
          controller: usernameController,
        ),
        const SizedBox(height: 20),
        _CustomTextField(
          hintText: 'Contraseña',
          icon: Icons.lock_outline,
          isPassword: true,
          controller: passwordController,
        ),
        const SizedBox(height: 10),
        _RememberMeAndForgotPassword(
          rememberMe: rememberMe,
          onRememberMeChanged: onRememberMeChanged,
        ),
        const SizedBox(height: 10),
        isLoading
            ? const CircularProgressIndicator(
                color: Color.fromARGB(255, 39, 107, 225),
              )
            : _CustomButton(
                text: 'Iniciar sesión',
                onPressed: onLogin,
                isOutlined: false,
              ),
      ],
    );
  }
}

class _RememberMeAndForgotPassword extends StatelessWidget {
  final bool rememberMe;
  final Function(bool?) onRememberMeChanged;

  const _RememberMeAndForgotPassword({
    required this.rememberMe,
    required this.onRememberMeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Checkbox(
              value: rememberMe,
              onChanged: onRememberMeChanged,
              activeColor: const Color.fromARGB(255, 39, 107, 225),
            ),
            const Text("Recuérdame", style: TextStyle(fontSize: 14)),
          ],
        ),
        TextButton(
          onPressed: () {
            // Aquí puedes implementar la navegación a la página de recuperación de contraseña
          },
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
  final TextEditingController controller;

  const _CustomTextField({
    required this.hintText,
    required this.icon,
    this.isPassword = false,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
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
