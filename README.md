# football_shop

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


## Tugas 7 ##
1. **Jelaskan apa itu widget tree pada Flutter dan bagaimana hubungan parent-child (induk-anak) bekerja antar widget.**
    Widget Tree adalah struktur hierarki yang menggambarkan bagaimana widget saling tersusun dalam aplikasi Flutter. Setiap elemen UI—seperti tombol, teks, kolom, baris, dan lain-lain—adalah widget yang berada dalam sebuah pohon.
        - Parent (Induk) adalah widget yang membungkus widget lain.

        - Child (Anak) adalah widget yang berada di dalam widget parent.
    
    Contoh Sederhana :
        Column(               // Parent
            children: [
                Text("Halo"),     // Child
                ElevatedButton(
                    onPressed: () {},
                    child: Text("Klik"),
                ),
            ],
        )

    Di sini, Column adalah parent, sementara Text dan ElevatedButton adalah child.

2. **Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya.**
    `MaterialApp`       : Menjadi root aplikasi, mengatur tema, judul, dan navigasi.                                        
    `ThemeData`         : Mengatur gaya visual aplikasi (warna, typography, dll).
    `ColorScheme`       : Skema warna untuk tema aplikasi.
    `Scaffold`          : Menyediakan struktur halaman seperti AppBar, body, snackbar.
    `AppBar`            : Membuat bar bagian atas halaman yang menampilkan judul.
    `Text`              : Menampilkan teks di layar.
    `Padding`           : Memberikan jarak (space) di sekitar widget lain.
    `Column`            : Menyusun widget secara vertikal.
    `Row`               : Menyusun widget secara horizontal.
    `SizedBox`          : Memberikan jarak/wadah dengan ukuran tertentu.
    `Center`            : Memposisikan widget ke tengah.
    `GridView.count`    : Menampilkan daftar widget dalam bentuk kotak/grid dengan jumlah kolom tertentu (di sini 3 kolom).
    `Card`              : Membuat tampilan kotak dengan efek bayangan (untuk InfoCard).
    `Container`         : Pembungkus fleksibel untuk padding, ukuran, warna, dll.
    `MediaQuery`        : Mengambil ukuran layar, digunakan agar UI responsif.
    `Icon`              : Menampilkan ikon dengan ukuran dan warna tertentu.
    `Material`          : Memberikan efek *ripple*, warna background, dan bentuk pada widget interaktif.
    `InkWell`           : Memberikan efek klik/tap pada widget.
    `SnackBar`          : Menampilkan pesan notifikasi kecil di bagian bawah layar.
    `ScaffoldMessenger` : Mengelola tampilan SnackBar pada halaman.

    Widget Buatan Sendiri                                                       
    `MyApp`        : Root aplikasi yang memanggil `MaterialApp`.
    `MyHomePage`   : Halaman utama yang menampilkan grid menu dan informasi user.
    `InfoCard`     : Kartu kecil untuk menampilkan data seperti NPM, Nama, Kelas.
    `ItemHomepage` : Objek data yang menyimpan nama, ikon, dan warna untuk item menu. 
    `ItemCard`     : Widget kartu menu yang bisa diklik, menampilkan ikon + teks item.


3. **Apa fungsi dari widget MaterialApp? Jelaskan mengapa widget ini sering digunakan sebagai widget root.**
    MaterialApp berfungsi untuk:
        - Mengaktifkan Material Design (tema visual Android).

        - Menangani navigasi (route).

        - Mengatur tema warna (light/dark mode).

        - Mengatur text direction dan lokalitas.

        - Widget ini sering dijadikan root karena menyediakan “lingkungan dasar” untuk aplikasi, sehingga widget lain dapat menggunakan fitur tema dan navigasi dengan mudah.

4. **Jelaskan perbedaan antara StatelessWidget dan StatefulWidget. Kapan kamu memilih salah satunya?**
    - Pilih StatelessWidget jika UI-nya statis.

    - Pilih StatefulWidget jika UI harus berubah saat pengguna berinteraksi.

5. **Apa itu BuildContext dan mengapa penting di Flutter? Bagaimana penggunaannya di metode build?**
    BuildContext adalah objek yang:
        - Menyimpan informasi posisi widget di dalam widget tree.

        - Digunakan untuk mengakses parent, theme, navigator, dsb.

    Contoh Penggunaan :
        @override
            Widget build(BuildContext context) {
            return Text(
                "Hello",
                style: Theme.of(context).textTheme.headlineLarge,
            );
        }
    
    Di sini, context digunakan untuk mengambil data tema aplikasi.

6. **Jelaskan konsep "hot reload" di Flutter dan bagaimana bedanya dengan "hot restart".**
    - Hot Reload biasanya digunakan saat mengubah UI.

    - Hot Restart dipakai jika kode yang diubah mempengaruhi struktur utama atau state kacau.

