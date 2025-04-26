import 'dart:io';

class Stack {
  List<String> stack = [];

  void push(String item) {
    stack.add(item);
  }

  String pop() {
    if (stack.isEmpty) {
      return '';
    } else {
      return stack.removeLast();
    }
  }

  bool isEmpty() {
    return stack.isEmpty;
  }

  String peek() {
    return stack.isEmpty ? '' : stack.last;
  }
}

class Converter {
  // Konversi desimal ke biner, oktal, dan heksadesimal
  static void convertDecimal(int decimal) {
    print('Masukkan nilai desimal = $decimal');
    // Konversi ke biner
    String binary = decimal.toRadixString(2);
    print('Hasil nilai biner = $binary');
    
    // Konversi ke oktal
    String octal = decimal.toRadixString(8);
    print('Hasil nilai oktal = $octal');
    
    // Konversi ke heksadesimal
    String hex = decimal.toRadixString(16).toUpperCase();
    print('Hasil nilai heksadesimal = $hex');
  }
}

class PalindromeChecker {
  static void checkPalindrome(String sentence) {
    Stack stack = Stack();
    // Menghapus spasi dan mengubah kalimat ke huruf kecil
    sentence = sentence.replaceAll(' ', '').toLowerCase();
    
    // Push setiap karakter kalimat ke stack
    for (int i = 0; i < sentence.length; i++) {
      stack.push(sentence[i]);
    }

    String reversedSentence = '';
    while (!stack.isEmpty()) {
      reversedSentence += stack.pop();
    }

    print('Hasil = $reversedSentence');
    
    if (sentence == reversedSentence) {
      print('Palindrom.');
    } else {
      print('Bukan palindrom');
    }
  }
}

void main() {
  // Konversi desimal ke biner, oktal, dan heksadesimal
  Converter.convertDecimal(25);

  // Cek palindrom
  print('\nMasukkan kalimat :');
  String sentence = stdin.readLineSync() ?? '';
  PalindromeChecker.checkPalindrome(sentence);
}
