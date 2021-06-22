using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Website
{
    public partial class QuanTri : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string sql = "Select MaSP,TenSP,TienSP,NgayCapNhat,SoLuongBan,SoLanXem from sanpham";
            DataTable dt= XLDL.GetData(sql);
            gvSP.DataSource = dt;
            gvSP.DataBind();
            
        }

        protected void gvSP_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvSP.PageIndex = e.NewPageIndex;
            gvSP.DataBind();
        }

        protected void btnThem_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ThemSP.aspx");
        }

        protected void gvSP_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Xoa")
            {
               try
                {
                    int chiso = int.Parse(e.CommandArgument.ToString());

                    string ma = gvSP.Rows[chiso].Cells[0].Text;

                    string str = "Delete from SanPham where MaSP=" + ma ;

                    XLDL.Excute(str);
                    Response.Write("<script>alert('Xóa Thành Công!!!');</script>");
                    Response.Redirect("QuanTri.aspx");

                }
                catch
                {
                    Response.Write("<script>alert('Xóa Thất Bại!!!');</script>");
                }
            }
        }
    }
}