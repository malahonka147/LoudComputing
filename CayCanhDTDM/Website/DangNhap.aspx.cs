using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Website
{
    public partial class DangNhap : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnDN_Click(object sender, EventArgs e)
        {
            try
            {
                DataTable dt = XLDL.GetData("SELECT [MaTK], [TenTK], [TenDN], [MatKhau], [LoaiTK] FROM [TaiKhoan] where TenDN='" + tbTK.Text + "' and MatKhau='" + tbMK.Text + "'") ;
                if(dt.Rows.Count>0)
                {
                    int LTK = int.Parse(dt.Rows[0]["LoaiTK"].ToString());
                    if(LTK == 1)
                    {
                        Session["TenDNAdmin"] = tbTK.Text;
                        Response.Redirect("~/QuanTri.aspx");
                    }
                    else if(LTK ==2)
                    {
                        Session["TenDN"] = tbTK.Text;
                        Session["MaTK"] = dt.Rows[0]["MaTK"];
                        Response.Redirect("Default.aspx");
                    }
                    
                }
                else lbThongBao.Text = "Tên đăng nhập hoặc mật khẩu khoặc chính xác!!!";

            }
            catch
            {
                lbThongBao.Text = "Thất Bại";
            }
        }
    }
}