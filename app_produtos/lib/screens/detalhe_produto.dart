import 'package:flutter/material.dart';
import '../models/produto.dart';

class DetalheProduto extends StatelessWidget {
  final Produto produto;

  const DetalheProduto({super.key, required this.produto});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('DETALHES DO ITEM')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Card(
          elevation: 10,
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 120,
                width: double.infinity,
                color: const Color(0xFF006AA7),
                child: const Icon(Icons.settings_suggest, size: 80, color: Color(0xFFFECC00)),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(produto.nome, style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    Text(
                      'R\$ ${produto.preco.toStringAsFixed(2)}',
                      style: const TextStyle(fontSize: 22, color: Colors.green, fontWeight: FontWeight.bold),
                    ),
                    const Divider(height: 40),
                    const Text(
                      'DESCRIÇÃO DO PRODUTO:',
                      style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF006AA7)),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      produto.descricao.isEmpty ? 'Nenhuma observação cadastrada.' : produto.descricao,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}