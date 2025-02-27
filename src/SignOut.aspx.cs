using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace BTL.src
{
    public partial class SignOut : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            User user = (User)Session["User"];
            List<User> Users = (List<User>)Application["Users"];
            int index = Users.FindIndex(u => u.Username == user.Username);
            List<Product> ProductCart = (List<Product>)Application["ProductCart"];
            Users[index].userCart.Clear();
            Users[index].userCart = new List<Product>();
            foreach (Product product in ProductCart)
            {
                Users[index].userCart.Add(product);
            }
            ProductCart.Clear();
            ProductCart = new List<Product>();
            //Đưa session user về dữ liệu = null
            user.Username = null;
            user.Password = null;
            user.Email = null;

            Response.Redirect("Home.aspx");
        }
    }
}