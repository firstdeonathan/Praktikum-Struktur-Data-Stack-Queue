import 'dart:io';

class BankQueue {
  List<String> queue;
  int front;
  int rear;
  int size;
  int capacity;

  BankQueue(this.capacity)
      : queue = List<String>.filled(capacity, ''),
        front = -1,
        rear = -1,
        size = 0;

  bool isFull() {
    return (size == capacity);
  }

  bool isEmpty() {
    return (size == 0);
  }

  void enqueue(String name) {
    if (isFull()) {
      print('Antrian penuh! Tidak bisa menambah $name.');
      return;
    }
    rear = (rear + 1) % capacity;
    queue[rear] = name;
    if (front == -1) {
      front = rear;
    }
    size++;
    print('$name berhasil masuk ke antrian.');
  }

  void dequeue() {
    if (isEmpty()) {
      print('Antrian kosong! Tidak ada yang dikeluarkan.');
      return;
    }
    print('${queue[front]} telah keluar dari antrian.');
    front = (front + 1) % capacity;
    size--;
    if (size == 0) {
      front = -1;
      rear = -1;
    }
  }

  void display() {
    if (isEmpty()) {
      print('Antrian kosong.');
      return;
    }
    print('Isi antrian:');
    int i = front;
    for (int count = 0; count < size; count++) {
      stdout.write('${queue[i]} ');
      i = (i + 1) % capacity;
    }
    print('\n');
  }
}

void main() {
  stdout.write('Masukkan kapasitas antrian: ');
  int capacity = int.parse(stdin.readLineSync()!);

  BankQueue bankQueue = BankQueue(capacity);

  while (true) {
    print('''
Menu Antrian:
1. Tambah Antrian
2. Hapus Antrian
3. Tampilkan Antrian
4. Keluar Program
Pilih menu (1-4): 
    ''');

    String choice = stdin.readLineSync()!;

    switch (choice) {
      case '1':
        if (bankQueue.isFull()) {
          print('Antrian penuh! Tidak bisa menambah.');
        } else {
          stdout.write('Masukkan nama nasabah: ');
          String name = stdin.readLineSync()!;
          bankQueue.enqueue(name);
        }
        break;
      case '2':
        bankQueue.dequeue();
        break;
      case '3':
        bankQueue.display();
        break;
      case '4':
        print('Keluar dari program.');
        return;
      default:
        print('Pilihan tidak valid.');
    }
  }
}
