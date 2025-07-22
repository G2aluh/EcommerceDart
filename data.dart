Map<String, int> produk = {
  'Mie Instan': 3000,
  'Sabun': 5000,
  'Sikat Gigi': 7000,
  'Shampoo': 10000,
  'Kopi': 6000,
  'Beras': 12000,
  'Gula': 8000,

};

Map<String, int> keranjang = {};
List<Map<String, dynamic>> riwayatBelanja = []; // <-- diubah jadi list of map

String formatRupiah(int number) {
  final str = number.toString();
  final buffer = StringBuffer();
  int count = 0;

  for (int i = str.length - 1; i >= 0; i--) {
    buffer.write(str[i]);
    count++;
    if (count % 3 == 0 && i != 0) {
      buffer.write('.');
    }
  }

  return 'Rp${buffer.toString().split('').reversed.join()}';
}
