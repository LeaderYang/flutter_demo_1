//void main() => runApp(new MyApp());
var t;
dynamic a;
var b;

void main() {
  t = "dfg f g ghf";
  t = 100545;
  print(t);

  a = "";
  b = "";
  printLengths();

  print(say('Nbb', "msdsg"));
  print(say("Nbb", "msdsg", "slkjd skdjh"));
  print(say("Nbb", "msdsg", 'slkjd skdjh'));

  print(enableFlags(hidden: false, bold: true));

  delayed();
  testWait();
  testCallbackHell();
  task();
  testStream();
}

testCallbackHell() {
  login("alice", "123456").then((id) {
    print(id);
    return getUserInfo(id);
  }).then((userInfo) {
    print(userInfo);
    return saveUserInfo(userInfo);
  }).then((e) {
    print(e);
    print(" login success");
  }).catchError((e) {
    print(e);
  });
}

testWait() {
  Future.wait([
    Future.delayed(new Duration(seconds: 3), () {
      return "delayed 3 seconds";
    }),
    Future.delayed(new Duration(seconds: 4), () {
      return "  delayed 4 seconds";
    })
  ]).then((results) {
    print(results[0] + results[1]);
  }).catchError((e) {
    print(e);
  });
}

void delayed() {
  Future.delayed(new Duration(seconds: 2), () {
    //    return "3 seconds delayed";
    throw AssertionError("Error");
  }).then((data) {
    print(data);
    print("then  data success");
  }, onError: (e) {
    print(e);
  }).catchError((e) {
    print("catchError  data success");
  }).whenComplete(() {
    print("whenComplete   data success");
  });
}

printLengths() {
  print(a.length);
  print(b.length);
}

//bool isMobile(int num){
//  return _nobleGases[num] != null;
//}
//
//typedef bool CALLBACK();
//
//isNoble(int num){
//  return _nobleGases[num] != null;
//}
//
//void test(CALLBACK cb){
//  print(cb());
//}

String say(String from, String msg, [String device]) {
  var result = '$from says $msg';
  if (device != null) {
    result = '$result with a $device';
  }
  return result;
}

String enableFlags({bool bold, bool hidden}) {
  var result = '$bold bold $hidden hidden';
  return result;
}

Future<String> login(String name, String pwd) {
  return Future.delayed(new Duration(seconds: 3), () {
    return "login " + name + " \n";
  });
}

Future<String> getUserInfo(String id) {
  return Future.delayed(new Duration(seconds: 3), () {
    return "getUserInfo " + id + "\n";
  });
}

Future<String> saveUserInfo(String userInfo) {
  return Future.delayed(new Duration(seconds: 3), () {
    return "saveUserInfo " + userInfo + "\n";
  });
}

task() async {
  try {
    String id = await login("login async", "sans-serif");
    String userInfo = await getUserInfo(id);
    String save = await saveUserInfo(userInfo);
    print(save);
    print("async success");
  } catch (e) {
    print(e);
  }
}

testStream() {
  Stream.fromFutures([
    Future.delayed(new Duration(seconds: 2), () {
      return "hello  222";
    }),
    Future.delayed(new Duration(seconds: 3), () {
      throw AssertionError("Error 3");
    }),
    Future.delayed(new Duration(seconds: 4), () {
      return "hello  444";
    })
  ]).listen((event) {
    print(event);
  }, onError: (e) {
    print(e);
  }, onDone: () {
    print("Success Stream");
  });
}
