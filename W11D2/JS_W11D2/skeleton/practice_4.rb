const range = function(start, end) {
  console.log(`start:${start} end:${end}`);
}

range(1,10)
start:1 end:10

const range = function(start, end) {
    let arr = [];
    for (let i = start; i <= end; i++) {
        arr.push(i);
    }
    return arr;
}


range(1, 10)
start: 1 end: 10