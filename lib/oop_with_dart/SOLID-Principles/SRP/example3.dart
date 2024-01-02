/// Correct Example:
class AuthenticationManager {
  bool authenticate(String username, String password) {
    // code to authenticate user
    return false;
  }

  void logout() {
    // code to log out user
  }
}


/// Incorrect Example:
/*
 class UserManager {
  bool authenticate(String username, String password) {
     code to authenticate user
  }

  void logout() {
    code to log out user
  }

  void saveUserToDatabase(User user) {
    code to save user to database
  }

  Future<User> getUserFromAPI(String apiUrl) async {
     code to retrieve user from API
  }

  Future<void> saveUserToAPI(User user, String apiUrl) async {
     code to save user to API
  }
}
*/