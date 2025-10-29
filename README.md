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
