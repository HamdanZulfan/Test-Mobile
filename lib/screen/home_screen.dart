import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:test_flutter/provider/image_provider.dart';
import 'package:test_flutter/screen/rest_api_screen.dart';

import 'package:test_flutter/utils/theme.dart';

import '../provider/auth_provider.dart';
import '../provider/login_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String hasil = '';
  @override
  Widget build(BuildContext context) {
    final imagePickerService = Provider.of<ImagePickerService>(context);
    LoginProvider auth = Provider.of<LoginProvider>(context, listen: false);
    AuthProvider authh = Provider.of<AuthProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Test Mobile'),
            ElevatedButton(
              onPressed: () {
                auth.logoutGoogle();
                authh.logOut(context);
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(17),
                ),
              ),
              child: const Text('Logout'),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Text(
                'Masukan Gambar Ke Dalam Aplikasi ini',
                style: blackTextStyle.copyWith(fontSize: 18, fontWeight: bold),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: imagePickerService.imageFile != null
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.file(
                            File(imagePickerService.imageFile!.path),
                            fit: BoxFit.cover,
                            height: 200,
                            width: MediaQuery.of(context).size.width,
                          ),
                          const SizedBox(height: 20),
                          // ElevatedButton(
                          //   onPressed: () => imagePickerService.clearImage(),
                          //   child: Text('Clear Image'),
                          // ),
                        ],
                      )
                    : Column(
                        children: [
                          Image.asset(
                            'assets/no_photos.png',
                            height: 200,
                            width: 200,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            'Gambar Belum Dimasukan',
                            style: blackTextStyle.copyWith(
                              fontSize: 18,
                              fontWeight: semiBold,
                            ),
                          ),
                        ],
                      ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: () =>
                      imagePickerService.pickImage(ImageSource.camera),
                  style: TextButton.styleFrom(
                    backgroundColor: kPrimaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(17),
                    ),
                  ),
                  child: Text(
                    'Pilih Gambar',
                    style:
                        whiteTextStyle.copyWith(fontSize: 18, fontWeight: bold),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                padding: const EdgeInsets.only(
                  top: 10,
                ),
                height: 55,
                width: MediaQuery.of(context).size.width,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RestApiScreen(),
                      ),
                    );
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: kPrimaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(17),
                    ),
                  ),
                  child: Text(
                    'Check Rest Api',
                    style:
                        whiteTextStyle.copyWith(fontSize: 18, fontWeight: bold),
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
