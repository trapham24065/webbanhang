using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BTL.src
{
    public partial class SignUp : System.Web.UI.Page
    {//Xử lý đăng ký tk
        protected void Page_Load(object sender, EventArgs e)
        {
            List<User> Users = (List<User>)Application["Users"];

            if (IsPostBack)
            {//Lấy data được gửi đi
                string suName = Request.Form["username"];
                string suEmail = Request.Form["email"];
                string suPassword = Request.Form["password"];
                //Tạo biến check acc tồn tại
                bool userExist = false;
                //Tạo 1 user với data được gửi tới
                User newUser = new User(suName,suEmail,suPassword);
                //Tìm kiếm các User trong DS user được lưu, nếu User vừa tạo có Username và Email trùng thì thông báo đã có tk
                foreach (User user in Users)
                {
                    if (newUser.Username == user.Username && newUser.Email == user.Email) 
                    { 
                        userExist = true;
                        errorUsername.InnerText = "Đã có tài khoản";
                        break;
                    }
                }
                if (!userExist) //Chưa có tk và đã điền đủ thông tin thì thêm tk và chuyển sang trang đăng nhập
                {
                    Users.Add(newUser);
                    Response.Redirect("SignIn.aspx");
                }
            }

        }
    }
}