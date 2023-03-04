import 'dart:io';
import 'package:flutter/material.dart';
import 'package:phone_auth/model/user_model.dart';
import 'package:phone_auth/provider/auth_provider.dart';
import 'package:phone_auth/utils/utils.dart';
import 'package:phone_auth/widgets/custom_button.dart';
import 'package:provider/provider.dart';
import 'package:phone_auth/model/user_model.dart';

class UserInfoScreen extends StatefulWidget {
  const UserInfoScreen({super.key});

  @override
  State<UserInfoScreen> createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  File? image;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final bioController = TextEditingController();

  @override
  void dispose() {
    super.dispose;
    nameController.dispose();
    emailController.dispose();
    bioController.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 5.0),
          child: Center(
            child: Column(
              children: [
                InkWell(
                  onTap: () {},
                  child: image == null
                      ? const CircleAvatar(
                          backgroundColor: Colors.pink,
                          radius: 50,
                          child: Icon(Icons.account_circle,
                              size: 50, color: Colors.white),
                        )
                      : CircleAvatar(
                          backgroundImage: FileImage(image!),
                          radius: 50,
                        ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                  margin: const EdgeInsets.only(top: 20),
                  child: Column(
                    children: [
                      textField(
                          hintText: "John Smitch",
                          icon: Icons.account_circle,
                          inputType: TextInputType.name,
                          maxLines: 1,
                          controller: nameController),
                      textField(
                          hintText: "abc@example.com",
                          icon: Icons.email,
                          inputType: TextInputType.emailAddress,
                          maxLines: 1,
                          controller: emailController),
                      textField(
                          hintText: "Enter your bio here...",
                          icon: Icons.edit,
                          inputType: TextInputType.name,
                          maxLines: 2,
                          controller: bioController),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.80,
                  child: CustomButton(
                    onPressed: () {},
                    text: "Continue",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget textField({
    required String hintText,
    required IconData icon,
    required TextInputType inputType,
    required int maxLines,
    required TextEditingController controller,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextFormField(
        cursorColor: Colors.pink,
        controller: controller,
        keyboardType: inputType,
        maxLength: maxLines,
        decoration: InputDecoration(
          prefixIcon: Container(
            margin: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0), color: Colors.pink),
            child: Icon(
              icon,
              size: 20,
              color: Colors.white,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.pink),
          ),
          hintText: hintText,
          alignLabelWithHint: true,
          border: InputBorder.none,
          fillColor: Colors.pink.shade50,
          filled: true,
        ),
      ),
    );
  }

  void storeData() async {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    UserModel userModel = UserModel(
        name: nameController.text.trim(),
        email: emailController.text.trim(),
        bio: bioController.text.trim(),
        profilePic: "",
        createdAt: "",
        phoneNumber: "",
        uid: "");
    if (image != null) {
      showSnackBar(context, "Please upload your profile photo");
    }
  }
}
