using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BTL.src
{
    public partial class Cart : System.Web.UI.Page
    {//Xử lý file giỏ hàng Cart.aspx
        protected void Page_Load(object sender, EventArgs e)
        {//Lấy User từ Session User check nếu != null nghĩa là có user đang đăng nhập thì:
            User user = (User)Session["User"];
            if (user.Username != null && user.Email != null)
            {//Nếu đã đăng nhập thì hiện tên, email và nút đăng xuất
                userInfo.InnerHtml = "<p class=\"top\">" + user.Username + "</p><p class=\"bottom\">" + user.Email + "</p><p class=\"bottom\"><a href=\"SignOut.aspx\">Đăng Xuất</a></p>";
            }
            int sum = 0;
            //Tính tổng số lượng và giá trị của từng mặt hàng trong giỏ hàng
            List<Product> ProductCart = (List<Product>)Application["ProductCart"];
            foreach (Product product in ProductCart)
            {
                product.Total = product.Price * product.Quantity;
                sum += product.Total;
            }
            //Truyền data của giỏ hàng vào và hiện lên màn hình qua thẻ html id = cartList
            cartList.DataSource = ProductCart;
            cartList.DataBind();
            //Hiện tổng tiền mặt hàng lên màn hình
            TotalPrices.InnerHtml = $"{sum.ToString()}";
        }
    }
}