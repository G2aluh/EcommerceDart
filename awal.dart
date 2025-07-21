import 'dart:io';
import 'belanja.dart';
import 'checkout.dart';
import 'riwayat.dart';

void main() {
  while (true) {
    print('\n=== MENU UTAMA ===');
    print('1. Belanja');
    print('2. Checkout');
    print('3. Riwayat Belanja');
    print('4. Keluar');
    stdout.write('Pilih menu: ');
    String? input = stdin.readLineSync();

    switch (input) {
      case '1':
        halamanBelanja();
        break;
      case '2':
        halamanCheckout();
        break;
      case '3':
        halamanRiwayat();
        break;
      case '4':
        print('Sampai jumpa!');
        return;
      default:
        print('Pilihan tidak valid.');
    }
  }
}
