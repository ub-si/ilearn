import 'package:get/get.dart';

String? emailValidator(String? email) {
  if (email == null || email.isEmpty) {
    return "Digite seu e-mail!";
  }
  if (!email.isEmail) {
    return "Digite um e-mail válido!";
  }
  return null;
}

String? passwordValidator(password) {
  if (password == null || password.isEmpty) {
    return "Digite sua senha!";
  }
  if (password.length < 6) {
    return "Sua senha deve ter no mínimo 6 caracteres.";
  }
  return null;
}

String? nameValidator(name) {
  if (name == null || name.isEmpty) {
    return "Digite seu nome!";
  }
  return null;
}

String? namePlaceValidator(name) {
  if (name == null || name.isEmpty) {
    return "Digite o nome da propriedade!";
  }
  return null;
}

String? phoneValidator(String? phone) {
  if (phone == null || phone.isEmpty) {
    return "Digite seu número de celular!";
  }
  if (phone.length < 14 || !phone.isPhoneNumber) {
    return "Digite um número de celular válido!";
  }
  return null;
}

String? cpfValidator(String? cpf) {
  if (cpf == null || cpf.isEmpty) {
    return "Digite seu CPF!";
  }
  if (!cpf.isCpf) {
    return "Digite um CPF válido!";
  }
  return null;
}
