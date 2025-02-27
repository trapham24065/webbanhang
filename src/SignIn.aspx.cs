using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BTL.src
{
    public partial class SignIn : System.Web.UI.Page
    {//Xử lý đăng nhập TK
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)//Nếu được Submit đi
            {//Gọi DS user
                List<User> Users = (List<User>)Application["Users"];
                
                List<Product> ProductCart = (List<Product>)Application["ProductCart"];
                //Lấy data gồm Username và password được gửi đi bằng Request.Form (Gửi dưới dạng Post)
                string siName = Request.Form["username"];
                string siPassword = Request.Form["password"];
                //Tạo biến check xem acc có không
                bool accExist = false;
                //Để 2 dòng thông báo lỗi trống
                errorUsername.InnerText = "";
                errorPassword.InnerText = "";
                //Tìm kiếm User, nếu có username và password cùng trùng thì:
                foreach (User u in Users)
                {
                    if (u.Username == siName && u.Password == siPassword)
                    {
                        //Biến check acc trả về là có tồn tại acc
                        accExist = true;
                        User user = (User)Session["User"];
                        //Gọi và để Session mang dữ liệu của user được đăng nhập
                        user.Username = u.Username;
                        user.Password = u.Password;
                        user.Email = u.Email;
                        foreach (Product p in u.userCart)
                        {
                            if (ProductCart.FindIndex(prod => prod.Id == p.Id && prod.Size == p.Size) != -1)
                            {
                                
                                ProductCart[ProductCart.FindIndex(prod => prod.Id == p.Id)].Quantity += p.Quantity;
                            }
                            else
                            {
                                ProductCart.Insert(0, p);
                            }
                        }
                        //Trả về trang chủ
                        Response.Redirect("Home.aspx");
                        break;
                    }
                    if (u.Username == siName && u.Password != siPassword)
                    {//Nếu đúng tk mà sai mk thì hiện sai mk
                        errorPassword.InnerText = "Sai mật khẩu";
                        return;
                    }
                }

                if (!accExist)//Nếu ko tìm thấy thì hiện ra tk không tồn tại
                {
                    errorUsername.InnerText = "Tài khoản ko tồn tại";
                }
            }
        }
    }
}