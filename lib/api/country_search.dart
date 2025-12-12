import 'package:flutter/material.dart';
import 'package:the_food_runner/services/mealdb_service.dart';

class CountrySearchPage extends StatefulWidget {
  const CountrySearchPage({super.key});

  @override
  State<CountrySearchPage> createState() => _CountrySearchPageState();
}

class _CountrySearchPageState extends State<CountrySearchPage> {
  final MealDBService _service = MealDBService();
  List<String> _areas = [];
  List<String> _filtered = [];
  bool _loading = true;
  String _query = '';

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    try {
      final areas = await _service.fetchAreas();
      setState(() {
        _areas = areas;
        _filtered = areas;
        _loading = false;
      });
    } catch (e) {
      setState(() {
        _loading = false;
      });
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to load countries: $e')),
      );
    }
  }

  void _onSearchChanged(String value) {
    setState(() {
      _query = value.trim().toLowerCase();
      _filtered = _areas
          .where((a) => a.toLowerCase().contains(_query))
          .toList(growable: false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Search by Country/Area')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Search countries/cuisines (e.g., Canadian)',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: _onSearchChanged,
            ),
          ),
          Expanded(
            child: _loading
                ? const Center(child: CircularProgressIndicator())
                : ListView.separated(
                    itemCount: _filtered.length,
                    separatorBuilder: (_, __) => const Divider(height: 1),
                    itemBuilder: (context, index) {
                      final area = _filtered[index];
                      return ListTile(
                        title: Text(area),
                        trailing: const Icon(Icons.chevron_right),
                        onTap: () async {
                          // Example: fetch meals by selected area
                          final meals = await _service.fetchMealsByArea(area);
                          if (!mounted) return;
                          showModalBottomSheet(
                            context: context,
                            builder: (_) => SizedBox(
                              height: 400,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Text('Meals in $area', style: const TextStyle(fontWeight: FontWeight.bold)),
                                  ),
                                  Expanded(
                                    child: ListView.builder(
                                      itemCount: meals.length,
                                      itemBuilder: (context, i) {
                                        final m = meals[i];
                                        return ListTile(
                                          leading: CircleAvatar(
                                            backgroundImage: NetworkImage(m['strMealThumb'] ?? ''),
                                          ),
                                          title: Text(m['strMeal'] ?? ''),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
