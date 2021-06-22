    using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Website
{
    public partial class QuanLiThongTin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["TenDN"] == null)
            {


                Response.Write("<script>alert('Bạn chưa đăng nhập');</script>");
                Server.Transfer("Default.aspx", true);



            }
            else if (!IsPostBack)
            {
                loaddata();
            }
        }

        private void loaddata()
        {
            if (Session["MaTK"].ToString() != null)
            {
                string MaTK = Session["MaTK"].ToString();

                string sql = "Select MaTK, TenTK, Email, DiaChi, SDT, TenDN, MatKhau from TaiKhoan Where MaTK=" + MaTK;

                DataTable dt = XLDL.GetData(sql);
                tbMaTK.Text = dt.Rows[0]["MaTK"].ToString();

                tbTenKH.Text = dt.Rows[0]["TenTK"].ToString();
                tbDiaChi.Text = dt.Rows[0]["DiaChi"].ToString();
                tbSDT.Text = dt.Rows[0]["SDT"].ToString();
                tbEmail.Text = dt.Rows[0]["Email"].ToString();

            }
        }

        protected void btnLuu_Click(object sender, EventArgs e)
        {

            try

            {


                string MaTK = Session["MaTK"].ToString();
                
                string tentk = tbTenKH.Text;
                string dc = tbDiaChi.Text;
                string sdt = tbSDT.Text;
                string email = tbEmail.Text;
                



                string sql = "update TaiKhoan set tentk=N'" + tentk + "',DiaChi=N'" + dc + "',sdt='" + sdt + "',email='" + email + "' where MaTK=" + MaTK;
                XLDL.Excute(sql);

                Response.Redirect("QuanLiThongTin.Aspx");
            }
            catch
            {
                Response.Redirect("Default.Aspx");
            }



        }
    }
}
