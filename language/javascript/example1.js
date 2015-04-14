function test() {
  message = "hi, this is a message for watch...";
}

test();
//alert(message);

/*
var message = "hi",
    found = false,
    age = 29;

alert(typeof message);
alert(typeof (message));
alert(typeof 95);
*/

var Message;
//alert(Message);

var num1 = parseFloat(parseInt("0xf", 16) * 1.0);
//alert(num1);

var result = 66 / 12;
alert(result);

var count = 10;
for(var i = 0; i < count; ++i) {
  //alert(i);
}

var person = new Object();
person.name = "snowsun"
//alert("My name is " + person.name)

function displayInfo(args) {
  var output = "";

  if (typeof args.name == "string") {
    output += "name: " + args.name + "\n";
  }

  if (typeof args.age == "number") {
    output += "Age: " + args.age + "\n";
  }

  alert(output);
}

displayInfo({
  name: "snowsun",
  age: 13});

displayInfo({
  name: "gxh"});
