let slideIndex = 0;
let slides = document.querySelectorAll(".slide");
let timer; // Biến lưu trữ setInterval

// Hàm hiển thị slide
function showSlides() {
    for (let i = 0; i < slides.length; i++) {
        slides[i].style.display = "none";
    }
    slideIndex++;
    if (slideIndex > slides.length) { slideIndex = 1 }
    slides[slideIndex - 1].style.display = "block";

    timer = setTimeout(showSlides, 4000); // Chạy sau mỗi 3 giây
}

// Hàm đổi slide khi nhấn Next/Prev
function changeSlide(n) {
    clearTimeout(timer); // Dừng tự động khi nhấn nút
    slideIndex += n - 1;
    if (slideIndex < 0) slideIndex = slides.length - 1;
    if (slideIndex >= slides.length) slideIndex = 0;
    showSlides();
}

// Chạy slideshow ngay khi tải trang
showSlides();
