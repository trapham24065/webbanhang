using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BTL.src
{
    public partial class AddToCart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Gọi DS hàng hóa, DS User và vị trí của User đang đăng nhập
            List<Product> ProductList = (List<Product>)Application["ProductList"];
            List<Product> ProductCart = (List<Product>)Application["ProductCart"];
            //Lấy id từ queryString được gửi đến
            string id = Request.QueryString.Get("id");
            bool checkInCart = false;
            foreach (Product product in ProductCart)
            {
                if (product.Id == int.Parse(id))
                {
                    product.Quantity++;
                    checkInCart = true;
                    Response.Redirect("Home.aspx");
                    break;
                }
            }
                //Nếu chưa có trong mặt hàng (!checkInCart) <=> (checkInCart == false) thì tìm mặt hàng đấy qua ID trong danh sách mặt hàng rồi thêm vào giỏ hàng của user
                if (!checkInCart)
                {
                    foreach (Product product in ProductList)
                    {
                        if (product.Id == int.Parse(id))
                        {
                            ProductCart.Add(product);
                            break;
                        }
                    }
                    Response.Redirect("Home.aspx");
                }
        }
    }
}