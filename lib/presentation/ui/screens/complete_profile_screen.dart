import 'package:ecommers/presentation/ui/screens/home_screen.dart';
import 'package:ecommers/presentation/ui/widgets/app_logo_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _mobileController = TextEditingController();
  final _cityController = TextEditingController();
  final _addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const AppLogoWidget(),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Complete Profile',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Get started with us with your details',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: Colors.grey),
                ),
                const SizedBox(
                  height: 25,
                ),
                TextFormField(
                  controller: _firstNameController,
                  decoration: const InputDecoration(
                    hintText: 'First Name',
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: _lastNameController,
                  decoration: const InputDecoration(hintText: 'Last Name'),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _mobileController,
                  decoration: const InputDecoration(
                    hintText: 'Mobile Number',
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: _cityController,
                  decoration: const InputDecoration(hintText: 'City'),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  maxLines: 4,
                  controller: _addressController,
                  decoration: const InputDecoration(hintText: 'Shopping Address'),
                ),
                const SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                  onPressed: _moveToHomeScreen,
                  child: const Text('Complete'),
                ),
                const SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  void _moveToHomeScreen(){
    Get.off(()=> const HomeScreen());
  }
  @override
  void dispose() {
    _addressController.dispose();
    _cityController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _mobileController.dispose();
    super.dispose();
  }
}
