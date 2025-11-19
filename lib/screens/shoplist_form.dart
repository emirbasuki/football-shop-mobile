import 'package:flutter/material.dart';
// : Impor drawer yang sudah dibuat sebelumnya
import 'package:football_shop/widgets/left_drawer.dart';
import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:football_shop/screens/menu.dart';
import 'package:football_shop/screens/product_entry_list.dart';

class ProductFormPage extends StatefulWidget {
  const ProductFormPage({super.key});

  @override
  State<ProductFormPage> createState() => _ProductFormPageState();
}

class _ProductFormPageState extends State<ProductFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = "";
  String _price = "";
  String _description = "";
  String _category = "shoes"; // default
  String _thumbnail = "";
  bool _isFeatured = false; // default

  final List<String> _categories = [
    'ball',
    'shoes',
    'apparel',
    'glove',
    'pants',
    'accessories',
  ];
  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Form Tambah Produk',
          ),
        ),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      // : Tambahkan drawer yang sudah dibuat di sini
      drawer: const LeftDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[        
              // === Title ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Nama Produk",
                    labelText: "Nama Produk",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _name = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Nama tidak boleh kosong!";
                    }
                    return null;
                  },
                ),
              ),    
              
              // === Price === 
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Harga Produk",
                    labelText: "Harga Produk",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _price = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Harga tidak boleh kosong!";
                    }
                    if (int.tryParse(value) == null) {
                      return "Harga harus berupa angka!";
                    }
                    return null;
                  },
                ),
              ),      

              // === Desription ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText: "Deskripsi Produk",
                    labelText: "Deskripsi Produk",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _description = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Deskripsi berita tidak boleh kosong!";
                    }
                    return null;
                  },
                ),
              ),

              // === Category ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: "Kategori",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  value: _category,
                  items: _categories
                      .map((cat) => DropdownMenuItem(
                            value: cat,
                            child: Text(
                                cat[0].toUpperCase() + cat.substring(1)),
                          ))
                      .toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _category = newValue!;
                    });
                  },
                ),
              ),

              // === Thumbnail URL ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "URL Thumbnail (opsional)",
                    labelText: "URL Thumbnail",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _thumbnail = value!;
                    });
                  },
                  validator: (String? value) {
                    // Thumbnail boleh kosong → tidak error
                    if (value == null || value.isEmpty) {
                      return null;
                    }

                    // Cek apakah format URL valid
                    final uri = Uri.tryParse(value);
                    if (uri == null || !uri.isAbsolute) {
                      return "Masukkan URL yang valid!";
                    }

                    // Cek apakah URL menunjuk ke file gambar
                    const imageExt = ['.jpg', '.jpeg', '.png', '.gif', '.webp'];
                    if (!imageExt.any((ext) => value.toLowerCase().endsWith(ext))) {
                      return "URL harus berupa gambar (.jpg, .png, .jpeg, dll)";
                    }

                    return null;
                  }
                ),
              ),

              // === Is Featured ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SwitchListTile(
                  title: const Text("Tandai sebagai Produk Unggulan"),
                  value: _isFeatured,
                  onChanged: (bool value) {
                    setState(() {
                      _isFeatured = value;
                    });
                  },
                ),
              ),

              // === Tombol Simpan ===
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.indigo),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        // Prepare payload matching backend model keys
                        int? priceInt = int.tryParse(_price);
                        final payload = {
                          'name': _name,
                          'price': priceInt ?? 0,
                          'description': _description,
                          'category': _category,
                          'thumbnail': _thumbnail,
                          'is_featured': _isFeatured,
                        };

                        try {
                          final response = await request.postJson(
                            "http://localhost:8000/create-flutter/",
                            jsonEncode(payload),
                          );

                          if (!context.mounted) return;

                          final success = response != null &&
                              (response['status'] == 'success' || response['status'] == true || response['status'] == 'ok');

                          if (success) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Produk '$_name' berhasil disimpan.")),
                            );

                            // Try to extract created product/user id from response so
                            // we can open My Products filtered to the current user.
                            int? createdUserId;
                            try {
                              if (response is Map) {
                                // common shapes: response['user_id'] or response['created']
                                if (response['user_id'] != null) {
                                  createdUserId = response['user_id'];
                                } else if (response['created'] is Map && response['created']['user_id'] != null) {
                                  createdUserId = response['created']['user_id'];
                                } else if (response['product'] is Map && response['product']['user_id'] != null) {
                                  createdUserId = response['product']['user_id'];
                                }
                              }
                            } catch (_) {}

                            // If we found a user id, open ShopEntryListPage with filter
                            if (createdUserId != null) {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ShopEntryListPage(
                                    onlyMy: true,
                                    currentUserId: createdUserId,
                                  ),
                                ),
                              );
                            } else {
                              // Fallback: go home
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyHomePage()),
                              );
                            }
                          } else {
                            String msg = 'Gagal menyimpan produk.';
                            try {
                              if (response is Map && response['message'] != null) {
                                msg = response['message'];
                              }
                            } catch (_) {}
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(msg)),
                            );
                          }
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Error: $e')),
                          );
                        }
                      }
                    },
                    child: const Text(
                      "Save",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
