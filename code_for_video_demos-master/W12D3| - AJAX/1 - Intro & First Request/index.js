    
const newGifAJAX = tag => {
  return $.ajax({
    method: "GET",
    url: `https://api.giphy.com/v1/gifs/random?tag=${ tag }&api_key=9IfxO6R6fpEZMAdqdw66QUgQdPejVIAW&rating=G`,
    // success: function (response) {
    //   $("<img>")
    //     .attr("src", response.data.image_url)
    //     .appendTo($("body"));
    // },
    // error: function () {
    //   console.log("error");
    //   debugger;
    // }
  });
};

const xhr = newGifAJAX("dog");

const successCb = function (response) {
  $("<img>")
    .attr("src", response.data.image_url)
    .appendTo($("body"));
};

const errorCb = function () {
  console.log("error");
  debugger;
};

xhr.then(successCb, errorCb); //.fail(anotherErrorCb);

// console.log(xhr.responseJSON.data.image_url);