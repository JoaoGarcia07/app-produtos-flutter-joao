import 'package:flutter/material.dart';
import '../models/produto.dart';
import 'cadastro_produto.dart';
import 'detalhe_produto.dart';

class ListaProdutos extends StatefulWidget {
  const ListaProdutos({super.key});

  @override
  State<ListaProdutos> createState() => _ListaProdutosState();
}

class _ListaProdutosState extends State<ListaProdutos> {
  final List<Produto> _produtos = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ESTOQUE VOLVO', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: _produtos.isEmpty
          ? const Center(child: Text('Nenhum item no inventário.'))
          : ListView.builder(
              itemCount: _produtos.length,
              itemBuilder: (context, index) {
                final item = _produtos[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  child: ListTile(
                    leading: const Icon(Icons.directions_car, color: Color(0xFF006AA7)),
                    title: Text(item.nome, style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text('R\$ ${item.preco.toStringAsFixed(2)}'),
                    trailing: const Icon(Icons.arrow_forward_ios, color: Color(0xFFFECC00)),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetalheProduto(produto: item),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFFFECC00),
        foregroundColor: const Color(0xFF006AA7),
        child: const Icon(Icons.add, size: 30),
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CadastroProduto()),
          );

          if (result != null && result is Produto) {
            setState(() {
              _produtos.add(result);
            });
          }
        },
      ),
    );
  }
}