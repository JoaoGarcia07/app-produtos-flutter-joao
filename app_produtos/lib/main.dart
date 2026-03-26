import 'package:flutter/material.dart';
import 'screens/lista_produtos.dart';

void main() {
  runApp(const AppProdutos());
}

class AppProdutos extends StatelessWidget {
  const AppProdutos({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Volvo Inventory',
      theme: ThemeData(
        useMaterial3: true,
        // Cores da Bandeira da Suécia
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF006AA7),
          primary: const Color(0xFF006AA7),    // Azul Royal
          secondary: const Color(0xFFFECC00),  // Amarelo Ouro
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF006AA7),
          foregroundColor: Color(0xFFFECC00),
          centerTitle: true,
          elevation: 4,
        ),
      ),
      home: const ListaProdutos(),
    );
  }
}