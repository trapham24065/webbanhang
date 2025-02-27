using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BTL.src
{
    public partial class SingleProduct : System.Web.UI.Page
    {//Xử lý trang chi tiết mặt hàng
        protected void Page_Load(object sender, EventArgs e)
        {
            //Lấy User từ Session User
            //Lấy danh sách User và thứ tự của User đang đăng nhập
            User user = (User)Session["User"];
            if (user.Username != null && user.Email != null)
            {//Nếu đã đăng nhập thì hiện tên, email và nút đăng xuất
                userInfo.InnerHtml = "<p class=\"top\">" + user.Username + "</p><p class=\"bottom\">" + user.Email + "</p><p class=\"bottom\"><a href=\"SignOut.aspx\">Đăng Xuất</a></p>";
            }
            List<Product> ProductCart = (List<Product>)Application["ProductCart"];
            //Gọi DS fix cứng data
            List<Product> ProductList = (List<Product>)Application["ProductList"];
            //Lấy id của sản phẩm được click (qua QueryString)
            string id = Request.QueryString.Get("id");
            //Tìm kiếm sản phẩm trong DS đc gọi
            foreach (Product product in ProductList)
            {
                //Thấy sản phẩm trùng ID thì tạo 1 ds khác, thêm sp và bind ra màn hình qua thẻ id = productData
                if (product.Id == int.Parse(id)) 
                {
                    List<Product> Details = new List<Product>();
                    Details.Add(product);
                    productData.DataSource = Details;
                    productData.DataBind();
                    break;
                }
            }
            int countProduct = ProductCart.Count;

            CartCounter.InnerHtml = $"{countProduct}";
        }
    }
}