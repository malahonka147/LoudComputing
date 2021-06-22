using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Website
{
    public partial class DanhSachBlog : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string sql = "SELECT BLOG.MaBlog, BLOG.HinhAnh, BLOG.TieuDe, BLOG.TTND, BLOG.NoiDung, BLOG.SoLanXem, BLOG.NgayDang, TaiKhoan.TenTK FROM BLOG INNER JOIN TaiKhoan ON BLOG.MaTK = TaiKhoan.MaTK";
            DataTable dt = XLDL.GetData(sql);
            gvBlog.DataSource = dt;
            gvBlog.DataBind();
            

        }

        protected void gvBlog_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvBlog.PageIndex = e.NewPageIndex;
            gvBlog.DataBind();
        }

        protected void btnThem_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ThemBlog.aspx");
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
                    Response.Redirect("DanhSachBlog.aspx");

                }
                catch
                {
                    Response.Write("<script>alert('Xóa Thất Bại!!!');</script>");
                }
            }
        }
    }
}