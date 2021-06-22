using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Website
{
    public partial class QuanTriTaiKhoan : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string sql = "Select MaTK,TenTK,Email,DiaChi,SDT,TenDN,MatKhau from TaiKhoan where LoaiTK=2";
            DataTable dt = XLDL.GetData(sql);
            gvSP.DataSource = dt;
            gvSP.DataBind();
        }

        protected void gvSP_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Xoa")
            {
                try
                {
                    int chiso = int.Parse(e.CommandArgument.ToString());

                    string ma = gvSP.Rows[chiso].Cells[0].Text;

                    string str = "Delete from TaiKhoan where MaTK=" + ma;

                    XLDL.Excute(str);
                    Response.Write("<script>alert('Xóa Thành Công!!!');</script>");
                    Response.Redirect("QuanTriTaiKhoan.aspx");

                }
                catch
                {
                    Response.Write("<script>alert('Xóa Thất Bại!!!');</script>");
                }
            }
        }

        protected void gvSP_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvSP.PageIndex = e.NewPageIndex;
            gvSP.DataBind();
        }

        protected void btnThem_Click(object sender, EventArgs e)
        {
            
        }
    }
}