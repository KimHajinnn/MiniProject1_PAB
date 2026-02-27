# Mini Project 1 PAB

- Nama : Christian Amsal Asimaro Lumban Tobing
- NIM  : 2409116053

# Deskripsi Aplikasi
Aplikasi Data Tempat Makan di Samarinda merupakan aplikasi berbasis Flutter yang dirancang untuk membantu pengguna dalam mengelola dan mencatat informasi tempat makan yang ada di wilayah Samarinda.

Aplikasi ini memungkinkan pengguna untuk menambahkan serta mengedit data tempat makan secara sederhana melalui antarmuka yang interaktif dan mudah digunakan. Data yang dikelola dapat berupa nama tempat makan, alamat, jenis makanan, rating, maupun informasi tambahan lainnya sesuai kebutuhan. Dengan tujuan untuk membantu pencatatan dan pengelolaan data kuliner di Samarinda.

# Fitur Aplikasi
## 1. Menampilkan Daftar Tempat Makan di Samarinda
- Menampilkan data tempat makan dalam bentuk list.
- Setiap item menampilkan informasi seperti nama dan detail lainnya.

## 2. Menambahkan Data Tempat Makan
- User dapat menekan tombol tambah yang mengarah ke halaman form.
- Setelah data disimpan, list akan otomatis diperbarui.

## 3. Mengedit Data Tempat Makan (Nilai Tambah)
- User dapat memilih data yang ingin diubah pada tampilan daftar tempat makan.\
- Setelah ubah dan disimpan, data akan diperbarui pada daftar.

## 4. Menghapus Data Tempat Makan
- User dapat menghapus data tempat makan pada logo tempat sampah di tampilan daftar tempat makan
- setelah dihapus, data akan otomatis terhapus dari daftar.

## 5. Validasi Input
- Form memiliki validasi agar input tidak kosong.
- Mencegah penyimpanan data yang tidak valid.

# Widget yang Digunakan
Berikut adalah beberapa widget utama yang digunakan dalam aplikasi ini:
## 1. MaterialApp
Digunakan sebagai root aplikasi untuk mengatur tema dan navigasi dasar.
## 2. Scaffold
Sebagai struktur dasar halaman yang menyediakan :
- AppBar
- Body
- FloatingActionButton
## 3. . AppBar
Menampilkan judul halaman di bagian atas.
## 4. . ListView
Menampilkan daftar data tempat makan secara dinamis.
## 5. ListTile
Digunakan untuk menampilkan setiap item tempat makan di dalam list.
## 6. FloatingActionButton
Tombol untuk menambahkan data baru.
## 7. Navigator (Nilai Tambah)
Digunakan untuk berpindah halaman dari HomePage ke FormPage.
## 8. Form
Digunakan untuk membungkus input dan melakukan validasi.
## 9. TextFormField
Digunakan untuk input data seperti nama, alamat, dll.
## 10. TextEditingController
Mengontrol dan mengambil nilai dari input field.
## 11. ElevatedButton
Digunakan sebagai tombol simpan pada halaman form.
## 12. StatefulWidget
Digunakan pada:
- HomePage (Karena data dapat berubah).
- FormPage (Karena adanya input dan validasi).


# Dokumentasi Output
- ## Tampilan Awal
<img width="1919" height="970" alt="image" src="https://github.com/user-attachments/assets/93b1790a-b0cd-41b9-aa4b-ec9f159d0d76" />


- ## Tampilan Tambah daftar
<img width="1919" height="970" alt="image" src="https://github.com/user-attachments/assets/d7e49609-8936-4300-9ad4-9f6c8688b5ee" />


- ## Tampilan Edit Daftar
<img width="1919" height="968" alt="image" src="https://github.com/user-attachments/assets/32143a59-64d9-4598-be3c-d7ec630e23f1" />


- ## Tampilan Setelah Menghapus 1 Daftar
<img width="1919" height="971" alt="image" src="https://github.com/user-attachments/assets/0b974f0a-c60d-40de-a83c-cd0fa36c916e" />


