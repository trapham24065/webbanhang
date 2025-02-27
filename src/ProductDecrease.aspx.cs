using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BTL.src
{
    public partial class ProductDecrease : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {//Giảm số lượng mặt hàng trong giỏ
            User user = (User)Session["User"];
            List<Product> ProductCart = (List<Product>)Application["ProductCart"];
            //Lấy id của mặt hàng cần giảm qua QueryString
            string id = Request.QueryString.Get("id");
            //Tìm trong giỏ hàng, id nào trùng thì giảm, số lượng mà =1 thì xóa luôn
            foreach (Product product in ProductCart)
            {
                if (product.Id == int.Parse(id))
                {
                    if (product.Quantity > 1)
                    {
                        product.Quantity--;
                        Response.Redirect("Cart.aspx");
                        break;
                    }
                    else
                    {
                        Response.Redirect("ProductDeletion.aspx?id=" + int.Parse(id));
                        break;
                    }
                }
            }
        }
    }
}