<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SingleProduct.aspx.cs" Inherits="BTL.src.SingleProduct" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Product Details</title>
    <link rel="stylesheet" href="CSS/Home.css" />
    <link rel="stylesheet" href="CSS/Details.css" />
    <link rel="stylesheet" href="CSS/Header.css" />
    <link rel="stylesheet" href="CSS/Footer.css" />
    <link rel="stylesheet" href="CSS/Product.css" />
    <style>
        .description-layer {
            margin-top: 20px;
            padding-right: 50%;
            background-color: #f9f9f9;
            border-left: 4px solid #b04f78;
            font-size: 16px;
            line-height: 1.6;
        }

            .description-layer h2 {
                margin-bottom: 10px;
                font-size: 20px;
                color: #333;
            }

        .product-list {
            display: flex;
            justify-content: flex-start;
        }

        .related-products {
            margin-left: 10%;
            margin-top: 2%;
        }

        .item {
            width: 23%;
            box-sizing: border-box;
        }

        .product img.product-image {
            width: 100%;
            height: auto;
        }

        .product-top {
            position: relative;
        }

        @media (max-width: 500px) {
            .item {
                width: 50%;
                box-sizing: border-box;
            }
        }
    </style>
</head>
<body>

    <form id="form1" runat="server">
        <div class="home" id="home">
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
                                        <p class="top"><a href="SignIn.aspx">Login</a></p>
                                        <p class="bottom"><a href="SignUp.aspx">Register</a></p>
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
            <!-- Body -->
            <main>
                <div class="content">
                    <asp:ListView ID="productData" runat="server">
                        <ItemTemplate>
                            <div class="img-layer">
                                <img src="<%# Eval("Image") %>" alt="Img" class="product-img" />
                            </div>
                            <div class="details-layer">
                                <div class="details-title">
                                    <h3 class="p-name"><%# Eval("Name") %></h3>
                                    <div class="p-id" style="display: none">
                                        ID:<div id="pId"><%# Eval("Id") %></div>
                                    </div>
                                    <div class="p-describe">
                                        <span>SKU : <%# Eval("sku") %></span>
                                    </div>
                                </div>
                                <div class="details-content">
                                    <div class="p-price"><span style="font-size: 20px; text-transform: none; color: black">Product price: </span><%# Eval("Price") %> đ</div>
                                    <div class="size quantities-layer">
                                        <span>Size:</span>
                                        <div class="picker">
                                            <div class="pick-box" onclick="chooseSize(this)">S</div>
                                            <div class="pick-box" onclick="chooseSize(this)">M</div>
                                            <div class="pick-box" onclick="chooseSize(this)">L</div>
                                            <div class="pick-box" onclick="chooseSize(this)">XL</div>
                                            <div class="pick-box" onclick="chooseSize(this)">XXL</div>
                                        </div>
                                    </div>
                                    <div class="quantities-layer">
                                        <div class="quantities-title">Quantity:</div>
                                        <div class="picker">
                                            <div class="pick-box" onclick="derease()">-</div>
                                            <div class="pick-box" id="quantities">1</div>
                                            <div class="pick-box" onclick="increase()">+</div>
                                        </div>
                                    </div>
                                    <div class="purchase-layer">
                                        <a href="javascript:redirectToCart('back')" class="purchase">Add to Cart</a>
                                        <a href="javascript:redirectToCart('go')" class="purchase">Purchase Now</a>
                                    </div>
                                </div>
                            </div>
                            <div class="description-layer">
                                <h2>Description:</h2>
                                <p><%# Eval("Description") %></p>
                            </div>
                        </ItemTemplate>
                    </asp:ListView>
                </div>
                <div class="related-products">
                    <h2>Related products</h2>
                    <asp:ListView ID="RelatedProducts" runat="server">
                        <LayoutTemplate>
                            <div class="product-list">
                                <asp:PlaceHolder ID="itemPlaceholder" runat="server" />
                            </div>
                        </LayoutTemplate>
                        <ItemTemplate>
                            <div class="item">
                                <div class="product">
                                    <a href="SingleProduct.aspx?id=<%#Eval("Id") %>">
                                        <div class="product-top">
                                            <img src="<%# Eval("Image")%>" alt="" class="product-image">
                                            <div class="overlay">
                                                <h3 class="product-name" id="pName"><%# Eval("Name") %></h3>
                                                <h4 class="product-price" id="pPrice"><%# Eval("Price") %></h4>
                                            </div>
                                        </div>
                                    </a>
                                    <div class="product-info">
                                        <h3 class="product-name" id="pName"><%# Eval("Name") %></h3>
                                        <h4 class="product-price" id="pPrice"><%# Eval("Price") %></h4>
                                        <a href="AddToCart.aspx?id=<%#Eval("Id") %>" class="cart-btn">
                                            <img src="./Img/icon/shopping-cart.png" alt="" class="add-to-cart" />
                                            Add to cart</a>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:ListView>
                </div>
            </main>
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
                            <h3 class="blur-text">Copyright @ Khong ai biet gi ca</h3>
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
        </div>
    </form>

    <script src="JS/Home.js"></script>
    <script src="JS/Details.js"></script>
    <script src="JS/BurgerMenu.js"></script>
</body>
</html>
