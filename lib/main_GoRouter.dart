import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'pages/produto_page.dart';
import 'pages/carrinho_page.dart';

// ─── MODELO DO PRODUTO ────────────────────────────────────────────────────
class Suculenta {
  final int id;
  final String nome;
  final String nomeCientifico;
  final String emoji;
  final double preco;
  final String descricao;

  const Suculenta({
    required this.id,
    required this.nome,
    required this.nomeCientifico,
    required this.emoji,
    required this.preco,
    required this.descricao,
  });
}

// ─── CATÁLOGO (4 ESPÉCIES) ────────────────────────────────────────────────
const List<Suculenta> produtos = [
  Suculenta(
    id: 1,
    nome: 'Roseta-de-Pedra',
    nomeCientifico: 'Echeveria elegans',
    emoji: '🌸',
    preco: 18.90,
    descricao: 'Suculenta compacta com folhas em roseta verde-azuladas.',
  ),
  Suculenta(
    id: 2,
    nome: 'Muda feijão',
    nomeCientifico: 'Haworthiopsis attenuata',
    emoji: '🌱',
    preco: 5.00,
    descricao: 'O principal grão das refeições brasileiras.',
  ),
  Suculenta(
    id: 3,
    nome: 'Babosa',
    nomeCientifico: 'Aloe vera',
    emoji: '🌿',
    preco: 32.00,
    descricao: 'Gel das folhas hidrata a pele e alivia queimaduras.',
  ),
  Suculenta(
    id: 4,
    nome: 'Cacto-Ouriço',
    nomeCientifico: 'Echinocactus grusonii',
    emoji: '🌵',
    preco: 15.00,
    descricao: 'praticamente não precisa de água.',
  ),
];

// ─── CARRINHO SIMPLES ─────────────────────────────────────────────────────
class ItemCarrinho {
  final Suculenta produto;
  int quantidade;

  ItemCarrinho(this.produto, this.quantidade);
}

class CarrinhoController extends ChangeNotifier {
  List<ItemCarrinho> itens = [];

  void adicionar(Suculenta produto) {
    // Verifica se o produto já está no carrinho
    for (var item in itens) {
      if (item.produto.id == produto.id) {
        item.quantidade++;
        notifyListeners();
        return;
      }
    }
    // Se não estiver, adiciona novo item
    itens.add(ItemCarrinho(produto, 1));
    notifyListeners();
  }

  void remover(Suculenta produto) {
    for (int i = 0; i < itens.length; i++) {
      if (itens[i].produto.id == produto.id) {
        if (itens[i].quantidade > 1) {
          itens[i].quantidade--;
        } else {
          itens.removeAt(i);
        }
        notifyListeners();
        return;
      }
    }
  }

  void removerItemCompleto(Suculenta produto) {
    itens.removeWhere((item) => item.produto.id == produto.id);
    notifyListeners();
  }

  double get total {
    double soma = 0;
    for (var item in itens) {
      soma += item.produto.preco * item.quantidade;
    }
    return soma;
  }

  int get totalItens {
    int soma = 0;
    for (var item in itens) {
      soma += item.quantidade;
    }
    return soma;
  }

  void limpar() {
    itens.clear();
    notifyListeners();
  }
}

final carrinho = CarrinhoController();

// ─── ROTAS ────────────────────────────────────────────────────────────────
final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => const HomePage()),
    GoRoute(
      path: '/produto/:id',
      builder: (context, state) {
        final id = int.parse(state.pathParameters['id']!);
        final produto = produtos.firstWhere((p) => p.id == id);
         return ProdutoPage(produto: produto);
    
      },
    ),
    GoRoute(path: '/carrinho', builder: (context, state) => const CarrinhoPage()),
  ],
);

void main() => runApp(const MeuApp());

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Suculentas & Cia',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF4A7C59)),
        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }
}

// ─── HOME PAGE ────────────────────────────────────────────────────────────
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🌵 Suculentas & Cia'),
        backgroundColor: const Color(0xFF4A7C59),
        foregroundColor: Colors.white,
        actions: [
          ListenableBuilder(
            listenable: carrinho,
            builder: (context, _) {
              return Stack(
                children: [
                  IconButton(
                    icon: const Icon(Icons.shopping_cart_outlined),
                    onPressed: () => context.push('/carrinho'),
                  ),
                  if (carrinho.totalItens > 0)
                    Positioned(
                      right: 6,
                      top: 6,
                      child: Container(
                        padding: const EdgeInsets.all(3),
                        decoration: const BoxDecoration(
                          color: Colors.orange,
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          '${carrinho.totalItens}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: produtos.length,
        itemBuilder: (context, index) {
          final produto = produtos[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: Text(produto.emoji, style: const TextStyle(fontSize: 36)),
              title: Text(produto.nome),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    produto.nomeCientifico,
                    style: const TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                  Text('R\$ ${produto.preco.toStringAsFixed(2)}'),
                ],
              ),
              isThreeLine: true,
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () => context.go('/produto/${produto.id}'),
            ),
          );
        },
      ),
    );
  }
}