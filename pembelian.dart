import 'dart:io';

void main() {
  Map<String, int> produk = {
    'Mie Instan': 3000,
    'Sabun': 5000,
    'Sikat Gigi': 7000,
    'Shampoo': 10000,
    'Kopi': 6000
  };

  Map<String, int> keranjang = {};

  print('--- SELAMAT DATANG DI TOKO HEMAT ---\n');
  print('Daftar Produk:');
  produk.forEach((nama, harga) {
    print('- $nama: Rp$harga');
  });

  while (true) {
    stdout.write('\nMasukkan nama produk (atau ketik "selesai"): ');
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

  print('\n--- STRUK PEMBAYARAN ---');
  int total = 0;
  int totalItem = 0;

  keranjang.forEach((nama, jumlah) {
    int harga = produk[nama]!;
    int subtotal = harga * jumlah;
    total += subtotal;
    totalItem += jumlah;
    print('$nama x $jumlah = Rp$subtotal');
  });

  double diskon = 0.0;

  if (total >= 50000) {
    diskon += 0.10;
    print('Diskon 10% karena belanja di atas Rp50.000');
  } else if (totalItem > 5) {
    diskon += 0.05;
    print('Diskon 5% karena membeli lebih dari 5 barang');
  }

  double potongan = total * diskon;
  double totalAkhir = total - potongan;

  print('--------------------------');
  print('Total Belanja: Rp$total');
  print('Diskon: Rp${potongan.toInt()}');
  print('Total Bayar: Rp${totalAkhir.toInt()}');
  print('--------------------------');
  print('Terima kasih telah berbelanja!');
}
