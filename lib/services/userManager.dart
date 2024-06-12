class UserManager {
  static bool isLoggedIn = false;
  static String? username;

  static Future<void> login(String username) async {
    isLoggedIn = true;
    UserManager.username = username;
    // You can also store other user information here (e.g., tokens)
  }

  static void logout() {
    isLoggedIn = false;
    UserManager.username = null;
    // Clear any stored user data
  }

  Future<bool> checkLoginStatus() async {
    // Perform whatever logic you need to check if the user is logged in
    // For example, you might check if there's a stored token, or other session data

    // For simplicity, UserManager.isLoggedIn is used here
    return UserManager.isLoggedIn;
  }
}
