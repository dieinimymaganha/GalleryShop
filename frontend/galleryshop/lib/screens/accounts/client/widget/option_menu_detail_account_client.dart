class OptionsMenuDetailAccount {
  static const String consultServices = 'Consultar serviços';
  static const String insertServices = 'Registrar serviço';
  static const String consultPayment = 'Consultar pagamentos';
  static const String updatePage = 'Atualizar';
  static const String insertProduct = 'Registrar venda';
  static const String consultSales = 'Consultar compras';

  static const List<String> choices = <String>[
    updatePage,
    insertServices,
    consultServices,
    insertProduct,
    consultSales,
    consultPayment,
  ];
}

class OptionsMenuDetailConsultMyAccount {
  static const String consultServices = 'Consultar serviços';
  static const String consultPayment = 'Consultar pagamentos';
  static const String consultSales = 'Consultar compras';

  static const List<String> choices = <String>[
    consultServices,
    consultSales,
    consultPayment,
  ];
}
