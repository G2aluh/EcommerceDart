import 'dart:io';
import 'data.dart';

void halamanBelanja() {
  print('\n=== HALAMAN BELANJA ===');
  print('Daftar Produk:');
  produk.forEach((nama, harga) {
    print('- $nama: Rp$harga');
  });

  while (true) {
    stdout.write('\nMasukkan nama produk (atau "selesai"): ');
    String? nama = stdin.readLineSync();

    if (nama == null || nama.toLowerCase() == 'selesai') break;

    if (!produk.containsKey(nama)) {
      print('Produk tidak ditemukan!');
      continue;
    }

    stdout.write('Jumlah: ');
    int? jumlah = int.tryParse(stdin.readLineSync() ?? '');
    if (jumlah == null || jumlah <= 0) {
      print('Jumlah tidak valid!');
      continue;
    }

    keranjang[nama] = (keranjang[nama] ?? 0) + jumlah;
  }

  print('Belanjaan ditambahkan ke keranjang.');
}
