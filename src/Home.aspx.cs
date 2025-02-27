using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BTL.src
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {//Xử lý dữ liệu trang chủ Home.aspx
            //Lấy User từ Session User
            //Lấy danh sách User và thứ tự của User đang đăng nhập
            User user = (User)Session["User"];
            if (user.Username != null && user.Email!= null)
            {//Nếu đã đăng nhập thì hiện tên, email và nút đăng xuất
                userInfo.InnerHtml = "<p class=\"top\">"+user.Username+ "</p><p class=\"bottom\">"+user.Email+ "</p><p class=\"bottom\"><a href=\"SignOut.aspx\">Đăng Xuất</a></p>";
            }
            //Gọi DS fix cứng data
            List<Product> ProductList = (List<Product>)Application["ProductList"];
            List<Product> ProductCart = (List<Product>)Application["ProductCart"];
            //Tạo DS tương ứng vs 6 ds cần in ra màn hình
            List<Product> womenShirts = new List<Product>();
            List<Product> womenTrousers = new List<Product>();
            List<Product> menShirts = new List<Product>();
            List<Product> menTrousers = new List<Product>();
            List<Product> lipsticks = new List<Product>();
            List<Product> perfumes = new List<Product>();

            //Ném data từ DS fix cứng vào 6 ds kia, mỗi 3 id 1 ds
            foreach (Product p in ProductList)
            {
                if(p.Id > 0 && p.Id <= 3)
                {
                    womenShirts.Add(p);
                }
                if (p.Id > 3 && p.Id <= 6)
                {
                    womenTrousers.Add(p);
                }
                if (p.Id > 6 && p.Id <= 9)
                {
                    menShirts.Add(p);
                }
                if (p.Id > 9 && p.Id <= 12)
                {
                    menTrousers.Add(p);
                }
                if (p.Id > 12 && p.Id <= 15)
                {
                    lipsticks.Add(p);
                }
                if (p.Id > 15 && p.Id <= 18)
                {
                    perfumes.Add(p);
                }
            }
            //Lấy cái thẻ có id và gán dataSource = 6 ds trên rồi bind vào thẻ đó
            WomenShirts.DataSource = womenShirts;
            WomenShirts.DataBind();
            WomenTrousers.DataSource = womenTrousers;
            WomenTrousers.DataBind();
            MenShirts.DataSource = menShirts;
            MenShirts.DataBind();
            MenTrousers.DataSource = menTrousers;
            MenTrousers.DataBind();
            Lipsticks.DataSource = lipsticks;
            Lipsticks.DataBind();
            Perfumes.DataSource = perfumes;
            Perfumes.DataBind();
            
            //Nếu chưa đăng nhập thì giỏ hàng hiện 0, ngược lại thì hiện số mặt hàng có trong giỏ

            int countProduct = ProductCart.Count;

                CartCounter.InnerHtml = $"{countProduct}";
            
        }
    }
}