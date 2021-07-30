import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:lottie_animations/successful_page.dart';

class AppWidgetPage extends StatefulWidget {
  const AppWidgetPage({Key? key}) : super(key: key);

  @override
  _AppWidgetPageState createState() => _AppWidgetPageState();
}

class _AppWidgetPageState extends State<AppWidgetPage>
    with TickerProviderStateMixin {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: Icon(
            Icons.arrow_back,
            color: Colors.greenAccent,
          ),
          elevation: 0,
        ),
        body: Container(
          color: Colors.white,
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('Você está pagando'),
                    Text('R\$ 55,98'),
                    Text('Saldo disponível atual: R\$ 986,50'),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 16, right: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.monetization_on),
                                    SizedBox(width: 8.0),
                                    Text('Pagando com'),
                                  ],
                                ),
                                Text('Conta'),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16, right: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.calendar_today),
                                    SizedBox(width: 8.0),
                                    Text('Pagando hoje'),
                                  ],
                                ),
                                Text('30/07/2021'),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16, right: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.calendar_view_day_outlined),
                                    SizedBox(width: 8.0),
                                    Text('Vencimento'),
                                  ],
                                ),
                                Text('05/08/2021'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xffF0F2F5),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 16, right: 16),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Para'),
                                  Text('MARCOS CHAVES S/A')
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 16, right: 16),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Banco'),
                                  Text('ITAU S/A - CFI')
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 16, right: 16),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Código do boleto'),
                                  Text('1464646.415691.16916.54555556')
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 60,
                      child: TextButton(
                        child: Text(
                          'Confirmar',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        onPressed: () {
                          buildTransaction();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SuccessfulPage()),
                          );
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.greenAccent),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildRender() {
    if (isLoading) {
      return Text(
        'Confirmar',
        style: TextStyle(color: Colors.white, fontSize: 18),
      );
    }

    buildTransaction();
    return Lottie.asset(
      'assets/lottie/loading.json',
      repeat: true,
    );
  }

  Future<void> buildTransaction() async {
    await Future.delayed(const Duration(seconds: 10));
    setState(() {
      isLoading = true;
    });
  }

}
