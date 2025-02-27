using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BTL.src
{
    //Thêm mặt hàng khi sử dụng trang chi tiết hàng hóa /SingleProduct.aspx/
    public partial class AddByDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Gọi ra danh sách hàng mà mình có
            List<Product> ProductList = (List<Product>)Application["ProductList"];
            List<Product> ProductCart = (List<Product>)Application["ProductCart"];
            //Lấy dữ liệu gồm id hàng, số lượng và kiểu (kiểu ở đây là đi tiếp hay ở lại trang tương ứng với 2 nút add to cart với purchase now)
            string id = Request.QueryString.Get("id");
            string quantities = Request.QueryString.Get("quantities");
            string type = Request.QueryString.Get("type");
            string size = Request.QueryString.Get("size");
            //Thêm biến để xem mặt hàng đã có trong giỏ hàng chưa
            bool checkInCart = false;
            //Tìm trong giỏ hàng của user, có thì tăng số lượng tương ứng với số lượng được gửi qua querystring và kết thúc vòng lặp, trả về biến đã có trong mặt hàng là true
            foreach (Product product in ProductCart)
            {
                if (product.Id == int.Parse(id) && product.Size == size)
                {
                    product.Quantity += int.Parse(quantities);
                    checkInCart = true;
                    break;
                }
            }
            //Nếu chưa có trong mặt hàng (!checkInCart) <=> (checkInCart == false) thì tìm mặt hàng đấy qua ID trong danh sách mặt hàng rồi thêm vào giỏ hàng của user
            if (!checkInCart)
            {
                foreach (Product product in ProductList)
                {
                    if (product.Id == int.Parse(id) )
                    {
                        Product p = new Product(product.Id, product.Name, product.Description, product.Image, product.Price, int.Parse(quantities));
                        p.Size = size;
                        ProductCart.Add(p);
                        break;
                    }
                }
            }
                //Biến kiểu back thì quay lại trang vừa xong và go thì đi tới trang giỏ hàng tiến hành thanh toán
                if (type == "back")
                {
                    Response.Redirect("SingleProduct.aspx?id=" + id);
                }
                else
                {
                    Response.Redirect("Cart.aspx");
                }
        }
    }
}