class Clock {
    constructor() {
        this.date = new Date(); // 1. Create a Date object.
        this.time = [this.date.getHours(), this.date.getMinutes(), this.date.getSeconds()] // 2. Store the hours, minutes, and seconds.
        this.printTime(); // 3. Call printTime.
        this._tick() // 4. Schedule the tick at 1 second intervals.  
    }

    printTime() {
        let formattedTime = `${this.time[0]}:${this.time[1]}:${this.time[2]}`// Format the time in HH:MM:SS
        console.log(formattedTime);// Use console.log to print it.
    }

    _tick() {
        const increaseTime = () => {
          if (this.time[2] < 59) {
            this.time[2]++;
            this.printTime();
          } else if (this.time[1] < 60) {
            this.time[1]++;
            this.time[2] = 0;
            this.printTime();
          }
          
         if (this.time[1] === 60) {
            this.time[0]++;
            this.time[2] = 0;
            this.time[1] = 0;
            this.printTime();
          }
        }     
        setInterval(increaseTime, 1000);
    }
}

// const clock = new Clock();


//addNumbers

// const readline = require('readline');


// const reader = readline.createInterface({
//     input: process.stdin,
//     output: process.stdout
// });

function addNumbers(sum, numsLeft, completionCallback) {
    reader.question("give a number: ", (res) => {
        sum += parseInt(res);
        console.log(`numsLeft: ${numsLeft - 1}`);
        addNumbers(sum, (numsLeft - 1), completionCallback)
        if (numsLeft === 1) {
          completionCallback(sum);
          reader.close();
        }
    });
}
 


// addNumbers(0, 3, sum => console.log(`Total Sum: ${sum}`));

// Write this first.
function askIfGreaterThan(el1, el2, callback) {
    reader.question(`Is ${el1} > ${el2}?`, (res) => {
        if (res === "yes") {
            callback(true)
        } else if (res === "no") {
            callback(false)
        } else {
            console.log("You have to enter yes or no");
        }
    })

    // reader.close()
    // Prompt user to tell us whether el1 > el2; pass true back to the
    // callback if true; else false.
}

// askIfGreaterThan(0,3, el => console.log(el))

// Once you're done testing askIfGreaterThan with dummy arguments, write this.
function innerBubbleSortLoop(arr, i, madeAnySwaps, outerBubbleSortLoop) {
    // Do an "async loop":
    // 1. If (i == arr.length - 1), call outerBubbleSortLoop, letting it
    //    know whether any swap was made.
    // 2. Else, use `askIfGreaterThan` to compare `arr[i]` and `arr[i +
    //    1]`. Swap if necessary. Call `innerBubbleSortLoop` again to
    //    continue the inner loop. You'll want to increment i for the
    //    next call, and possibly switch madeAnySwaps if you did swap.

    if (i == arr.length - 1) {
        console.log(`arr after innerloop: ${arr}`);
        outerBubbleSortLoop(madeAnySwaps)
    } else {
        askIfGreaterThan(arr[i], arr[i + 1], (el) => {
            if (el) {
                let temp = arr[i];
                arr[i] = arr[i + 1];
                arr[i + 1] = temp;
                madeAnySwaps = true;
                innerBubbleSortLoop(arr, i + 1, madeAnySwaps, outerBubbleSortLoop);
            }else {
                innerBubbleSortLoop(arr, i + 1, madeAnySwaps, outerBubbleSortLoop);
            }
        })
    }
}

// innerBubbleSortLoop([3, 2, 1, 2, 1, 0], 0, false);

// Once you're done testing innerBubbleSortLoop, write outerBubbleSortLoop.
// Once you're done testing outerBubbleSortLoop, write absurdBubbleSort.

function absurdBubbleSort(arr, sortCompletionCallback) {
    function outerBubbleSortLoop(madeAnySwaps) {
        // Begin an inner loop if you made any swaps. Otherwise, call
        // `sortCompletionCallback`.
        if (madeAnySwaps) {
            innerBubbleSortLoop(arr, 0, false, outerBubbleSortLoop);
        } else {
            // innerBubbleSortLoop(arr, 0, madeAnySwaps, outerBubbleSortLoop)
            sortCompletionCallback(arr);
        }
    }

    outerBubbleSortLoop(true);
    // Kick the first outer loop off, starting `madeAnySwaps` as true.
}


// absurdBubbleSort([3,2,1,7], function (arr) {
//     console.log("Sorted array: " + JSON.stringify(arr));
//     reader.close();
// });

// Function Calling

Function.prototype.myBind = function (context) {
  return () => {
    this.apply(context);
  }
}

class Lamp {
  constructor() {
    this.name = "a lamp";
  }
}

const turnOn = function () {
  console.log("Turning on " + this.name);
};

const lamp = new Lamp();

// turnOn(); // should not work the way we want it to

const boundTurnOn = turnOn.bind(lamp);
const myBoundTurnOn = turnOn.myBind(lamp);

// boundTurnOn(); // should say "Turning on a lamp"
// myBoundTurnOn(); // should say "Turning on a lamp"


// myThrottle----------------------------------------------------


Function.prototype.myThrottle = function (interval) {
  let tooSoon = false

  debugger;
  return (...args) => {
    if (!tooSoon) {  
      tooSoon = true;
      setTimeout(() => tooSoon = false, interval);
      this(...args);
    };
  };


};


class Neuron {
  fire() {
    console.log("Firing!");
  }
};

const neuron = new Neuron;
// When we create a new Neuron, 
// we can call #fire as frequently as we want

// The following code will try to #fire the neuron every 10ms. Try it in the console:
// const interval = setInterval(() => {
  //   neuron.fire();
  // }, 10);
  
  // You can use clearInterval to stop the firing:
  
  // Using Function#myThrottle, we should be able to throttle 
  // the #fire function of our neuron so that it can only fire 
  // once every 500ms:
  
  // neuron.fire = neuron.fire.myThrottle(500);
  
//   const interval = setInterval(() => {
//     neuron.fire();
// }, 10);


// clearInterval(interval);
// This time, if our Function#myThrottle worked correctly, 
// the Neuron#fire function should only be able to execute 
// every 500ms, even though we're still trying to invoke it 
// every 10ms!

// If we want this behavior for ALL neurons, we can do the same logic in the constructor:

// class Neuron {
//   constructor() {
//     this.fire = this.fire.myThrottle(500);
//   }

//   fire() {
//     console.log("Firing!");
//   }
// };


Function.prototype.myDebounce = function (interval) {
  let tooSoon = false

  return () => {
    if (!tooSoon) {
      tooSoon = true;
      setTimeout(this, interval);  
    };
  };
};



class SearchBar {
  constructor() {
    this.query = "";
    
    this.type = this.type.bind(this);
    this.search = this.search.bind(this);
  }
  
  type(letter) {
    this.query += letter;
    this.search();
  }
  
  search() {
    debugger
    console.log(`searching for ${this.query}`);
  }
};

const searchBar = new SearchBar;
// Assign searchBar.search to the returned debounced version
// debugger;
searchBar.search = searchBar.search.myDebounce(500);

const queryForHelloWorld = () => {
  searchBar.type("h");
  searchBar.type("e");
  searchBar.type("l");
  searchBar.type("l");
  searchBar.type("o");
  searchBar.type(" ");
  searchBar.type("w");
  searchBar.type("o");
  searchBar.type("r");
  searchBar.type("l");
  searchBar.type("d");
}

queryForHelloWorld();
