# 👩🏻‍💻 Tugas 3 - Carissa Almira Yudiva (2106751676) 👩🏻‍💻


## Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget dan jelaskan perbedaan dari keduanya.

<img width="552" alt="Screenshot 2022-11-09 at 16 44 21" src="https://user-images.githubusercontent.com/112609904/200796530-545c6575-dae5-4d3b-b493-b9f5d0b9de69.png">

### Stateless Widget
Widget statis yang tidak dapat dirubah atau tidak akan pernah berubah. 

### Stateful Widget
Widget yang dinamis atau dapat berubah. Stateful widget dapat mengupdate tampilan, merubah warna, menambah jumlah bariis, dll. 

Yang membedakan antara Stateless dan Stateful ialah pada Stateful terdapat Internal State (pemrosesan state atau keadaan baru yang dipicu dari adanya penambahan atau perubahan data). 

## Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.

* `Icon()` : memberikan ikon pada sebuah widget
* `FloatingActionButton()`: menampilkan button floating
* `Text()`: menampilkan text dan memberikan style pada text
* `Row()`: semua widget yang ada di dalam akan ditampilkan secara horizontal
* `Column()`: semua widget yang ada di dalam akan ditampilkan secara vertikal
* `Center()`: semua widget yang ada di dalam akan diletakkan di bagian tengah
* `AppBar()`: judul sebuah aplikasi atau halaman
* `Scaffold`: landasan halaman

## Apa fungsi dari `setState()?` Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.

Fungsi `setState()` bertugas untuk memberitahu framework bahwa ada object yang berubah pada State, kemudian akan melakukan build ulang pada widget tersebut. Variabel yang terdampak dengan fungsi ini dalam program saya adalah variabel `_counter`.

## Jelaskan perbedaan antara `const` dengan `final`.

### Final
Variabel yang menggunakan keyword final diinialisasi pada saat pertama kali digunakan dan hanya disetel sekali. Dapat digunakan untuk deklarasi variabel immutable yang nilainya sudah ataupun belum diketahui pada saat waktu kompilasi berjalan. 
### Const
Const dapat digunakan untuk deklarasi variabel immutable yang nilainya bersifat konstan dan harus sudah diketahui pada saat waktu kompilasi berjalan. 

Perbedaan utama ada pada inialisasi nilai (pemberian nilai) dari variabelnya, `const` mengharuskan variabel harus dinialisasi pada saat kompilasi, nilai bersifat konstan dan secara langsung / eksplisit sehingga pada saat kompilasi variabel `const` sudah memiliki nilai, sedangkan `final` tidak mengharuskan variabel memiliki nilai secara langsung / eskplisit pada saat kompilasi.

## Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas.
* Melakukan styling di background dan primarySwatch
* Membuat condition if-else berdasarkan nilai `_counter` (genap dan ganjil)
* Membuat fungsi `_decrementCounter()` (kebalikan dari increment)
* Membuat widget `FloatingActionButton()` baru untuk decrement counter

# Thank You! 👩🏻‍💻
