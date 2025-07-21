import 'data.dart';

void halamanRiwayat() {
  print('\n=== RIWAYAT BELANJA ===');

  if (riwayatBelanja.isEmpty) {
    print('Belum ada riwayat belanja.');
    return;
  }

  for (var i = 0; i < riwayatBelanja.length; i++) {
    var transaksi = riwayatBelanja[i];
    print('\nTransaksi ke-${i + 1}:');
    Map<String, int> produkTransaksi = transaksi['produk'];

    produkTransaksi.forEach((nama, jumlah) {
      int harga = produk[nama]!;
      print('- $nama x $jumlah = ${formatRupiah(harga * jumlah)}');
    });

print('Total    : ${formatRupiah(transaksi['total'])}');
print('Diskon   : ${formatRupiah(transaksi['diskon'])}');
print('Bayar    : ${formatRupiah(transaksi['bayar'])}');
  }
}
