import 'package:decimal/decimal.dart';
import 'package:financial_app/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const route = '/homeScreen';
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String userName = 'Musashi';
  DateTime now = DateTime.now();
  final currentBalance = Decimal.parse('20000.93');
  final currencyFormatter =
      NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');

  @override
  Widget build(BuildContext context) {
    String currentDay =
        '${now.day.toString().padLeft(2, '0')}/${now.month.toString().padLeft(2, '0')}/${now.year.toString()}';
    String formattedBalance =
        currencyFormatter.format(currentBalance.toDouble());
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(dummyAvatarImage),
            ),
            const SizedBox(width: 10),
            Text('Bem vindo, $userName!'),
            Padding(
              padding: const EdgeInsets.only(
                right: 10,
                left: 50,
              ),
              child: IconButton(
                icon: const Icon(
                  Icons.logout,
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 5,
              horizontal: 30,
            ),
            child: Row(
              children: [
                const Text('Dia '),
                Text(currentDay),
              ],
            ),
          ),
          Center(
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFF808080),
                      Color(0xFFC0C0C0),
                    ],
                  ),
                ),
                width: 360,
                height: 180,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 30,
                    right: 30,
                    top: 10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Balanço atual',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        formattedBalance,
                        style: const TextStyle(
                          fontSize: 25,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Renda Mensal',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Color.fromARGB(255, 0, 255, 8),
                                ),
                              ),
                              Text(
                                'R\$ 28.000,93',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Despesa Mensal',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.red,
                                ),
                              ),
                              Text(
                                'R\$ 8.000,00',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Histórico de transações',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('Ver mais'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 4,
                  child: ListTile(
                    leading: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(dummyAvatarImage),
                            fit: BoxFit.cover),
                      ),
                    ),
                    title: const Text('Nome da Despesa/Renda'),
                    subtitle: const Text('dd/mm/yyyy'),
                    trailing: const Text(
                      'R\$ 18.000,99',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: const Icon(Icons.home),
              onPressed: () {
                // Handle Home button tap
              },
            ),
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                // Handle Search button tap
              },
            ),
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                // Handle Add button tap
              },
            ),
            IconButton(
              icon: const Icon(Icons.person),
              onPressed: () {
                // Handle Profile button tap
              },
            ),
          ],
        ),
      ),
    );
  }
}
