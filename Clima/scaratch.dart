import 'dart:io';

void main() {
  performTasks();
}
//async gives us access to await
void performTasks() async{
  task1();
  String outputT2 = await task2();
  task3(outputT2);
}

void task1() {
  String result = 'task 1 data';
  print('Task 1 complete');
}
//just writing future would work too , as it would be assigned to a string in the future
Future<String> task2() async{
  Duration threeSeconds = Duration(seconds:3);
  String result = "";
  await Future.delayed(threeSeconds,(){
    result = 'task 2 data';
    print('Task 2 complete');
  });
  return result;

  //sleep was used when the code was synchronous
  //sleep(threeSeconds);

}

void task3(String something) {
  String result = 'task 3 data';
  print('Task 3 complete');
}
