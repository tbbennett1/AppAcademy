// -----------------------------------
// -----------  CLOSURES  ------------
// -----------------------------------

function dinerBreakfast() {
  const order = "I'd like cheesy scrambled eggs";

  return function () {
    return order;
  };
}
const func = dinerBreakfast();
func();



function dinerBreakfastToo() {
  const order = ["cheesy scrambled eggs"];

  return function (foodItem) {
    if (foodItem) {
      order.push(foodItem);
    }
    console.log(`I'd like ${ order.join(", ") } please`);
  };
}













