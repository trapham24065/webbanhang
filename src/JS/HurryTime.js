
    // Đặt thời gian kết thúc (ví dụ: 5 phút từ lúc tải trang)
    var countdownTime = new Date().getTime() + 15 * 60 * 1000;

    function updateCountdown() {
        var now = new Date().getTime();
    var distance = countdownTime - now;

    if (distance < 0) {
        document.getElementById("countdown").innerHTML = "Hết giờ!";
    clearInterval(countdownInterval);
    return;
        }

    var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
    var seconds = Math.floor((distance % (1000 * 60)) / 1000);

    document.getElementById("countdown").innerHTML = minutes + " phút " + seconds + " giây";
    }

    var countdownInterval = setInterval(updateCountdown, 1000);

