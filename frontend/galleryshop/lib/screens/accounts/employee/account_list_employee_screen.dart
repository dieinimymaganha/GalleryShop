import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:galleryshop/data/function_generic.dart';
import 'package:galleryshop/data/values.dart';
import 'package:galleryshop/screens/accounts/employee/detail_account_employee.dart';
import 'package:galleryshop/screens/base/base_screen.dart';
import 'package:galleryshop/stores/account_employee_store.dart';

class AccountListEmployeeScreen extends StatefulWidget {
  @override
  _AccountListEmployeeScreenState createState() =>
      _AccountListEmployeeScreenState();
}

class _AccountListEmployeeScreenState extends State<AccountListEmployeeScreen> {
  AccountEmployeeStore accountEmployeeStore = AccountEmployeeStore();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: TextFormField(
              onChanged: accountEmployeeStore.setFilter,
              decoration: InputDecoration(
                suffixIcon: Icon(Icons.search),
                hintText: 'Pesquisar...',
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
            backgroundColor: colorAppbar,
            leading: IconButton(
              icon: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => BaseScreen()));
                },
              ),
            ),
          ),
          body: ListView(
            children: accountEmployeeStore.lisFiltered.map((accountDto) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: InkWell(
                  onDoubleTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => DetailAccountEmployee(
                              idEmployee: accountDto.employeeDtoBasic.id,
                              consultMyAccount: false,
                            )));
                  },
                  child: Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    color: colorCard,
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 15, right: 15, top: 10, bottom: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          accountDto.employeeDtoBasic.nickname,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 18),
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Text(
                                              'Nome: ',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700),
                                            ),
                                            Text(
                                              accountDto.employeeDtoBasic.name,
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w400),
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Text(
                                              'Sobrenome: ',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700),
                                            ),
                                            Text(
                                              accountDto
                                                  .employeeDtoBasic.lastName,
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w400),
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Text(
                                              'CPF: ',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700),
                                            ),
                                            Text(
                                              accountDto.employeeDtoBasic.cpf,
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w400),
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Text(
                                              'Telefone: ',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700),
                                            ),
                                            Text(
                                              accountDto
                                                  .employeeDtoBasic.phoneNumber,
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w400),
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Text(
                                              'Data Nascimento: ',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700),
                                            ),
                                            Text(
                                              convertData(
                                                accountDto
                                                    .employeeDtoBasic.birthdate
                                                    .toString(),
                                              ),
                                              style: TextStyle(
                                                  color: Colors.blueAccent),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    Container(
                                        height: 100,
                                        child: VerticalDivider(
                                          color: Colors.grey[400],
                                          thickness: 1.5,
                                        )),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          'Informações contas',
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        SizedBox(
                                          height: 6.0,
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Text(
                                              'Valor total: ',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700),
                                            ),
                                            Text(
                                              accountDto.amount.toString(),
                                              style:
                                                  TextStyle(color: Colors.blue),
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Text(
                                              'Valor pago: ',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700),
                                            ),
                                            Text(
                                              accountDto.amountPaid.toString(),
                                              style:
                                                  TextStyle(color: Colors.blue),
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Text(
                                              'Saldo: ',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700),
                                            ),
                                            Text(
                                              accountDto.balance.toString(),
                                              style:
                                                  TextStyle(color: Colors.blue),
                                            )
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    accountEmployeeStore.setList();
  }
}
