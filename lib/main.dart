import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Academia Treino',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<TrainingItem> _trainings = [
    TrainingItem(
      title: 'Peito e tríceps',
      description: '3 séries de 10 repetições',
      date: 'Segunda',
      completed: false,
    ),
    TrainingItem(
      title: 'Costas e bíceps',
      description: '4 séries de 12 repetições',
      date: 'Quarta',
      completed: true,
    ),
  ];

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _detailsController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  void _addTraining() {
    final title = _titleController.text.trim();
    if (title.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Informe o nome do treino.')),
      );
      return;
    }

    setState(() {
      _trainings.insert(
        0,
        TrainingItem(
          title: title,
          description: _detailsController.text.trim().isEmpty
              ? 'Treino adicionado para hoje'
              : _detailsController.text.trim(),
          date: _dateController.text.trim().isEmpty
              ? 'Hoje'
              : _dateController.text.trim(),
          completed: false,
        ),
      );
      _titleController.clear();
      _detailsController.clear();
      _dateController.clear();
    });
  }

  void _toggleTraining(TrainingItem item) {
    setState(() {
      item.completed = !item.completed;
    });
  }

  void _removeTraining(TrainingItem item) {
    setState(() {
      _trainings.remove(item);
    });
  }

  @override
  void dispose() {
    _titleController.dispose();
    _detailsController.dispose();
    _dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final completedCount = _trainings.where((item) => item.completed).length;
    final pendingCount = _trainings.length - completedCount;

    return Scaffold(
      appBar: AppBar(title: const Text('Marca de treinos'), centerTitle: true),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0F172A), Color(0xFF1E293B)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  color: Colors.white.withOpacity(0.95),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Planeje seus treinos',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Você tem $pendingCount treinos pendentes e $completedCount concluídos.',
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: _ResumoChip(
                                title: 'Pendentes',
                                value: '$pendingCount',
                                color: Colors.orange,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: _ResumoChip(
                                title: 'Concluídos',
                                value: '$completedCount',
                                color: Colors.green,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Card(
                  color: Colors.white.withOpacity(0.95),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Adicionar novo treino',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 12),
                        TextField(
                          controller: _titleController,
                          decoration: const InputDecoration(
                            labelText: 'Nome do treino',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 12),
                        TextField(
                          controller: _detailsController,
                          maxLines: 2,
                          decoration: const InputDecoration(
                            labelText: 'Detalhes',
                            hintText: 'Ex.: 3 séries de 12 repetições',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 12),
                        TextField(
                          controller: _dateController,
                          decoration: const InputDecoration(
                            labelText: 'Dia / data',
                            hintText: 'Ex.: Terça-feira',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Align(
                          alignment: Alignment.centerRight,
                          child: ElevatedButton.icon(
                            onPressed: _addTraining,
                            icon: const Icon(Icons.add),
                            label: const Text('Salvar treino'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Treinos da semana',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 10),
                if (_trainings.isEmpty)
                  const Text(
                    'Nenhum treino cadastrado ainda.',
                    style: TextStyle(color: Colors.white70),
                  )
                else
                  Column(
                    children: _trainings
                        .map(
                          (item) => Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: Card(
                              color: Colors.white.withOpacity(0.96),
                              child: ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: item.completed
                                      ? Colors.green.shade100
                                      : Colors.orange.shade100,
                                  child: Icon(
                                    item.completed
                                        ? Icons.check_circle
                                        : Icons.fitness_center,
                                    color: item.completed
                                        ? Colors.green
                                        : Colors.orange,
                                  ),
                                ),
                                title: Text(
                                  item.title,
                                  style: TextStyle(
                                    decoration: item.completed
                                        ? TextDecoration.lineThrough
                                        : null,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(item.description),
                                    Text(
                                      'Dia: ${item.date}',
                                      style: const TextStyle(fontSize: 12),
                                    ),
                                  ],
                                ),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      tooltip: item.completed
                                          ? 'Marcar como pendente'
                                          : 'Marcar como concluído',
                                      onPressed: () => _toggleTraining(item),
                                      icon: Icon(
                                        item.completed
                                            ? Icons.undo
                                            : Icons.check,
                                        color: item.completed
                                            ? Colors.orange
                                            : Colors.green,
                                      ),
                                    ),
                                    IconButton(
                                      tooltip: 'Remover',
                                      onPressed: () => _removeTraining(item),
                                      icon: const Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ResumoChip extends StatelessWidget {
  const _ResumoChip({
    required this.title,
    required this.value,
    required this.color,
  });

  final String title;
  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.12),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontSize: 14)),
          const SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}

class TrainingItem {
  TrainingItem({
    required this.title,
    required this.description,
    required this.date,
    required this.completed,
  });

  final String title;
  final String description;
  final String date;
  bool completed;
}
