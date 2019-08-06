// const range = function(start, end) {
//     let arr = [];
//     for (let i = start; i <= end; i++) {
//         arr.push(i);
//     }
//     return arr;
// }

function range(start, end) {
  if (start === end) {
    return [];
  }

  let r = range(start, end - 1);
  r.push(end - 1);
  return r;
}
// range(1, 10)
// start: 1 end: 10