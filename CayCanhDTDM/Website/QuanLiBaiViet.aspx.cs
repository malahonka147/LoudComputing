using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Website
{
    public partial class QuanLiBaiViet : System.Web.UI.Page
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
                string sql = "SELECT BLOG.MaBlog, BLOG.HinhAnh, BLOG.TieuDe, BLOG.TTND, BLOG.NoiDung, BLOG.SoLanXem, BLOG.NgayDang, TaiKhoan.TenTK FROM BLOG INNER JOIN TaiKhoan ON BLOG.MaTK = TaiKhoan.MaTK where taikhoan.matk=" + matk;
                DataTable dt = XLDL.GetData(sql);
                gvBlog.DataSource = dt;
                gvBlog.DataBind();
            }
        }

        protected void gvBlog_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Xoa")
            {
                try
                {
                    int chiso = int.Parse(e.CommandArgument.ToString());

                    string ma = gvBlog.Rows[chiso].Cells[0].Text;

                    string str = "Delete from BLog where MaBlog=" + ma;

                    XLDL.Excute(str);
                    Response.Write("<script>alert('Xóa Thành Công!!!');</script>");
                    Response.Redirect("quanlibaiviet.aspx");

                }
                catch
                {
                    Response.Write("<script>alert('Xóa Thất Bại!!!');</script>");
                }
            }
        }

        protected void gvBlog_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvBlog.PageIndex = e.NewPageIndex;
            gvBlog.DataBind();
        }

        protected void btnThem_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/KHThemBlog.aspx");
        }
    }
}