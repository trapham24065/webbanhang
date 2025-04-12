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
            // Lấy User từ Session
            User user = (User)Session["User"];
            if (user != null && user.Username != null && user.Email != null)
            {
                userInfo.InnerHtml = "<p class=\"top\">" + user.Username + "</p><p class=\"bottom\">" + user.Email + "</p><p class=\"bottom\"><a href=\"SignOut.aspx\">Đăng Xuất</a></p>";
            }

            List<Product> ProductCart = (List<Product>)Application["ProductCart"];
            List<Product> ProductList = (List<Product>)Application["ProductList"];
            List<Product> relatedProducts = new List<Product>();

            string id = Request.QueryString.Get("id");
            int currentId = int.Parse(id);
            Product currentProduct = null;

            // Tìm sản phẩm hiện tại và phân loại sản phẩm liên quan
            foreach (Product product in ProductList)
            {
                if (product.Id == currentId)
                {
                    currentProduct = product;
                }
            }

            if (currentProduct != null)
            {
                // Hiển thị sản phẩm chính
                List<Product> Details = new List<Product> { currentProduct };
                productData.DataSource = Details;
                productData.DataBind();

                // Lấy nhóm liên quan theo nhóm ID (mỗi nhóm cách nhau 3)
                int groupStart = ((currentId - 1) / 3) * 3 + 1;
                int groupEnd = groupStart + 2;

                foreach (Product product in ProductList)
                {
                    // Loại bỏ chính sản phẩm đang xem khỏi danh sách liên quan
                    if (product.Id != currentId && product.Id >= groupStart && product.Id <= groupEnd)
                    {
                        relatedProducts.Add(product);
                    }
                }

                // Bind danh sách sản phẩm liên quan
                RelatedProducts.DataSource = relatedProducts;
                RelatedProducts.DataBind();
            }

            int countProduct = ProductCart.Count;
            CartCounter.InnerHtml = $"{countProduct}";
        }
    }
    }