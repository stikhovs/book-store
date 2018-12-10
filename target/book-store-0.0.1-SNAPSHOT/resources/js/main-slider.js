$(document).ready(function () {
    $('#slider').slick({
        arrows: true,
        dots: true,
        autoplay: true,
        autoplaySpeed: 15000,
    });
    
    $(".slider").slick({
        arrows: true,
        dots: false,
        slidesToShow: 4,
        slidesToScroll: 4,
        infinite: true,
        responsive: [
    {
      breakpoint: 1249,
      settings: {
        slidesToShow: 3,
        slidesToScroll: 3,  
      }
    },
    {
      breakpoint: 950,
      settings: {
        slidesToShow: 2,
        slidesToScroll: 2,
      }
    },
    {
      breakpoint: 650,
      settings: {
        slidesToShow: 1,
        slidesToScroll: 1,
      }
    }
  ]
    });

});