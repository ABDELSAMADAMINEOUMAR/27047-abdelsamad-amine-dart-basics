// Student: ABDELSAMAD AMINE OUMAR
// Reg no: 27047
const String regNo = '27047';
final int d = int.parse(regNo[regNo.length - 1]);
final int t = int.parse(regNo.substring(regNo.length - 2));

int countVowels(String text) {
  // by AAO
  String lowerText = text.toLowerCase();
  int count = 0;
  int i = 0;
  while (i < lowerText.length) {
    if ('aeiou'.contains(lowerText[i])) {
      count++;
    }
    i++;
  }
  return count;
}

String initials(String fullName) {
  // by AAO
  String cleaned = fullName.trim();
  if (cleaned.isEmpty) {
    return '';
  }
  List<String> parts = cleaned.split(RegExp(r'\s+'));
  String result = '';
  int i = 0;
  while (i < parts.length) {
    if (parts[i].isNotEmpty) {
      result += '${parts[i][0].toUpperCase()}.';
    }
    i++;
  }
  return result;
}

void drawTriangle(int height) {
  // by AAO
  int row = 1;
  while (row <= height) {
    int spaces = height - row;
    String symbol = row.isOdd ? '*' : '#';
    print((' ' * spaces) + (symbol * row));
    row++;
  }
}

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

String maskPhone(String phone) {
  // by AAO
  if (phone.length != 10) {
    return 'INVALID';
  }
  return phone.substring(0, 3) +
      ('*' * (phone.length - 5)) +
      phone.substring(phone.length - 2);
}

void main() {
  // by AAO
  print('Reg no: $regNo | D = $d | T = $t');
  const String fullName = 'ABDELSAMAD AMINE OUMAR';
  print('$fullName has ${countVowels(fullName)} vowels');
  print(initials(fullName));
  print(initials(' ana uwase '));
  print(initials(' '));
  drawTriangle(d + 3);
  drawTriangle(0);
  drawTriangle(-2);

  const String phone = '0788123456';
  int i = 1;
  int totalFees = 0;
  while (i <= d + 3) {
    int amount = i * 4000 + t * 100;
    int fee = momoFee(amount);
    totalFees += fee;
    print('Receipt $i | $amount RWF | fee $fee RWF | to ${maskPhone(phone)}');
    i++;
  }
  print('Total fees: $totalFees RWF');
}