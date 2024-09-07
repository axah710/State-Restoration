import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RestorationPage extends StatefulWidget {
  const RestorationPage({super.key});

  @override
  State<RestorationPage> createState() => _RestorationPageState();
}

class _RestorationPageState extends State<RestorationPage> with RestorationMixin {
  late final RestorableTextEditingController _name;
  late final RestorableTextEditingController _email;
  late final RestorableTextEditingController _phone;
  late final RestorableTextEditingController _password;

  @override
  void initState() {
    super.initState();
    _name = RestorableTextEditingController();
    _email = RestorableTextEditingController();
    _phone = RestorableTextEditingController();
    _password = RestorableTextEditingController();
  }

  @override
  String? get restorationId => 'restore_text_field';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_name, 'name');
    registerForRestoration(_email, 'email');
    registerForRestoration(_phone, 'phone');
    registerForRestoration(_password, 'password');
  }

  @override
  Widget build(BuildContext context) {
    return RestorationPageBody(name: _name, email: _email, phone: _phone, password: _password);
  }
}

class RestorationPageBody extends StatelessWidget {
  const RestorationPageBody({
    super.key,
    required RestorableTextEditingController name,
    required RestorableTextEditingController email,
    required RestorableTextEditingController phone,
    required RestorableTextEditingController password,
  }) : _name = name, _email = email, _phone = phone, _password = password;

  final RestorableTextEditingController _name;
  final RestorableTextEditingController _email;
  final RestorableTextEditingController _phone;
  final RestorableTextEditingController _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Test Restoration Page'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.r),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Register Screen',
                style: TextStyle(fontSize: 30.sp),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _name.value,
                decoration: InputDecoration(
                  hintText: 'Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _email.value,
                decoration: InputDecoration(
                  hintText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _phone.value,
                decoration: InputDecoration(
                  hintText: 'Phone',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _password.value,
                decoration: InputDecoration(
                  hintText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.r),
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

