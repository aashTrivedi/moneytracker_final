import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:moneytracker/ui/screens/settings_screen/settings_screen.dart';





class Product extends StatefulWidget {
  const Product({Key? key}) : super(key: key);
  static const routeName = '/';

  @override
  State<Product> createState() => _ProductState();
} 

class _ProductState extends State<Product> {
  List<dynamic> products = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    setState(() {
      isLoading = true;
    });
    try {
      final response = await http.get(Uri.parse('https://fakestoreapi.com/products'));
      if (response.statusCode == 200) {
        setState(() {
          products = jsonDecode(response.body);
        });
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Error fetching data: $e');
      // Handle error gracefully, e.g., show a snack bar or error dialog
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fake api demo'),
        leading: IconButton(
          onPressed: () {
          
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>SettingsScreen (),
                          ),
                        );
                    
          },
          icon: Icon(Icons.arrow_back, color: Colors.black),
        ),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : products.isEmpty
              ? Center(child: Text('No data available'))
              : ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (BuildContext context, int index) {
                    final product = products[index];
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(product['image']),
                      ),
                      title: Text(product['title']),
                      subtitle: Text('\$${product['price']}'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailScreen(product: product),
                          ),
                        );
                      },
                    );
                  },
                ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final dynamic product;

  DetailScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: Colors.black),
        ),
        title: Text(product['title']),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              product['image'],
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20),
            Text(
              'Price: \$${product['price']}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Description: ${product['description']}',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
