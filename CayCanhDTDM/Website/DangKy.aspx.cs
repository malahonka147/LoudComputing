using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Website
{
    public partial class DangKy : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnDN_Click(object sender, EventArgs e)
        {
            
            try
            {
                string ktr = @"select 1 from taikhoan where tendn=N'" + tbTK.Text + "'";
                if (XLDL.GetData(ktr).Rows.Count > 0)
                {
                    lbThongBao.Text = "Tên tài khoản đã tồn tại!!!";
                    tbTK.Focus();
                }
                else
                {
                    string tentk = tbTenTK.Text;
                    string email = tbEmail.Text;
                    string dc = tbDiaChi.Text;
                    string sdt = tbSDT.Text;
                    string tendn = tbTK.Text;
                    string mk = tbMK.Text;
                    string sql = "insert into Taikhoan  values (N'" + tentk + "','" + email + "',N'" + dc + "','" + sdt + "','" + tendn + "','" + mk + "',2)";
                    XLDL.Excute(sql);
                    Response.Redirect("DangNhap.aspx");
                }
            }
            catch
            {
                lbThongBao.Text = "Thất bại";
            }
            
            
            
        }
    }
}