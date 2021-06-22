using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Website
{
    public partial class QuanTri1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["TenDNAdmin"]!=null)
            {
                lbTenDN.Text = "Xin chào:" + Session["TenDNAdmin"].ToString();
            }
            else
            {
                Response.Write("<script>alert('Đăng Nhập Thất Bại !!!');</script>");
                Response.Redirect("DangNhap.aspx");
            }
        }
    }
}