window.onload = function() {
  console.log("DOM Loaded");

  //Bootstrap/jQuery Navbar Toggle
  $('.collapse').collapse({
    toggle: false
  });

  //types "Welcome To . . ." text on home page one letter at a time
  var myText1 = 'Welcome To';
  console.log(myText1);
  var myArray1 = myText1.split("");
  console.log(myArray1);
  function looper1() {
    if(myArray1.length > 0) {
      document.getElementById("welcome-text").innerHTML += myArray1.shift();
    }
    setTimeout(looper1, 100);
  };
  looper1();

  //types "JackLambros.com" text on home page one letter at a time.
  var myText2 = 'JackLambros.com';
  console.log(myText2);
  var myArray2 = myText2.split("");
  console.log(myArray2);
  function looper2() {
    if(myArray2.length > 0) {
      document.getElementById("home-name").innerHTML += myArray2.shift();
    }
    setTimeout(looper2, 100);
  };
  looper2();

};
