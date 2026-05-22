import 'package:flutter/material.dart';

void main() {
  runApp(const QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: InicioPage());
  }
}

class InicioPage extends StatelessWidget {
  const InicioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[200],

      appBar: AppBar(title: const Text("Quiz"), centerTitle: true),

      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepPurple,
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          ),

          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const TopicosPage()),
            );
          },

          child: const Text(
            "Iniciar Quiz",
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class TopicosPage extends StatefulWidget {
  const TopicosPage({super.key});

  @override
  State<TopicosPage> createState() => _TopicosPageState();
}

class _TopicosPageState extends State<TopicosPage> {
  List<String> topicos = [
    "Realismo",
    "Parnasianismo",
    "Romantismo",
    "Barroco",
    "Simbolismo",
    "Crase",
    "Redação",
    "Preterito Perfeito",
    "Adjetivo",
    "Advérbio",
    "Gramatica",
  ];

  List<bool> selecionados = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[200],

      appBar: AppBar(title: const Text("Tópicos"), centerTitle: true),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            ...topicos.asMap().entries.map((entry) {
              int index = entry.key;

              return CheckboxListTile(
                title: Text(
                  topicos[index],
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                value: selecionados[index],

                onChanged: (value) {
                  setState(() {
                    selecionados[index] = value!;
                  });
                },
              );
            }).toList(),

            const SizedBox(height: 30),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 20,
                ),
              ),

              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const QuizPage()),
                );
              },

              child: const Text(
                "Avançar",
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int perguntaAtual = 0;
  int pontos = 0;

  int? respostaSelecionada;

  List perguntas = [
    {
      "pergunta": "Característica do Realismo:",
      "respostas": [
        {"texto": "Objetividade", "correta": true},
        {"texto": "Subjetividade", "correta": false},
        {"texto": "Sentimentalismo", "correta": false},
      ],
    },

    {
      "pergunta": "Característica do Romantismo:",
      "respostas": [
        {"texto": "Subjetividade e Emoção", "correta": true},
        {"texto": "Objetividade Extrema", "correta": false},
        {"texto": "Linguagem Cientifica", "correta": false},
        {"texto": "Valorização da Razão", "correta": false},
      ],
    },

    {
      "pergunta": "Qual frase está no preterito perfeito?",
      "respostas": [
        {"texto": "Eu estudava para a prova", "correta": false},
        {"texto": "Eu estudarei para a prova", "correta": false},
        {"texto": "Eu estudei para a prova", "correta": true},
        {"texto": "Eu estudo para a prova", "correta": false},
      ],
    },

    {
      "pergunta": "Qual a alternativa tem 2 adjetivos?",
      "respostas": [
        {"texto": "O dia está muito quente", "correta": true},
        {"texto": "Ela é muito inteligente", "correta": false},
        {"texto": "Ele chegou bem cansado", "correta": false},
        {"texto": "A menina saiu cedo", "correta": false},
      ],
    },

    {
      "pergunta": "O advérbio indica principalmente:",
      "respostas": [
        {"texto": "Ação do Verbo", "correta": true},
        {"texto": "Características do Substantivo", "correta": false},
        {
          "texto": "faz parte obrigatoriamente da oração subordinada",
          "correta": false,
        },
        {"texto": "Nome", "correta": false},
      ],
    },

    {
      "pergunta": "Qual delas é uma tese problematica?",
      "respostas": [
        {"texto": "Apresenta posicionamento claro", "correta": false},
        {"texto": "Ampla demais e sem recorte", "correta": true},
        {"texto": "Dialoga com o tema proposto", "correta": false},
        {"texto": "Permite desenvolvimento argumentativo", "correta": false},
      ],
    },

    {
      "pergunta": "A crase não é a fusão entre:",
      "respostas": [
        {"texto": "A preposição 'A' e o artigo feminino 'A'", "correta": true},
        {
          "texto": "A preposição 'A' e o artigo feminino 'UMA'",
          "correta": false,
        },
        {
          "texto": "A preposição 'A' e o artigo feminino 'AQUELA'",
          "correta": false,
        },
        {
          "texto": "A preposição 'A' e o artigo feminino 'AQUELE'",
          "correta": false,
        },
      ],
    },

    {
      "pergunta": "O simbolismo surgiu em que periodo?",
      "respostas": [
        {"texto": "Século XVI", "correta": false},
        {"texto": "Século XVIII", "correta": false},
        {"texto": "Metade do século XIX", "correta": true},
        {"texto": "Início do século XX", "correta": false},
      ],
    },

    {
      "pergunta": "Parnasianismo teve inicio com qual obra?",
      "respostas": [
        {"texto": "Fanfarras, de Teófilo Dias", "correta": true},
        {"texto": "O mulato, de Alúsio de Azevedo", "correta": false},
        {"texto": "Missal e Broquéis, de Cruz e Souza", "correta": false},
      ],
    },

    {
      "pergunta": "Escolha a frase que tem a posição correta",
      "respostas": [
        {"texto": "Não, ja disse que não vou", "correta": true},
        {"texto": "Não, ja disse, que não vou", "correta": false},
        {"texto": "Que susto", "correta": false},
        {"texto": "Aceita um café", "correta": false},
      ],
    },

    {
      "pergunta": "O Barroco valorizava:",
      "respostas": [
        {"texto": "Conflitos religiosos", "correta": true},
        {"texto": "Tecnologia", "correta": false},
        {"texto": "Minimalismo", "correta": false},
      ],
    },
  ];

  void responder(int index) {
    setState(() {
      respostaSelecionada = index;
    });

    bool acertou = perguntas[perguntaAtual]["respostas"][index]["correta"];

    if (acertou) {
      pontos++;
    }

    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        respostaSelecionada = null;

        if (perguntaAtual < perguntas.length - 1) {
          perguntaAtual++;
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ResultadoPage(pontos: pontos),
            ),
          );
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var pergunta = perguntas[perguntaAtual];

    return Scaffold(
      backgroundColor: Colors.lightBlue[200],

      appBar: AppBar(title: const Text("Perguntas"), centerTitle: true),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Text(
              pergunta["pergunta"],

              textAlign: TextAlign.center,

              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 30),

            ...(pergunta["respostas"] as List).asMap().entries.map((entry) {
              int index = entry.key;
              var resposta = entry.value;

              Color corBotao = Colors.white;

              if (respostaSelecionada == index) {
                bool correta = resposta["correta"];

                corBotao = correta ? Colors.green : Colors.red;
              }

              return Container(
                width: double.infinity,

                margin: const EdgeInsets.only(bottom: 15),

                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: corBotao,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.all(20),
                  ),

                  onPressed: () {
                    responder(index);
                  },

                  child: Text(
                    resposta["texto"],

                    style: const TextStyle(fontSize: 22),
                  ),
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}

class ResultadoPage extends StatelessWidget {
  final int pontos;

  const ResultadoPage({super.key, required this.pontos});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[200],

      appBar: AppBar(title: const Text("Fim"), centerTitle: true),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Text(
              "Parabéns!\nVocê acertou $pontos questões",

              textAlign: TextAlign.center,

              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 30),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
              ),

              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const InicioPage()),
                  (route) => false,
                );
              },

              child: const Text(
                "Reiniciar",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
