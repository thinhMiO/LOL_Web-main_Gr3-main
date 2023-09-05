var swiper = new Swiper(".mySwiper",{
            
    loop:true,
    autoplay:true,
    autoplayTimeout:1000, /*2000ms=2s*/
    autoplayHoverPause:true,

    effect: "coverflow",
    grabCursor:true,
    slidesPerView:"auto",
    centeredSlides:true,
    coverflowEffect:{
        rotate:0,
        stretch:0,
        depth:300,
        modifier:1,
        slideShadow:false,
    },
        pagination:{
            el:".swiper-pagination",
        },
});