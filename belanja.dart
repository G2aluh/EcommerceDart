import 'dart:io';
import 'data.dart';

void halamanBelanja() {
  print('\n=== HALAMAN BELANJA ===');

  // Buat daftar produk dengan label huruf
  List<String> daftarNama = produk.keys.toList();
  for (int i = 0; i < daftarNama.length; i++) {
    String huruf = String.fromCharCode(97 + i); // 97 = 'a'
    String nama = daftarNama[i];
    int harga = produk[nama]!;
    print('$huruf. $nama ${formatRupiah(harga)}');
    
  }
  print('');
  print('Jika total belanja di atas Rp50.000, akan mendapatkan diskon 10%');

  while (true) {
    stdout.write('\nPilih produk atau "selesai": ');
    String? pilihan = stdin.readLineSync();

    if (pilihan == null || pilihan.toLowerCase() == 'selesai') break;

    int index = pilihan.toLowerCase().codeUnitAt(0) - 97;

    if (index < 0 || index >= daftarNama.length) {
      print('Pilihan tidak valid!');
      continue;
    }

    String namaProduk = daftarNama[index];

    stdout.write('Jumlah: ');
    int? jumlah = int.tryParse(stdin.readLineSync() ?? '');
    if (jumlah == null || jumlah <= 0) {
      print('Jumlah tidak valid!');
      continue;
    }

    keranjang[namaProduk] = (keranjang[namaProduk] ?? 0) + jumlah;
    print('$namaProduk x$jumlah ditambahkan ke keranjang.');
  }
}
