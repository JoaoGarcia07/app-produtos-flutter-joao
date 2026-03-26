import 'package:flutter/material.dart';
import '../models/produto.dart';

class CadastroProduto extends StatefulWidget {
  const CadastroProduto({super.key});

  @override
  State<CadastroProduto> createState() => _CadastroProdutoState();
}

class _CadastroProdutoState extends State<CadastroProduto> {
  final _nomeController = TextEditingController();
  final _precoController = TextEditingController();
  final _descController = TextEditingController();

  void _salvar() {
    final String nome = _nomeController.text;
    // Substitui a vírgula por ponto para garantir que o sistema entenda o número
    final String precoTexto = _precoController.text.replaceAll(',', '.');
    final double? preco = double.tryParse(precoTexto);

    if (nome.isNotEmpty && preco != null) {
      final novo = Produto(
        nome: nome,
        preco: preco,
        descricao: _descController.text,
      );
      Navigator.pop(context, novo);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Erro: Verifique o nome e o preço!'),
          backgroundColor: Colors.redAccent,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('NOVO REGISTRO')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _nomeController,
              decoration: const InputDecoration(
                labelText: 'Nome do Componente',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.build_circle, color: Color(0xFF006AA7)),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: _precoController,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(
                labelText: 'Preço (R\$)',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.monetization_on, color: Color(0xFF006AA7)),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: _descController,
              maxLines: 3,
              decoration: const InputDecoration(
                labelText: 'Observações Técnicas',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.description, color: Color(0xFF006AA7)),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFECC00),
                foregroundColor: const Color(0xFF006AA7),
                minimumSize: const Size(double.infinity, 55),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              onPressed: _salvar,
              child: const Text('CONFIRMAR CADASTRO', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}