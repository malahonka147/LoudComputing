using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Website
{
    public partial class SuaTK : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loaddata();
            }
        }

        private void loaddata()
        {
            if (Request.QueryString["Ma"] != null)
            {

                string MaBlog = Request.QueryString["Ma"].ToString();

                string sql = "Select MaTK, TenTK, Email, DiaChi, SDT, TenDN, MatKhau from TaiKhoan Where MaTK=" + MaBlog;
                 
                DataTable dt = XLDL.GetData(sql);
                tbMaTK.Text = dt.Rows[0]["MaTK"].ToString();
                tbDN.Text = dt.Rows[0]["TenDN"].ToString();
                tbTenKH.Text = dt.Rows[0]["TenTK"].ToString();
                tbDiaChi.Text = dt.Rows[0]["DiaCHi"].ToString();
                tbSDT.Text = dt.Rows[0]["SDT"].ToString();
                tbEmail.Text = dt.Rows[0]["Email"].ToString();
                tbMK.Text = dt.Rows[0]["MatKhau"].ToString();

            }
        }

        protected void btnLuu_Click(object sender, EventArgs e)
        {
            try

            {


                string MaBlog = Request.QueryString["Ma"].ToString();
                string tendn = tbDN.Text;
                string tentk = tbTenKH.Text;
                string dc = tbDiaChi.Text;
                string sdt = tbSDT.Text;
                string email = tbEmail.Text;
                string mk = tbMK.Text;



                string sql = "update TaiKhoan set tendn='" + tendn + "',tentk=N'" + tentk + "',DiaChi=N'" + dc + "',sdt='" + sdt + "',email='" + email + "',matkhau='" + mk + "' where MaTK=" + MaBlog;
                XLDL.Excute(sql);

                Response.Redirect("QuanTriTaiKhoan.Aspx");
            }
            catch
            {
                Response.Redirect("QuanTriTaiKhoan.Aspx");
            }
        }
    }
}