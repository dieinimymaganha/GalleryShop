import 'package:cpf_cnpj_validator/cpf_validator.dart';

String validatorComissionRate(String value) {
  if (value.isEmpty) {
    return 'Campo obrigatório';
  } else if (value.isNotEmpty) {
    try {
      int.parse(value);
    } on Exception catch (_) {
      return 'Somente números, sem dígitos';
    }
  }
  return null;
}

String validatorName(String value) {
  if (value.isEmpty) {
    return 'Campo obrigatório';
  }
}

String validatorCpf(String value) {
  if (value.isEmpty) {
    return 'Campo obrigatório';
  } else if (CPFValidator.isValid(value)) {
    return null;
  }
  return 'CPF inválido';
}

String validatorBirthDate(String value) {
  const Pattern pattern =
      r'(0?[1-9]|[12][0-9]|3[01])[\/\-](0?[1-9]|1[012])[\/\-]\d{4}';
  final RegExp regex = RegExp(pattern);
  if (value.isEmpty) {
    return 'Campo obrigatório';
  } else if (!regex.hasMatch(value)) {
    return 'Data inválida';
  }
  return null;
}

String validatorEmail(String value) {
  const Pattern pattern =
      "^[\\w-\\+]+(\\.[\\w]+)*@[\\w-]+(\\.[\\w]+)*(\\.[a-z]{2,})";
  final RegExp regex = RegExp(pattern);

  if (!regex.hasMatch(value)) {
    return 'Email inválido';
  } else {
    return null;
  }
}

String validatorPhoneNumber(String value) {
  const Pattern pattern = r'(\(\d{3}\)\s)(\d{4,5}\-\d{4})';
  final RegExp regex = RegExp(pattern);
  if (value.isEmpty) {
    return 'Campo obrigatório';
  } else if (!regex.hasMatch(value)) {
    return 'Telefone inválido';
  } else {
    if (value == "(123) 45678-9012" ||
        value == "(123) 45678-9123" || value == "(000) 00000-0000" ||
        value == "(111) 11111-1111" || value == "(222) 22222-2222" ||
        value == "(333) 33333-3333" || value == "(444) 44444-4444" ||
        value == "(555) 55555-5555" || value == "(666) 66666-6666" ||
        value == "(777) 77777-7777" || value == "(888) 88888-8888" ||
        value == "(999) 99999-9999") {
      return 'Telefone inválido';
    }
    return null;
  }
}