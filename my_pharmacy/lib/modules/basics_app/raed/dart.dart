void main(){
  List<int> listx = [5,7,10,6,15,4,9,100];
  print(listx[1]++);
  print(listx[1]);
  print(++listx[0]);
  listx.insert(2,10);
  print(listx[8]++);
  print(listx);
  listx.insertAll(4,[1,1,1]);
  print(listx);
  listx.addAll([22,11]);
  print(listx);
 print(listx.contains(11));
}