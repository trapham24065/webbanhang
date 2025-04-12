document.addEventListener("DOMContentLoaded", function () {
    const cartBtns = document.querySelectorAll(".cart-btn");

    cartBtns.forEach((btn) => {
        btn.addEventListener("click", function (e) {
            e.preventDefault();
            alert("Sản phẩm đã được thêm vào giỏ hàng!");
        });
    });
});