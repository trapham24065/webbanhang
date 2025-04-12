using BTL.src;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BTL
{
	public partial class Shop : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
            User user = (User)Session["User"];
            if (user.Username != null && user.Email != null)
            {//Nếu đã đăng nhập thì hiện tên, email và nút đăng xuất
                userInfo.InnerHtml = "<p class=\"top\">" + user.Username + "</p><p class=\"bottom\">" + user.Email + "</p><p class=\"bottom\"><a href=\"SignOut.aspx\">Đăng Xuất</a></p>";
            }
            List<Product> ProductList = (List<Product>)Application["ProductList"];
            List<Product> ProductCart = (List<Product>)Application["ProductCart"];
            List<Product> clother = new List<Product>();
            foreach (Product p in ProductList)
            {

                if (p.Id > 0 )
                {
                    clother.Add(p);
       
                }
            }
            Clother.DataSource = clother;
            Clother.DataBind();
            //Nếu chưa đăng nhập thì giỏ hàng hiện 0, ngược lại thì hiện số mặt hàng có trong giỏ

            int countProduct = ProductCart.Count;

                CartCounter.InnerHtml = $"{countProduct}";
        }
	}
}