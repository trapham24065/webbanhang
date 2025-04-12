<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AboutUs.aspx.cs" Inherits="BTL.src.AboutUs" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>About Us</title>
    <link rel="stylesheet" href="CSS/Home.css" />
         <link rel="stylesheet" href="CSS/AboutUs.css" />
     <link rel="stylesheet" href="CSS/Header.css" />
    <link rel="stylesheet" href="CSS/Slide.css" />
    <link rel="stylesheet" href="CSS/Footer.css" /
</head>
   
<body>
                <!-- Header -->
            <header class="header">
                <nav class="navbar">
                    <div class="format-header">
                        <div class="nav-left">
                            <a href="./Home.aspx" class="logo-layer">
                                <img src="./Img/icon/logo.png" alt="Logo" class="logo" /></a>
                            <ul class="navigator">
                                <li class="nav-selector"><a style="text-decoration: none; color: black" href="./Home.aspx">Home</a></li>
                                <li class="nav-selector appear">
                                    <!-- Pop Up Menu -->
                                    <a href="Shop.aspx">
                                        <p class="clothes">Shop</p>
                                    </a>

                                    <div class="list-product-clothes">
                                        <div>
                                            <h3 class="title-category">Hàng đầu</h3>
                                            <p class="name-category">Tất cả</p>
                                            <p class="name-category">T-shirts</p>
                                            <p class="name-category">Âu phục</p>
                                            <p class="name-category">Cardigan</p>
                                            <p class="name-category">Sweater</p>
                                            <p class="name-category">Jeans</p>
                                            <p class="name-category">Jacket-blazor</p>
                                            <p class="name-category">Khác</p>
                                        </div>
                                        <div>
                                            <h3 class="title-category">Bán chạy</h3>
                                            <p class="name-category">Tất cả</p>
                                            <p class="name-category">Áo khoác gió</p>
                                            <p class="name-category">Cardigan</p>
                                            <p class="name-category">Sweater</p>
                                            <p class="name-category">Jeans</p>
                                            <p class="name-category">Váy</p>
                                            <p class="name-category">Khác</p>
                                        </div>
                                    </div>
                                </li>
                                <li class="nav-selector">Makeup</li>
                                <li class="nav-selector"><a href="AboutUs.aspx">About Us</a></li>
                            </ul>
                        </div>
                        <!-- Icon bên phải -->
                        <div class="nav-right">
                            <!-- Thanh tìm kiếm -->
                            <div class="nav-search nav-btn">
                                <div class="searcher nav-btn">
                                    <input type="text" name="" id="Searcher" class="search-input" placeholder="Search..." />
                                    <div id="search-result"></div>
                                </div>
                            </div>
                            <!-- Đăng nhập, đăng ký -->
                            <div class="content-menu">
                                <div class="nav-btn account-user in-menu" id="account-icon">
                                    <img src="./Img/icon/user.png" alt="Sign In" class="nav-button" />
                                    <div class="popup-user" id="userInfo" runat="server">
                                        <p class="top"><a href="SignIn.aspx">Đăng nhập</a></p>
                                        <p class="bottom"><a href="SignUp.aspx">Đăng Ký</a></p>
                                    </div>
                                </div>
                                <!-- Giỏ hàng -->
                                <div class="nav-btn in-menu" id="cart-icon">
                                    <a href="Cart.aspx" style="text-decoration: none;">
                                        <img src="./Img/icon/shopping-cart.png" alt="Cart" class="nav-button" />
                                        <span id="CartCounter" class="cart-counter" runat="server">0</span>
                                    </a>
                                </div>
                            </div>
                            <div class="nav-btn menu" onclick="toggleMenu()">
                                <img src="./Img/icon/menu-hamburger.jfif" alt="menu" class="nav-button" />
                            </div>
                        </div>
                    </div>
                </nav>
            </header>
    <form id="form1" runat="server">
        <div class="about-us-container">
  <h1 class="about-title">About Us – Nant Shop</h1>
  <p class="about-intro">
    Welcome to <strong>Nant Shop</strong>, your one-stop destination for trendy fashion and high-quality beauty products.
  </p>

  <div class="about-section">
    <h2 class="section-title">👗 Fashion That Speaks You</h2>
    <p>
      From casual wear to elegant outfits, our clothing line is designed to reflect your personality and keep you in style, no matter the season.
      Whether you're dressing for comfort or making a statement, we’ve got something for every occasion.
    </p>
  </div>

  <div class="about-section">
    <h2 class="section-title">💄 Beauty That Inspires</h2>
    <p>
      Our beauty section offers a range of carefully selected skincare and makeup products that nourish your skin and enhance your natural glow.
      We partner with trusted brands to ensure every product is safe, effective, and made with love.
    </p>
  </div>

  <div class="about-section">
    <h2 class="section-title">💖 Our Promise</h2>
    <p>
      At Nant Shop, we value <strong>quality, affordability, and authenticity</strong>. Every product you see on our shelves is chosen with care
      and tested for excellence. Our team is passionate about helping you discover your unique look, inside and out.
    </p>
  </div>

  <p class="about-thank">Thank you for choosing Nant Shop. We’re more than just a shop – we’re your personal style partner.</p>
</div>
    </form>
      <!-- Footer -->
  <footer class="footer">
      <div class="footer-top">
          <div class="footer-body">
              <h4 class="font-larger">About Us</h4>
              <div class="footer-body hover-red">Infomation</div>
              <div class="footer-body hover-red">Store Location</div>
          </div>
          <div class="footer-body">
              <h4 class="font-larger">Help</h4>
              <div class="footer-body hover-red">FAQ</div>
              <div class="footer-body hover-red">Return Policy</div>
              <div class="footer-body hover-red">Privacy Policy</div>
              <div class="footer-body hover-red">Accessibility</div>
          </div>
          <div class="footer-body">
              <h4 class="font-larger">Account</h4>
              <div class="footer-body hover-red">Membership</div>
              <div class="footer-body hover-red">Profile</div>
              <div class="footer-body hover-red">Coupons</div>
          </div>
          <div class="footer-body">
              <h4 class="font-larger">Social Account</h4>
              <div class="social-img">
                  <img src="./Img/icon/facebook.png" alt="Facebook" class="social-icon" />
                  <img src="./Img/icon/instagram.png" alt="Instagram" class="social-icon" />
                  <img src="./Img/icon/youtube.png" alt="Youtube" class="social-icon" />
                  <img src="./Img/icon/tik-tok.png" alt="Tiktok" class="social-icon" />
              </div>
          </div>
      </div>
      <div class="footer">
          <div class="footer-bot">
              <div class="fbot-head">
                  <h3 class="blur-text">Copyright @Natshop</h3>
                  <div class="fbot-head-right">
                      <h3 class="blur-text highlight hover-red">Terms of Use</h3>
                      <h3 class="blur-text highlight hover-red">Privacy Policy</h3>
                  </div>
              </div>
              <div class="fbot-title">Company Name: NameOfCompany</div>
              <div class="fbot-title">Enterprise Code: 0123456798</div>
              <div class="fbot-title">Address: 96 Dinh Cong</div>
              <div class="fbot-title">For any inquiry, please visit our FAQ page</div>
              <div class="fbot-title">Working Hours: 6h-22h</div>
          </div>
      </div>
  </footer>
</body>
</html>
