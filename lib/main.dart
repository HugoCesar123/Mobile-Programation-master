import 'package:flutter/material.dart';
//Importa o SharedPreferences
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(IdiomaApp());
}

// - - - - - - - Classe principal do aplicativo - - - - - - -
class IdiomaApp extends StatefulWidget {
  const IdiomaApp({super.key});

  @override
  State<IdiomaApp> createState() => _MyAppState();
}

// - - - - - - - Classe responsável pela lógica - - - - - - -
class _MyAppState extends State<IdiomaApp> {
  // Variável responsável por controlar o tema
  // true  -> tema escuro
  // false -> tema claro
  // O aplicativo começa no tema claro
  bool isIdioma = false;

  @override
  void initState() {
    super.initState();

    // Quando o aplicativo inicia, ele chama a função carregarTema(). Essa função verifica se existe um tema salvo no SharedPreferences
    carregarTema();
  }

  // - - - - - - - Função para salvar o tema - - - - - - -
  Future<void> salvarTema(bool valor) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setBool('temaEscuro', valor);
  }

  //
  //
  //
  //
  //
  //
  //
  // - - - - - - - Função para carregar tema - - - - - - -
  Future<void> carregarTema() async {
    final prefs = await SharedPreferences.getInstance();
    bool? temaSalvo = prefs.getBool('temaEscuro');

    setState(() {
      isIdioma = temaSalvo ?? false;
    });
  }

  //
  //
  //
  //
  //
  //
  //
  //
  //
  //
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Remove a faixa DEBUG
      debugShowCheckedModeBanner: false,

      // Tema claro padrão
      theme: ThemeData.light(),

      // Tema escuro
      darkTheme: ThemeData.dark(),

      themeMode: isIdioma ? ThemeMode.light : ThemeMode.light,

      // - - - - - - - Tela Principal - - - - - - -
      home: Scaffold(
        appBar: AppBar(title: const Text("Troca de idioma")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,

            children: [
              // Texto mostrando o tema atual
              Text(
                isIdioma ? "English" : "Português",

                style: const TextStyle(fontSize: 24),
              ),

              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // - - - - - - - Botão Sol - - - - - - -
                  IconButton(
                    // Trocamos o Icon antigo por um Text com o emoji da bandeira
                    icon: const Text(
                      '🇧🇷',
                      style: TextStyle(
                        fontSize: 40,
                      ), // Controla o tamanho da bandeira aqui
                    ),
                    onPressed: () {
                      // Atualiza a tela
                      setState(() {
                        // false = tema claro
                        isIdioma = false;
                      });

                      // Salva o tema claro
                      salvarTema(false);
                    },
                  ),

                  const SizedBox(width: 10),

                  // SWITCH
                  Switch(
                    value: isIdioma,

                    onChanged: (valor) {
                      // Atualiza a tela
                      setState(() {
                        isIdioma = valor;
                      });

                      // Salva no SharedPreferences
                      salvarTema(valor);
                    },
                  ),

                  const SizedBox(width: 10),

                  // - - - - - - - Botão Lua - - - - - - -
                  IconButton(
                    // Trocamos o ícone de lua pelo emoji da bandeira dos EUA
                    icon: const Text(
                      '🇺🇸',
                      style: TextStyle(
                        fontSize: 40,
                      ), // Controla o tamanho da bandeira
                    ),
                    onPressed: () {
                      // Atualiza a tela
                      setState(() {
                        // true = tema escuro (ou idioma alterado)
                        isIdioma = true;
                      });

                      // Salva o tema escuro
                      salvarTema(true);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
