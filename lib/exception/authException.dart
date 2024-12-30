class AuthException implements Exception {

  final Map<String, String> erros = {
    'EMAIL_EXISTS': 'o endereço de e-mail já está sendo usado por outra conta.',
    'OPERATION_NOT_ALLOWED':
        'o login por senha está desativado para este projeto.',
    'TOO_MANY_ATTEMPTS_TRY_LATER':
        'bloqueamos devido atividades incomuns. Tente mais tarde.',
    'EMAIL_NOT_FOUND':
        'não há registro de usuário correspondente a este identificador',
    'USER_DISABLED': 'a conta de usuário foi desativada por um administrador.',
    'INVALID_PASSWORD': 'a senha é inválida ou o usuário não tem uma senha.',
    'INVALID_LOGIN_CREDENTIALS': 'email ou senha estão inválidos'
  };

  final String key;

  AuthException(this.key);

  @override
  String toString(){
    return erros[key] ?? 'Erro na autenticaçao';
  }
}
