import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Ilustración (Placeholder de ejemplo)
              const SizedBox(height: 20),

              const SizedBox(width: 10),
              const Text(
                'Iniciar sesión',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),

              // Título
              const SizedBox(height: 5),

              const Text(
                'Tu voz importa. Tu bienestar también.',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black54,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              // Campo de usuario
              _buildTextField(hintText: 'Usuario', icon: Icons.person_outline),
              const SizedBox(height: 20),
              // Campo de contraseña
              _buildTextField(
                hintText: 'Contraseña',
                icon: Icons.lock_outline,
                isPassword: true,
              ),
              const SizedBox(height: 10),
              // Enlace "Olvidaste tu contraseña"
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value:
                            false, // Puedes hacer esto dinámico con un estado
                        onChanged: (bool? newValue) {
                          // Manejar el cambio de estado aquí
                        },
                        activeColor: Color.fromARGB(
                          255,
                          39,
                          107,
                          225,
                        ), // Color del checkbox activado
                      ),
                      const Text("Recuérdame", style: TextStyle(fontSize: 14)),
                    ],
                  ),
                  TextButton(
                    onPressed: () {
                      // Acción de recuperar contraseña
                    },
                    child: const Text(
                      'Recuperar Contraseña',
                      style: TextStyle(
                        color: Color.fromARGB(255, 39, 107, 225),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              // Botón de iniciar sesión
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 39, 107, 225),
                  minimumSize: const Size(double.infinity, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: const Text(
                  'Iniciar sesión',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Divisor
              Row(
                children: const [
                  Expanded(child: Divider(color: Colors.grey)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text('O'),
                  ),
                  Expanded(child: Divider(color: Colors.grey)),
                ],
              ),
              const SizedBox(height: 20),
              // Botón de registrarse
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(
                    color: Color.fromARGB(255, 39, 107, 225),
                  ),
                  minimumSize: const Size(double.infinity, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: const Text(
                  'Regístrate',
                  style: TextStyle(
                    color: Color.fromARGB(255, 39, 107, 225),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String hintText,
    required IconData icon,
    bool isPassword = false,
  }) {
    return TextField(
      obscureText: isPassword,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.blueGrey),
        hintText: hintText,
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(vertical: 20),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color:
                Colors
                    .grey, // Different color when the field is focused (optional)
            width: 2.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: Color.fromARGB(
              255,
              39,
              107,
              225,
            ), // Different color when the field is focused (optional)
            width: 2.0,
          ),
        ),
      ),
    );
  }
}
