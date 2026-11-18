// Student: ABDELSAMAD AMINE OUMAR
// Reg no: 27047
const String regNo = '27047';
final int d = int.parse(regNo[regNo.length - 1]);
final int t = int.parse(regNo.substring(regNo.length - 2));
void main() {
  // by AAO
  print('Reg no: $regNo | D = $d | T = $t');
}