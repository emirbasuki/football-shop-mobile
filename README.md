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

## Tugas 9 ##
1. Jelaskan mengapa kita perlu membuat model Dart saat mengambil/mengirim data JSON? Apa konsekuensinya jika langsung memetakan Map<String, dynamic> tanpa model (terkait validasi tipe, null-safety, maintainability)?
    Alasan membuat model Dart (class)
    Ketika berkomunikasi dengan backend (Django), data dikirim dalam format JSON. Jika di Flutter hanya menggunakan: Map<String, dynamic>
    tanpa model, maka konsekuensinya besar, terutama terkait:
        a. Validasi tipe data (type-safety)
            Jika tidak membuat model:
            - Tidak tahu apakah field yang datang sesuai tipe (String? Number? Null?).
            - Raw JSON bisa menyebabkan bug runtime, misalnya: title.length  // padahal title null atau bukan String
            Model Dart membuat struktur data ketat, contoh:
            class Product {
                final String name;
                final int price;

                Product({required this.name, required this.price});

                factory Product.fromJson(Map<String, dynamic> json) => Product(
                    name: json['name'],
                    price: json['price'],
                );
            }
            Tipe akan dicek oleh compiler.
        b. Null-safety
            Tanpa model:
                - Harus manual cek null di banyak tempat.
                - Raw map sering menimbulkan error seperti:
                    - NoSuchMethodError
                    - null is not a subtype of ...
            Dengan model:
                Tahu field mana yang required, mana yang nullable.
        c. Maintainability
            Jika API berubah:
                - Dengan raw map: harus cari seluruh kode yang pakai map tersebut.
                - Dengan model: cukup ubah class model.
            Lebih mudah dibaca:
                Daripada data['price'], cukup product.price.
    Kesimpulan
        Model Dart memberikan:
            - Type safety
            - Null-safety
            - Maintainability
            - Efisiensi dan mengurangi bug

2. Apa fungsi package http dan CookieRequest dalam tugas ini? Jelaskan perbedaan peran http vs CookieRequest.
    Package http dan CookieRequest memiliki peran berbeda dalam komunikasi dengan backend:
    
    a. Package http
        - Library dasar HTTP client di Flutter
        - Fungsi: Melakukan raw HTTP requests (GET, POST, PUT, DELETE, dll)
        - Karakteristik:
            * Tidak mengelola cookies secara otomatis
            * Harus manual handling CSRF token
            * Cocok untuk API stateless (REST API dengan token)
        - Contoh penggunaan:
            var response = await http.post(
                Uri.parse('https://api.example.com/login'),
                body: {'username': 'user', 'password': 'pass'}
            );
    
    b. CookieRequest (dari pbp_django_auth)
        - Wrapper di atas http client yang dirancang khusus untuk Django
        - Fungsi: Mengelola session cookies dan CSRF tokens otomatis
        - Karakteristik:
            * Otomatis menyimpan dan mengirim session cookies
            * Otomatis menangani CSRF token dari Django
            * Cocok untuk API berbasis session (Django dengan CORS)
        - Contoh penggunaan:
            var response = await request.postJson(
                'http://localhost:8000/api/login/',
                jsonBody: {'username': 'user', 'password': 'pass'}
            );
            // Cookies otomatis tersimpan dan dikirim ke request berikutnya
    
    c. Perbedaan Peran (Tabel Perbandingan)
    
    | Aspek | http | CookieRequest |
    |-------|------|---------------|
    | Level Abstraksi | Low-level (raw HTTP) | High-level (Django-specific) |
    | Manajemen Cookie | Manual | Otomatis |
    | Manajemen CSRF | Manual | Otomatis |
    | Session Handling | Tidak support | Support (Django session) |
    | Use Case | REST API dengan token | Django dengan session auth |
    | Kompleksitas | Lebih kompleks | Lebih sederhana |
    | Konfigurasi | Minimal | Sudah configured untuk Django |
    
    d. Mengapa Django Football Shop pakai CookieRequest?
        - Django menggunakan session-based authentication
        - Django otomatis mengirim CSRF token dalam response
        - CookieRequest otomatis handle semua ini
        - Tidak perlu manual configure CSRF atau cookie persistence
        - Hasil: Implementasi login/logout lebih sederhana dan reliable

3. Jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.
    Instance CookieRequest harus dibagikan ke semua komponen di aplikasi Flutter karena:
    
    a. Persistensi Session Cookie
        - Setelah login, Django mengirim session cookie ke Flutter
        - Session cookie ini harus dikirim ke SETIAP request selanjutnya
        - Jika setiap komponen punya CookieRequest instance sendiri:
            * Instance baru tidak tahu tentang login sebelumnya
            * Cookie tidak tersimpan antar instance
            * Setiap request dianggap sebagai pengguna baru
        - Contoh masalah:
            CookieRequest request1 = CookieRequest();
            request1.login(); // Simpan cookie di request1
            
            CookieRequest request2 = CookieRequest();
            request2.getData(); // request2 tidak tahu tentang login! Data tidak bisa diambil
    
    b. Konsistensi State Otentikasi
        - Hanya ada 1 pengguna login per session
        - State login harus sama di semua layar
        - Jika instance berbeda:
            * Layar A mungkin tahu user sudah login
            * Layar B mungkin belum tahu (cookie tidak tersimpan)
            * Inconsistency dan bug!
    
    c. Efisiensi Resource
        - Satu instance = satu TCP connection yang reusable
        - Instance berbeda = multiple connections (memboros resource)
        - Shared instance lebih efisien
    
    d. Solusi: Provider Pattern
        Di main.dart kita setup:
        
            MultiProvider(
                providers: [
                    Provider<CookieRequest>(
                        create: (_) => CookieRequest(),
                    ),
                ],
                ...
            )
        
        Hasil:
            - Aplikasi punya 1 CookieRequest instance
            - Semua layar akses via: context.read<CookieRequest>()
            - Session cookie tetap konsisten
            - Login state sinkron di semua tempat
    
    e. Analogi Sederhana
        - Anggap CookieRequest adalah "Kartu Identitas Digital"
        - Setelah login, backend memberi badge ke kartu ini
        - Jika setiap orang punya kartu sendiri:
            * Login dengan kartu 1 → dapat badge di kartu 1
            * Akses layanan dengan kartu 2 → kartu 2 tidak punya badge!
            * Layanan tolak (harus login lagi)
        - Solusi: Semua orang pakai 1 kartu yang sama → 1 login, semua akses granted

4. Jelaskan konfigurasi konektivitas yang diperlukan agar Flutter dapat berkomunikasi dengan Django. Mengapa kita perlu menambahkan 10.0.2.2 pada ALLOWED_HOSTS, mengaktifkan CORS dan pengaturan SameSite/cookie, dan menambahkan izin akses internet di Android? Apa yang akan terjadi jika konfigurasi tersebut tidak dilakukan dengan benar?
    a. Menambahkan 10.0.2.2 pada ALLOWED_HOSTS
        Karena:
            - Pada Android emulator, localhost Flutter bukan localhost Django.
            - Emulator memakai alamat khusus:
            10.0.2.2 → mengarah ke localhost komputer host
        Tanpa ini Django akan memberi error DisallowedHost.
    b. Mengaktifkan CORS
        Django memblok request dari domain lain secara default.
        Flutter dianggap domain berbeda, jadi:
            Perlu CORS_ALLOW_ALL_ORIGINS = True atau whitelist domain.
        Tanpa ini:
            - Flutter tidak bisa mengambil data
            - Error CORS policy / 403
    c. Mengatur cookie SameSite & CSRF
        Untuk login berbasis session:
            - Flutter tidak dianggap “browser”
            - Cookie default Django mungkin tidak dikirim
        Harus atur:
            SESSION_COOKIE_SAMESITE = "None"
            SESSION_COOKIE_SECURE = True
            CSRF_COOKIE_SAMESITE = "None"
            CSRF_COOKIE_SECURE = True
        Jika tidak:
            - Cookie session tidak tersimpan
            - Login selalu gagal
    d. Menambah izin Internet di AndroidManifes
        Flutter tidak bisa akses internet tanpa izin: <uses-permission android:name="android.permission.INTERNET" />
        Tanpa ini, request tidak berjalan sama sekali.

5. Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter.
    Mekanisme pengiriman data dari input user hingga ditampilkan di Flutter melibatkan beberapa tahap:
    
    a. Tahap 1: Input Data di Flutter (UI Layer)
        User menginput data di ProductFormPage form fields
    
    b. Tahap 2: Validasi Form (Client-side)
        Sebelum dikirim, Flutter validasi data
    
    c. Tahap 3: Konversi ke JSON (Serialization)
        Data form dikonversi ke Map/JSON yang sesuai format API
    
    d. Tahap 4: HTTP Request ke Backend
        Flutter kirim data via HTTP POST menggunakan CookieRequest
    
    e. Tahap 5: Network Transmission
        Data dikirim via HTTP ke server Django di 10.0.2.2:8000
    
    f. Tahap 6: Backend Processing (Django)
        Django menerima request dan process data
    
    g. Tahap 7: Response dari Backend
        Django kirim response JSON kembali ke Flutter
    
    h. Tahap 8: Parsing Response (Deserialization)
        Flutter parse JSON response
    
    i. Tahap 9: Update UI dengan Data Baru
        ShopEntryListPage diisi dengan ProductEntry dari endpoint

6. Jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.
    Mekanisme autentikasi Football Shop (Register → Login → Authenticated Session → Logout):
    
    A. REGISTER (Pendaftaran Akun Baru)
        a. User input data di RegisterPage (username, email, password)
        b. Flutter validasi input
        c. Flutter send register request ke /auth/register/
        d. Django backend process dan create User object
        e. Flutter navigate ke LoginPage
    
    B. LOGIN (Autentikasi & Session Creation)
        a. User input credentials di LoginPage
        b. Flutter send login request ke /auth/login/
        c. Django backend authenticate credentials
        d. Jika match: create session, return user id dan Set-Cookie
        e. CookieRequest store sessionid cookie automatically
        f. Flutter extract userId dan save ke UserProvider
        g. Flutter navigate ke MyHomePage
    
    C. AUTHENTICATED SESSION
        Setelah login: user bisa akses protected endpoints
        - Ambil daftar produk
        - Buat produk baru (associated dengan userId)
        - Filter "My Products" menggunakan UserProvider.userId
    
    D. LOGOUT
        a. User tap "Logout" button
        b. Flutter send logout request
        c. Django delete session dari database
        d. Flutter clear UserProvider dan navigate ke LoginPage

7. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).
    Implementasi Football Shop mengikuti checklist berikut secara detail:
    
    1. Memastikan deployment proyek tugas Django kamu telah berjalan dengan baik.
        - Create Django project: python manage.py startproject football_shop_backend
        - Create app: python manage.py startapp api
        - Configure settings.py:
            * Add 'api' dan 'corsheaders' ke INSTALLED_APPS
            * Add CorsMiddleware ke MIDDLEWARE
            * Set ALLOWED_HOSTS = ['localhost', '127.0.0.1', '10.0.2.2']
            * Configure CORS: CORS_ALLOWED_ORIGINS = ['http://10.0.2.2:8000']
            * Set SESSION_COOKIE_SAMESITE = "None" dan SESSION_COOKIE_SECURE = False
        - Run migrations: python manage.py migrate
        - Test server: python manage.py runserver
        - Verify Django berjalan di http://localhost:8000/
    
    2. Mengimplementasikan fitur registrasi akun pada proyek tugas Flutter.
        - Create RegisterPage di lib/screens/register.dart
        - Buat form dengan fields: username, email, password, confirm password
        - Implementasi validasi:
            * Username tidak kosong
            * Email format valid
            * Password minimal 8 karakter
            * Password dan confirm password harus sama
        - Implementasi fungsi register:
            var response = await request.postJson(
                'http://10.0.2.2:8000/auth/register/',
                jsonBody: {
                    'username': _username,
                    'email': _email,
                    'password1': _password,
                    'password2': _confPassword,
                }
            );
        - Handle response: jika success → navigate ke LoginPage, jika error → show error message
    
    3. Membuat halaman login pada proyek tugas Flutter.
        - Create LoginPage di lib/screens/login.dart
        - Buat form dengan fields: username, password
        - Implementasi validasi: username dan password tidak kosong
        - Implementasi fungsi login:
            var response = await request.login(
                'http://10.0.2.2:8000/auth/login/',
                {
                    'username': _username,
                    'password': _password,
                }
            );
        - CookieRequest otomatis simpan session cookie
        - Jika login berhasil: navigate ke MyHomePage
        - Jika gagal: show error message
    
    4. Mengintegrasikan sistem autentikasi Django dengan proyek tugas Flutter.
        - Create UserProvider di lib/providers/user_provider.dart:
            class UserProvider extends ChangeNotifier {
                int? _userId;
                String? _username;
                
                void setUser(int? id, String? name) {
                    _userId = id;
                    _username = name;
                    notifyListeners();
                }
                
                void logout() {
                    _userId = null;
                    _username = null;
                    notifyListeners();
                }
            }
        - Setup MultiProvider di main.dart:
            MultiProvider(
                providers: [
                    Provider<CookieRequest>(create: (_) => CookieRequest()),
                    ChangeNotifierProvider<UserProvider>(create: (_) => UserProvider()),
                ],
                child: MaterialApp(...)
            )
        - Extract userId dari login response dan save ke UserProvider:
            int userId = response['id'] ?? response['user_id'];
            context.read<UserProvider>().setUser(userId, _username);
        - Semua screen dapat akses via: context.read<UserProvider>().userId
    
    5. Membuat model kustom sesuai dengan proyek aplikasi Django.
        - Create ProductEntry model di lib/models/product_entry.dart
        - Fields yang match dengan Django:
            * id, name, price, description, category
            * thumbnail, is_featured, user_id
            * created_at, product_views (jika ada)
        - Implementasi factory fromJson:
            factory ProductEntry.fromJson(Map<String, dynamic> json) => ProductEntry(
                id: json['id'],
                name: json['name'],
                price: json['price'],
                description: json['description'],
                category: json['category'],
                thumbnail: json['thumbnail'],
                isFeatured: json['is_featured'] ?? false,
                userId: json['user_id'],
                createdAt: DateTime.parse(json['created_at']),
                productViews: json['product_views'] ?? 0,
            );
        - Implementasi null-safety dan type-checking untuk setiap field
    
    6. Membuat halaman yang berisi daftar semua item yang terdapat pada endpoint JSON di Django yang telah kamu deploy.
        - Create ShopEntryListPage di lib/screens/product_entry_list.dart
        - Implementasi GET request ke endpoint:
            var response = await request.get(
                'http://10.0.2.2:8000/api/products/json/'
            );
        - Parse response menjadi List<ProductEntry>:
            List<ProductEntry> products = (response as List)
                .map((p) => ProductEntry.fromJson(p))
                .toList();
        - Display products menggunakan GridView atau ListView
    
    7. Tampilkan name, price, description, thumbnail, category, dan is_featured dari masing-masing item pada halaman ini.
        - Create ProductEntryCard widget di lib/widgets/product_entry_card.dart
        - Widget menampilkan:
            * Thumbnail image (di atas)
            * Name sebagai judul (bold, ukuran besar)
            * Price dalam format currency
            * Category sebagai badge/tag
            * is_featured badge (jika true)
            * Description singkat (truncated)
        - Implementasi:
            Card(
                child: Column(
                    children: [
                        Image.network(product.thumbnail),
                        Text(product.name, style: bold),
                        Text('Rp ${product.price}'),
                        Text(product.category),
                        if (product.isFeatured)
                            Container(child: Text('Featured')),
                        Text(product.description),
                    ]
                )
            )
    
    8. Membuat halaman detail untuk setiap item yang terdapat pada halaman daftar Item.
        - Create ProductDetailPage di lib/screens/product_detail.dart
        - Receive ProductEntry object via Navigator argument:
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProductDetailPage(product: product),
                )
            );
        - Halaman detail dapat diakses dengan menekan salah satu card item
    
    9. Halaman ini dapat diakses dengan menekan salah satu card item pada halaman daftar Item.
        - Implementasi onTap di ProductEntryCard:
            GestureDetector(
                onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProductDetailPage(product: product),
                        )
                    );
                },
                child: Card(...)
            )
        - User dapat tap card → navigasi ke detail page
    
    10. Tampilkan seluruh atribut pada model item kamu pada halaman ini.
        - Di ProductDetailPage, display semua field:
            * Thumbnail image (full width, 250px height)
            * Name (judul besar, bold)
            * Price (format currency, ukuran besar)
            * Category (badge dengan warna)
            * is_featured badge (jika true)
            * Description (full text, justified)
            * created_at (tanggal dan waktu format)
            * user_id (optional, untuk admin view)
            * product_views (view counter, jika ada)
        - Layout menggunakan SingleChildScrollView agar scrollable
    
    11. Tambahkan tombol untuk kembali ke halaman daftar item.
        - Implementasi AppBar dengan built-in back button:
            AppBar(
                title: Text('Product Detail'),
                backgroundColor: Colors.indigo,
                leading: IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () => Navigator.pop(context),
                ),
            )
        - Flutter otomatis provide back button di AppBar
        - User dapat tap back → Navigator.pop() → kembali ke list
        - Alternatif: Add explicit button di body
    
    12. Melakukan filter pada halaman daftar item dengan hanya menampilkan item yang terasosiasi dengan pengguna yang login.
        - Create "My Products" feature dengan parameter onlyMy di ShopEntryListPage:
            ShopEntryListPage({
                this.onlyMy = false,
                this.currentUserId,
            });
        - Implementasi filtering logic:
            if (widget.onlyMy == true) {
                int? userId = widget.currentUserId ?? 
                    context.read<UserProvider>().userId;
                
                if (userId != null) {
                    products = products
                        .where((p) => p.userId == userId)
                        .toList();
                } else {
                    products = [];
                }
            }
        - Navigation ke My Products:
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ShopEntryListPage(onlyMy: true),
                )
            );
        - UserProvider.userId dari login response digunakan sebagai filter key
        - Hanya show produk dimana product.userId == currentUserId
        - Empty list jika user belum login atau tidak ada produk milik user
    
    Kesimpulan Implementasi
    ━━━━━━━━━━━━━━━━━━━━━
    
    Football Shop diimplementasikan dengan flow:
    1. Django backend siap dengan API endpoints
    2. Flutter Register → User dapat membuat akun
    3. Flutter Login → Session tersimpan via CookieRequest
    4. UserProvider store userId global
    5. Get All Products → Fetch dari /api/products/json/
    6. Display dengan ProductEntryCard (show semua field)
    7. Tap card → ProductDetailPage (show detail lengkap)
    8. Back button → kembali ke list
    9. My Products → Filter by userId dari UserProvider
    
    Hasil: Full-stack app dengan auth, CRUD products, filtering, dan detail view!