7. **Jelaskan bagaimana kamu menambahkan navigasi untuk berpindah antar layar di aplikasi Flutter.**
    Contoh:
        Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HalamanKedua()),
        );

    Untuk kembali:
        Navigator.pop(context);

    Jika ingin menggunakan route yang dinamai:
        Navigator.pushNamed(context, '/halamanKedua');


## Tugas 8 ##
1. Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement() pada Flutter. Dalam kasus apa sebaiknya masing-masing digunakan pada aplikasi Football Shop kamu?
    1. Navigator.push():
        - Menambahkan halaman baru di atas halaman saat ini dalam stack navigasi
        - Memungkinkan pengguna kembali ke halaman sebelumnya dengan tombol back
        - Cocok digunakan saat membuka halaman detail produk dari daftar produk di Football Shop, karena pengguna mungkin ingin kembali ke daftar

    2. Navigator.pushReplacement():
        - Menggantikan halaman saat ini dengan halaman baru dalam stack navigasi
        - Halaman sebelumnya dihapus dari stack, sehingga tidak bisa kembali ke sana
        - Cocok digunakan saat login berhasil menuju homepage Football Shop, karena pengguna tidak perlu kembali ke halaman login

2. Bagaimana kamu memanfaatkan hierarchy widget seperti Scaffold, AppBar, dan Drawer untuk membangun struktur halaman yang konsisten di seluruh aplikasi?
    Di proyek Football Shop, hierarchy widget dimanfaatkan secara konsisten melalui:
    1. Scaffold sebagai struktur dasar:
        return Scaffold(
            appBar: AppBar(...),
            drawer: const LeftDrawer(),
            body: ...
        )

        Digunakan di semua halaman utama (MyHomePage dan ProductFormPage)
        Memberikan layout dasar yang konsisten dengan area untuk AppBar, Drawer, dan konten utama

    2. AppBar untuk navigasi atas:
        appBar: AppBar(
            title: const Text(
                'Football Shop',
                style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                ),
            ),
            backgroundColor: Theme.of(context).colorScheme.primary,
        )

        Konsisten menggunakan warna dari tema aplikasi
        Menampilkan judul halaman dengan style yang seragam

    3. LeftDrawer untuk navigasi global:
        drawer: const LeftDrawer()
        Komponen drawer diekstrak ke widget terpisah (LeftDrawer)
        Memberikan navigasi konsisten ke semua halaman utama:
        Home
        Add Product
        (See Product - dikomentari)

    Keuntungan pendekatan ini:
    Memudahkan navigasi karena menu selalu tersedia
    Tampilan konsisten di seluruh aplikasi
    Kode lebih maintainable karena komponen dapat digunakan ulang

3. Dalam konteks desain antarmuka, apa kelebihan menggunakan layout widget seperti Padding, SingleChildScrollView, dan ListView saat menampilkan elemen-elemen form? Berikan contoh penggunaannya dari aplikasi kamu.
    Di proyek ini, layout widget digunakan secara efektif dalam form (shoplist_form.dart):
    1. SingleChildScrollView:
        body: Form(
            key: _formKey,
            child: SingleChildScrollView(
                child: Column(...)
            )
        )

        Kelebihan:
        Form tetap dapat di-scroll saat keyboard muncul
        Mencegah overflow saat konten melebihi layar
        Mendukung responsivitas di berbagai ukuran layar

    2. Padding:
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(...)
        )

        Kelebihan:
        Memberikan jarak yang konsisten antar elemen form
        Meningkatkan keterbacaan dan estetika form
        Mencegah elemen terlalu rapat dengan tepi layar

    3. ListView (digunakan di drawer):
        ListView(
            children: [
                DrawerHeader(...),
                ListTile(...),
                ListTile(...)
            ]
        )

        Kelebihan:
        Menampilkan daftar item dengan scrolling yang smooth
        Mendukung jumlah item yang dinamis
        Efisien dalam penggunaan memori

4. Bagaimana kamu menyesuaikan warna tema agar aplikasi Football Shop memiliki identitas visual yang konsisten dengan brand toko?
    Di proyek ini, tema diatur di main.dart:
    MaterialApp(
        theme: ThemeData(
            colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
            .copyWith(secondary: Colors.blueAccent[400]),
        ),
        ...
    )

    Warna tema diaplikasikan secara konsisten melalui:
    1. AppBar dan elemen utama:
        backgroundColor: Theme.of(context).colorScheme.primary

        Menggunakan warna primer dari tema
        Konsisten di seluruh aplikasi

    2. Item Cards dengan variasi warna:
        final List<ItemHomepage> items = [
            ItemHomepage("All Products", Icons.inventory, Colors.blue),
            ItemHomepage("My Products", Icons.shopping_bag, Colors.green),
            ItemHomepage("Create Product", Icons.create, Colors.red),
        ];

        Menggunakan variasi warna yang harmonis
        Membantu pengguna membedakan fungsi

    3. Drawer Header:
        decoration: BoxDecoration(
            color: Colors.blue,
        ),

        Menggunakan warna brand yang konsisten
        Memberikan identitas visual yang kuat

    