using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Website
{
    public partial class DoiMatKhau : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["TenDN"] == null)
            {


                Response.Write("<script>alert('Bạn chưa đăng nhập');</script>");
                Server.Transfer("Default.aspx", true);



            }
        }

        protected void btnLuu_Click(object sender, EventArgs e)
        {
            try

            {
                
                    string MaBlog = Session["MaTK"].ToString();

                    string mkc = tbMK.Text;
                    string mkm = tbMKM.Text;
                    string str = @"Select Matkhau from taikhoan where matk=" + MaBlog;
                if (XLDL.GetData(str).Rows[0]["MatKhau"].ToString() == mkc)
                {
                    string sql = "update TaiKhoan set matkhau='" + mkm + "' where MaTK=" + MaBlog;
                    XLDL.Excute(sql);

                    Response.Redirect("DoiMatKhau.Aspx");
                }
                else lbThongBao.Text = "Mật khẩu cũ không chính xác.";
                

                
                

                
            }
            catch
            {
                Response.Redirect("Default.aspx");
            }
        }
    }
}