let quantities = document.getElementById("quantities");
const id = document.getElementById("pId");

let sizeChoosing = document.querySelectorAll(".pick-box");
let size = 'S';

function increase() {
    let count = parseInt(quantities.innerText);
    count++;
    quantities.innerHTML = count;
}
function decrease() {
    if(quantities.innerText>1) {
        let count = parseInt(quantities.innerText);
        count--;
        quantities.innerHTML = count;
    }
}

function chooseSize(e) {
    var index = Array.prototype.indexOf(sizeChoosing, e);
    size = e.innerText;
    for (i = 0; i < 5; i++) {
        sizeChoosing[i].style.border = '1px solid #ccc';
    }
    e.style.border = '1px solid #333';
}

function redirectToCart(type) {
    let directLink = `./AddByDetails.aspx?id=${id.innerText}&quantities=${quantities.innerText}&type=${type}&size=${size}`;
    window.open(directLink, '_self');
}