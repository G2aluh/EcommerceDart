import 'data.dart';

void halamanCheckout() {
  print('\n=== STRUK CHECKOUT ===');
  if (keranjang.isEmpty) {
    print('Keranjang masih kosong!');
    return;
  }

  int total = 0;

  List<String> daftarProduk = [];

  keranjang.forEach((nama, jumlah) {
    int harga = produk[nama]!;
    int subtotal = harga * jumlah;
    total += subtotal;
   
    daftarProduk.add('$nama x $jumlah = Rp$subtotal');
    print('$nama x$jumlah = ${formatRupiah(subtotal)}');
  });

  double diskon = 0.0;
  if (total >= 50000) {
    diskon = 0.10;
    print('Diskon 10% karena belanja di atas Rp50.000');
  } 

  double potongan = total * diskon;
  double totalAkhir = total - potongan;

  print('--------------------------');
print('Total Belanja: ${formatRupiah(total)}');
print('Diskon: ${formatRupiah(potongan.toInt())}');
print('Total Bayar: ${formatRupiah(totalAkhir.toInt())}');
  print('--------------------------');

  // Simpan ke riwayat
  riwayatBelanja.add({
    'produk': Map<String, int>.from(keranjang),
    'total': total,
    'diskon': potongan.toInt(),
    'bayar': totalAkhir.toInt()
  });

  keranjang.clear();
  print('Checkout selesai. Terima kasih!');
}
