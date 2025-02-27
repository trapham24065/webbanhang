using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BTL.src
{
    public partial class ProductDeletion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {//Xóa mặt hàng khỏi giỏ
            User user = (User)Session["User"];
            List<Product> ProductCart = (List<Product>)Application["ProductCart"];
            //Lấy id mặt hàng cần xóa (id được gửi qua QueryString khi click vào mặt hàng đó)
            string id = Request.QueryString.Get("id");
            //Tìm kiếm bằng id, trùng thì xóa luôn khỏi giỏ
            foreach (Product product in ProductCart)
            {
                if (product.Id == int.Parse(id))
                {
                    ProductCart.Remove(product);
                    Response.Redirect("Cart.aspx");
                    break;
                }
            }
        }
    }
}