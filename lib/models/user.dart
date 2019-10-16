import 'package:flutter/material.dart';

class Usuario extends StatelessWidget {
  var _email;
  var _senha;
  var _token;

  Usuario(this._email, this._senha, this._token);

  BuildContext _context;

  @override
  Widget build(BuildContext context) {
    this._context = context;
  }

  void resetaUsuario() {
    this._token = '';
    this._email = '';
    this._senha = '';
  }

  getEmail() {
    return _email;
  }

  getSenha() {
    return _senha();
  }

  getToken() {
    return _token;
  }

  void setToken(String token) {
    this._token = token;
  }
}
