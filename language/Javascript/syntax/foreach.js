/*
function processArray(items, process) {
     var todo = items.concat();
     console.log(todo);

    setTimeout(function() {
        process(todo.shift());
        if(todo.length > 0) {
            setTimeout(arguments.callee, 25);
        }
    }, 25);
}

var arr = ["lisp", "cpp", "erlang"];

//console.log(arr);

processArray(arr, function(ie) {
    console.log(ie);
});

function greet(greeting) {
    console.log(greeting);
}

function getRandom(arr) {
    return arr[Math.floor(Math.random() * arr.length)];
}

var greetings = ["Hello", "Bonjour", "Guten Tag"],
    randomGreeting = getRandom(greetings);

greet(randomGreeting);


setTimeout(function() {
    greet(randomGreeting);
}, 1000);


setTimeout(greet, 3000, randomGreeting);

function g() {
    console.log("I am listing");
}
*/

var times = 1;

$('button').on('click', function(){
    // console.log("I am clicking...");
    $('#other').trigger('click');
});

$('#other').on('click', function() {
    console.log("event triggered, times = " + times);
    times += 1;
})



// $( "#target" ).click(function() {
//     alert( "Handler for .click() called." );
// });

// document.getElementById('liu').addEventListener('click',
//                                                    function() {
//                                                        alert( "Handler for .click() called." );
//                                                    });


// var i = 0, len = greetings.length;

// console.log("I asny the array");
// for (; i < len; ++i) {
//     //asny(greetings[i]);
// }
// console.log("End of asnying the array");
