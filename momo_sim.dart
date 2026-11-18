// Student: ABDELSAMAD AMINE OUMAR
// Reg no: 27047
const String regNo = '27047';
final int d = int.parse(regNo[regNo.length - 1]);
final int t = int.parse(regNo.substring(regNo.length - 2));

int momoFee(int amount) {
  // by AAO
  if (amount <= 0) {
    return -1;
  } else if (amount <= 1000) {
    return 20;
  } else if (amount <= 10000) {
    return 100;
  } else if (amount <= 150000) {
    return 250;
  } else {
    return 1500;
  }
}

String formatRwf(int amount) {
  // by AAO
  bool negative = amount < 0;
  String digits = amount.abs().toString();
  String grouped = '';
  int i = 0;
  while (i < digits.length) {
    if (i > 0 && (digits.length - i) % 3 == 0) {
      grouped += ',';
    }
    grouped += digits[i];
    i++;
  }
  if (negative) {
    grouped = '-$grouped';
  }
  return '$grouped RWF';
}

bool isValidPin(String pin) {
  // by AAO
  if (pin.length != 5) {
    return false;
  }
  int i = 0;
  while (i < pin.length) {
    if (pin[i].compareTo('0') < 0 || pin[i].compareTo('9') > 0) {
      return false;
    }
    i++;
  }
  if (pin == '12345') {
    return false;
  }
  if (pin[0] == pin[1] &&
      pin[1] == pin[2] &&
      pin[2] == pin[3] &&
      pin[3] == pin[4]) {
    return false;
  }
  return true;
}

int sendMoney(int balance, int amount) {
  // by AAO
  int fee = momoFee(amount);
  if (fee == -1) {
    print('Failed: invalid amount');
    return balance;
  }
  if (amount + fee > balance) {
    print('Failed: insufficient balance');
    return balance;
  }
  int newBalance = balance - amount - fee;
  print('Sent ${formatRwf(amount)} (fee ${formatRwf(fee)}). '
      'New balance: ${formatRwf(newBalance)}');
  return newBalance;
}

int buyAirtime(int balance, int amount) {
  // by AAO
  if (amount < 100 || amount > 50000) {
    print('Failed: invalid airtime amount');
    return balance;
  }
  if (amount > balance) {
    print('Failed: insufficient balance');
    return balance;
  }
  int newBalance = balance - amount;
  print('Airtime ${formatRwf(amount)} purchased. '
      'New balance: ${formatRwf(newBalance)}');
  return newBalance;
}

void main() {
  // by AAO
  print('Reg no: $regNo | D = $d | T = $t');
  print(isValidPin('12345'));
  print(isValidPin('77777'));
  print(isValidPin('4821'));
  print(isValidPin('48a21'));
  print(isValidPin('4821$d'));

  int balance = 20000 + t * 500;
  print('Starting balance: ${formatRwf(balance)}');
  int sendAmount = (d + 1) * 3000;
  balance = sendMoney(balance, sendAmount);
  balance = sendMoney(balance, sendAmount);
  balance = sendMoney(balance, sendAmount);
  balance = buyAirtime(balance, 1000);
  balance = sendMoney(balance, 0);
  balance = sendMoney(balance, 200000);
  print('Final balance: ${formatRwf(balance)}');
  // My own tests (expected output in the comment)
  print(formatRwf(42)); // 42 RWF
  print(formatRwf(1000000)); // 1,000,000 RWF
  print(formatRwf(0)); // 0 RWF
  print(isValidPin('00001')); // true
  print(isValidPin('12a45')); // false
  print(isValidPin('11111')); // false
  // Might break: a negative number, because the '-' sign could be
  // counted as a digit and give -,100 instead of -1,000.
  // My code uses amount.abs() first, so it should be safe.
  print(formatRwf(-1000)); // -1,000 RWF
}