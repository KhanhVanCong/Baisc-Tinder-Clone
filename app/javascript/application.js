// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "@popperjs/core"
// import "bootstrap"
import * as bootstrap from "bootstrap"


// const myCarousel = document.querySelector('#carouselExampleCaptions')
// const carousel = new bootstrap.Carousel(myCarousel, {
//   interval: false,
//   wrap: false
// })
//
// const btnLike = document.querySelector('#btn-like')
// btnLike.addEventListener("click", function () {
//   const requestOptions = {
//     method: 'POST',
//     dataType: 'json',
//     contentType: 'application/json',
//     body: JSON.stringify({liked_id: 5})
//   };
//
//   fetch("/relationship_likes", requestOptions)
//       .then(response => console.log(response))
//       .then(result => console.log(result))
//       .catch(error => console.log('error', error));
//   carousel.next();
// })
//
// const btnDisLike = document.querySelector('#btn-dislike')
// btnDisLike.addEventListener("click", function () {
//   carousel.next();
// })
