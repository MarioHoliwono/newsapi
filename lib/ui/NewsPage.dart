import 'package:flutter/material.dart';
import 'package:untitled2/data/api/ApiService.dart';
import 'NewsCard.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  final ApiService apiService = ApiService();
  List articles = [];

  String selectedCountry = 'us';
  String selectedCategory = 'business';

  @override
  void initState() {
    super.initState();
    fetchArticles();
  }

  Future<void> fetchArticles() async {
    try {
      final result = await apiService.topHeadlines(selectedCountry, selectedCategory);
      setState(() {
        articles = result.articles;
      });
    } catch (e) {
      print('Error fetching articles: $e');
    }
  }

  void showFilterSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Filter Articles', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 16),

              Row(
                children: [ 
                  Text('Country:'),
                  SizedBox(width: 16),
                  Expanded(
                    child: DropdownButton<String>(
                      value: selectedCountry,
                      items: const [
                        DropdownMenuItem(value: 'ar', child: Text('Argentina')),
                        DropdownMenuItem(value: 'au', child: Text('Australia')),
                        DropdownMenuItem(value: 'at', child: Text('Austria')),
                        DropdownMenuItem(value: 'be', child: Text('Belgium')),
                        DropdownMenuItem(value: 'br', child: Text('Brazil')),
                        DropdownMenuItem(value: 'bg', child: Text('Bulgaria')),
                        DropdownMenuItem(value: 'ca', child: Text('Canada')),
                        DropdownMenuItem(value: 'ch', child: Text('Switzerland')),
                        DropdownMenuItem(value: 'cn', child: Text('China')),
                        DropdownMenuItem(value: 'co', child: Text('Colombia')),
                        DropdownMenuItem(value: 'cu', child: Text('Cuba')),
                        DropdownMenuItem(value: 'cz', child: Text('Czech Republic')),
                        DropdownMenuItem(value: 'de', child: Text('Germany')),
                        DropdownMenuItem(value: 'eg', child: Text('Egypt')),
                        DropdownMenuItem(value: 'fr', child: Text('France')),
                        DropdownMenuItem(value: 'gr', child: Text('Greece')),
                        DropdownMenuItem(value: 'hk', child: Text('Hong Kong')),
                        DropdownMenuItem(value: 'hu', child: Text('Hungary')),
                        DropdownMenuItem(value: 'in', child: Text('India')),
                        DropdownMenuItem(value: 'id', child: Text('Indonesia')),
                        DropdownMenuItem(value: 'ie', child: Text('Ireland')),
                        DropdownMenuItem(value: 'il', child: Text('Israel')),
                        DropdownMenuItem(value: 'it', child: Text('Italy')),
                        DropdownMenuItem(value: 'jp', child: Text('Japan')),
                        DropdownMenuItem(value: 'kr', child: Text('South Korea')),
                        DropdownMenuItem(value: 'lv', child: Text('Latvia')),
                        DropdownMenuItem(value: 'lt', child: Text('Lithuania')),
                        DropdownMenuItem(value: 'my', child: Text('Malaysia')),
                        DropdownMenuItem(value: 'ma', child: Text('Morocco')),
                        DropdownMenuItem(value: 'mx', child: Text('Mexico')),
                        DropdownMenuItem(value: 'ng', child: Text('Nigeria')),
                        DropdownMenuItem(value: 'nl', child: Text('Netherlands')),
                        DropdownMenuItem(value: 'nz', child: Text('New Zealand')),
                        DropdownMenuItem(value: 'no', child: Text('Norway')),
                        DropdownMenuItem(value: 'ph', child: Text('Philippines')),
                        DropdownMenuItem(value: 'pl', child: Text('Poland')),
                        DropdownMenuItem(value: 'pt', child: Text('Portugal')),
                        DropdownMenuItem(value: 'ro', child: Text('Romania')),
                        DropdownMenuItem(value: 'ru', child: Text('Russia')),
                        DropdownMenuItem(value: 'sa', child: Text('Saudi Arabia')),
                        DropdownMenuItem(value: 'rs', child: Text('Serbia')),
                        DropdownMenuItem(value: 'sg', child: Text('Singapore')),
                        DropdownMenuItem(value: 'sk', child: Text('Slovakia')),
                        DropdownMenuItem(value: 'si', child: Text('Slovenia')),
                        DropdownMenuItem(value: 'za', child: Text('South Africa')),
                        DropdownMenuItem(value: 'es', child: Text('Spain')),
                        DropdownMenuItem(value: 'se', child: Text('Sweden')),
                        DropdownMenuItem(value: 'th', child: Text('Thailand')),
                        DropdownMenuItem(value: 'tr', child: Text('Turkey')),
                        DropdownMenuItem(value: 'ua', child: Text('Ukraine')),
                        DropdownMenuItem(value: 'ae', child: Text('United Arab Emirates')),
                        DropdownMenuItem(value: 'gb', child: Text('United Kingdom')),
                        DropdownMenuItem(value: 'us', child: Text('United States')),
                        DropdownMenuItem(value: 've', child: Text('Venezuela')),
                      ],
                      onChanged: (value) {
                        setState(() {
                          selectedCountry = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),

              Row(
                children: [
                  Text('Category:'),
                  SizedBox(width: 16),
                  Expanded(
                    child: DropdownButton<String>(
                      value: selectedCategory,
                      items: const [
                        DropdownMenuItem(value: 'business', child: Text('Business')),
                        DropdownMenuItem(value: 'entertainment', child: Text('Entertainment')),
                        DropdownMenuItem(value: 'general', child: Text('General')),
                        DropdownMenuItem(value: 'health', child: Text('Health')),
                        DropdownMenuItem(value: 'science', child: Text('Science')),
                        DropdownMenuItem(value: 'sports', child: Text('Sports')),
                        DropdownMenuItem(value: 'technology', child: Text('Technology')),
                      ],
                      onChanged: (value) {
                        setState(() {
                          selectedCategory = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),

              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  fetchArticles();
                  Navigator.pop(context);
                },
                child: Text('Apply Filters'),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News API'),
        actions: [
          IconButton(
            icon: Icon(Icons.filter_list_outlined),
            onPressed: showFilterSheet,
          ),
        ],
      ),
      body: articles.isEmpty
          ? const Center(child: Text('No Available News'))
          : ListView.builder(
        itemCount: articles.length,
        itemBuilder: (context, index) {
          final article = articles[index];
          return NewsCard(article: article);
        },
      ),
    );
  }
}
