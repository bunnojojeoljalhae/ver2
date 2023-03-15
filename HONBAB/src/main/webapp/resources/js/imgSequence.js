let imgNum = 1;
let img = new Image();
let canvas = document.getElementById('screen');
let ctx = canvas.getContext('2d');
let scrollYPos = 0;

img.src = "./resources/img/dish3/00.png";

window.addEventListener('scroll', function(e) {
    scrollYPos = Math.round(window.scrollY / 20);
    
    console.log("scroll y: " + window.scrollY + ", " + scrollYPos);
    
    if (scrollYPos == 0) scrollYPos = 0;
    if (scrollYPos > 59) scrollYPos = 59;
    // scrollYPos = scrollYPos % 59;
    player(scrollYPos);
});

function player(num) {
    img.src = "./resources/img/dish3/" + num + ".png";
}

img.addEventListener('load', function(e) {
    ctx.clearRect(0, 0, ctx.canvas.width, ctx.canvas.height);
    ctx.drawImage(img, 0, 0);
});