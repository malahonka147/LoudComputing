using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Website
{
    public partial class DonHang : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string sql = "select MaDH,MaTK,NgayLapDH,TenKH,DiaChi,SDT,PTTT,ThanhTien from DonHang";
            DataTable dt = XLDL.GetData(sql);
            gvBlog.DataSource = dt;
            gvBlog.DataBind();
        }

        protected void gvBlog_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvBlog.PageIndex = e.NewPageIndex;
            gvBlog.DataBind();
        }

        protected void gvBlog_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Xoa")
            {
                try
                {
                    int chiso = int.Parse(e.CommandArgument.ToString());

                    string ma = gvBlog.Rows[chiso].Cells[0].Text;

                    string str = "Delete from DonHang where MaDH=" + ma;

                    XLDL.Excute(str);
                    Response.Write("<script>alert('Xóa Thành Công!!!');</script>");
                    Response.Redirect("DonHang.aspx");

                }
                catch
                {
                    Response.Write("<script>alert('Xóa Thất Bại!!!');</script>");
                }
            }
        }
    }
}