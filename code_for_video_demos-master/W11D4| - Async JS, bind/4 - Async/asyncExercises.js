const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

reader.question("what's up?", function (answer) {
  console.log(answer);
  console.log("got an answer!");
  reader.close();
});

