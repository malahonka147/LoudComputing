using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Website
{
    public partial class QuanLiDonHang : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["TenDN"] == null)
            {


                Response.Write("<script>alert('Bạn chưa đăng nhập');</script>");
                Server.Transfer("Default.aspx", true);



            }
            else
            {
                string matk = Session["MaTK"].ToString();
                string sql = "select MaDH,MaTK,NgayLapDH,TenKH,DiaChi,SDT,PTTT,ThanhTien from DonHang where MaTK=' " + matk + "'";
                DataTable dt = XLDL.GetData(sql);
                gvBlog.DataSource = dt;
                gvBlog.DataBind();
            }
            
        }

        protected void gvBlog_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvBlog.PageIndex = e.NewPageIndex;
            gvBlog.DataBind();
        }
    }
}