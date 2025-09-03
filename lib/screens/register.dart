import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'translations.dart';
import 'login.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  bool _isLoading = false;

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),

                  // Back Button
                  _buildBackButton(),

                  const SizedBox(height: 40),

                  // Title
                  _buildTitle(),

                  const SizedBox(height: 40),

                  // Registration Form
                  _buildRegistrationForm(),

                  const SizedBox(height: 30),

                  // Register Button
                  _buildRegisterButton(),

                  const SizedBox(height: 20),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBackButton() {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Icon(
          Icons.arrow_back,
          color: Colors.black,
          size: 24,
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Center(
      child: Text(
        tr('registration'),
        style: TextStyle(
          color: Colors.black,
          fontSize: 32,
          fontFamily: 'Rufina',
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  Widget _buildRegistrationForm() {
    return Column(
      children: [
        // First Name
        _buildInputField(
          controller: _firstNameController,
          label: tr('first_name'),
          validator: (value) {
            if (value?.isEmpty ?? true) {
              return 'Please enter your first name';
            }
            return null;
          },
        ),

        const SizedBox(height: 20),

        // Last Name
        _buildInputField(
          controller: _lastNameController,
          label: tr('last_name'),
          validator: (value) {
            if (value?.isEmpty ?? true) {
              return 'Please enter your last name';
            }
            return null;
          },
        ),

        const SizedBox(height: 20),

        // Phone Number
        _buildInputField(
          controller: _phoneController,
          label: tr('phone_number'),
          keyboardType: TextInputType.phone,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(10),
          ],
          validator: (value) {
            if (value?.isEmpty ?? true) {
              return 'Please enter your phone number';
            }
            if (value!.length != 10) {
              return 'Phone number must be 10 digits';
            }
            return null;
          },
        ),

        const SizedBox(height: 20),

        // Password
        _buildInputField(
          controller: _passwordController,
          label: tr('password'),
          isPassword: true,
          isPasswordVisible: _isPasswordVisible,
          onTogglePassword: () {
            setState(() {
              _isPasswordVisible = !_isPasswordVisible;
            });
          },
          validator: (value) {
            if (value?.isEmpty ?? true) {
              return 'Please enter a password';
            }
            if (value!.length < 6) {
              return 'Password must be at least 6 characters';
            }
            return null;
          },
        ),

        const SizedBox(height: 20),

        // Confirm Password
        _buildInputField(
          controller: _confirmPasswordController,
          label: tr('confirm_password'),
          isPassword: true,
          isPasswordVisible: _isConfirmPasswordVisible,
          onTogglePassword: () {
            setState(() {
              _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
            });
          },
          validator: (value) {
            if (value?.isEmpty ?? true) {
              return 'Please confirm your password';
            }
            if (value != _passwordController.text) {
              return 'Passwords do not match';
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget _buildInputField({
    required TextEditingController controller,
    required String label,
    TextInputType? keyboardType,
    List<TextInputFormatter>? inputFormatters,
    bool isPassword = false,
    bool? isPasswordVisible,
    VoidCallback? onTogglePassword,
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
          obscureText: isPassword ? !(isPasswordVisible ?? false) : false,
          validator: validator,
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xFFF5F5F5),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: const Color(0xFF1D4F58),
                width: 2,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: Colors.red,
                width: 1,
              ),
            ),
            suffixIcon: isPassword
                ? IconButton(
              icon: Icon(
                isPasswordVisible ?? false
                    ? Icons.visibility
                    : Icons.visibility_off,
                color: Colors.grey,
              ),
              onPressed: onTogglePassword,
            )
                : null,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
          ),
          style: TextStyle(
            fontSize: 16,
            fontFamily: 'Poppins',
          ),
        ),
      ],
    );
  }

  Widget _buildRegisterButton() {
    return Container(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: _isLoading ? null : _handleRegistration,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF1D4F58),
          foregroundColor: Colors.white,
          elevation: 4,
          shadowColor: Color(0x3F000000),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: _isLoading
            ? CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          strokeWidth: 2,
        )
            : Text(
          tr('register'),
          style: TextStyle(
            fontSize: 16,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _buildSignInLink() {
    return Center(
      child: GestureDetector(
        onTap: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen()),
          );
        },
        child: Text.rich(
          TextSpan(
            text: 'Already have an account? ',
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
            ),
            children: [
              TextSpan(
                text: 'Sign in',
                style: TextStyle(
                  color: const Color(0xFF1D4F58),
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleRegistration() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      // Simulate API call
      await Future.delayed(Duration(seconds: 2));

      setState(() {
        _isLoading = false;
      });

      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Registration successful!'),
          backgroundColor: const Color(0xFF1D4F58),
        ),
      );

      // Navigate to login or main app
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    }
  }
}