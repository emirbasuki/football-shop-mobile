import 'package:flutter/material.dart';
import 'package:football_shop/models/product_entry.dart';
import 'package:football_shop/widgets/left_drawer.dart';
// import 'package:football_shop/screens/shop_detail.dart';
import 'package:football_shop/widgets/product_entry_card.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:football_shop/screens/product_detail.dart';
import 'package:football_shop/providers/user_provider.dart';

class ShopEntryListPage extends StatefulWidget {
  final bool onlyMy;
  final int? currentUserId;

  const ShopEntryListPage({super.key, this.onlyMy = false, this.currentUserId});

  @override
  State<ShopEntryListPage> createState() => _ProductEntryListPageState();
}

class _ProductEntryListPageState extends State<ShopEntryListPage> {
  Future<List<ProductEntry>> fetchProduct(CookieRequest request) async {
    // TODO: Replace the URL with your app's URL and don't forget to add a trailing slash (/)!
    // To connect Android emulator with Django on localhost, use URL http://10.0.2.2/
    // If you using chrome,  use URL http://localhost:8000
    
    final response = await request.get('http://localhost:8000/json/');
    
    // Decode response to json format
    var data = response;
    
    // Convert json data to ProductEntry objects
    List<ProductEntry> listProduct = [];
    for (var d in data) {
      if (d != null) {
        listProduct.add(ProductEntry.fromJson(d));
      }
    }

    // If this page should show only user's products, try to use provided
    // currentUserId first (caller can pass it). Otherwise attempt to use
    // user id from provider (from login). If we still cannot determine the id,
    // return an empty list (so UI can show a message).
    if (widget.onlyMy) {
      int? uid = widget.currentUserId;
      
      // If not provided by caller, try to get from provider (logged-in user)
      if (uid == null && context.mounted) {
        try {
          final userProvider = context.read<UserProvider>();
          uid = userProvider.userId;
        } catch (_) {}
      }

      if (uid == null) {
        uid = await _getCurrentUserId(request);
      }

      if (uid != null) {
        listProduct = listProduct.where((p) => p.userId == uid).toList();
      } else {
        // Could not determine current user id — return empty list so caller
        // can show a friendly message.
        return [];
      }
    }

    return listProduct;
  }

  Future<int?> _getCurrentUserId(CookieRequest request) async {
    // Try a few common endpoints that might expose the current logged-in user's id.
    final candidates = [
      'http://localhost:8000/auth/get_user/',
      'http://localhost:8000/get_user/',
      'http://localhost:8000/api/get_user/',
      'http://localhost:8000/profile/',
    ];

    for (final url in candidates) {
      try {
        final resp = await request.get(url);
        if (resp != null) {
          if (resp is Map) {
            if (resp['id'] != null) return resp['id'];
            if (resp['user_id'] != null) return resp['user_id'];
            if (resp['pk'] != null) return resp['pk'];
          }
        }
      } catch (e) {
        // ignore and try next
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shop Entry List'),
      ),
      drawer: const LeftDrawer(),
      body: FutureBuilder(
        future: fetchProduct(request),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (!snapshot.hasData) {
              return const Column(
                children: [
                  Text(
                    'There are no product in football shop yet.',
                    style: TextStyle(fontSize: 20, color: Color(0xff59A5D8)),
                  ),
                  SizedBox(height: 8),
                ],
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) => ProductEntryCard(
                  product: snapshot.data![index],
                  onTap: () {
                    // Navigate to Product detail page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailPage(
                          product: snapshot.data![index],
                        ),
                      ),
                    );
                  },
                ),
              );
            }
          }
        },
      ),
    );
  }
}