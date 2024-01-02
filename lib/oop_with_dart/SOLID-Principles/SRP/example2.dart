/// Correct Example:
class User {
  final String name;
  final String email;

  User(this.name, this.email);
}

class UserAuthenticator {
  bool authenticateUser(User user, String password) {
    // code to authenticate user
    return false;
  }
}

class UserDatabaseHandler {
  void saveUser(User user) {
    // code to save user to database
  }

  User getUser(String email) {
    // code to retrieve user from database and return User instance
    return User('name', 'email');
  }
}

class UserAuthorizer {
  bool authorizeUser(User user, String permission) {
    // code to authorize user for the given permission
    return false;
  }
}

/// Incorrect Example:
// This class has multiple responsibilities: to represent a user with their information, handle database interactions, and handle user authentication
/*
class User {
  final String name;
  final String email;

  User(this.name, this.email);

  void saveUser() {
     code to save user to database
  }

  bool authenticateUser(String password) {
     code to authenticate user
  }
}
*/
