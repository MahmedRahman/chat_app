import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  Future<User?> loginWithEmailPassword(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar(
          "Error", // title
          "User not found", // message
          snackPosition: SnackPosition.BOTTOM,
          borderRadius: 20,
          duration: Duration(seconds: 2),
        );
        return null;
      }

      Get.snackbar(
        "Error", // title
        e.message.toString(), // message
        snackPosition: SnackPosition.BOTTOM,
        borderRadius: 20,
        duration: Duration(seconds: 2),
      );
      // Handle other Firebase auth errors here
      print(e.message);

      return null;
    }
  }
}
