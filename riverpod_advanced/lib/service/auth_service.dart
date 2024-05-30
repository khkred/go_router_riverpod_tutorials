class AuthService {
  String login(String login, String password) {
    //Mock Login Service
    if (login == 'admin' && password == 'admin') {
      return 'Login successful!';
    } else {
      return 'Login failed!';
    }
  }
}
