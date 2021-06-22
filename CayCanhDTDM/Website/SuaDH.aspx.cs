using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Website
{
    public partial class SuaDH : System.Web.UI.Page
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
            if (Request.QueryString["MaDH"] != null)
            {

                string MaBlog = Request.QueryString["MaDH"].ToString();

                string sql = "select MaDH,NgayLapDH,TenKH,DiaChi,SDT,PTTT,ThanhTien from DonHang Where MaDH=" + MaBlog;

                DataTable dt = XLDL.GetData(sql);
                lbNgayLapDH.Text = dt.Rows[0]["NgayLapDH"].ToString();
                tbMaDH.Text = MaBlog;
                tbTenKH.Text = dt.Rows[0]["TenKH"].ToString();
                tbDiaChi.Text = dt.Rows[0]["DiaCHi"].ToString();
                tbSDT.Text = dt.Rows[0]["SDT"].ToString();
                tbPTTT.Text = dt.Rows[0]["PTTT"].ToString();
                tbThanhTien.Text = dt.Rows[0]["ThanhTien"].ToString();

                string sql1 = "SELECT SANPHAM.MaSP, SANPHAM.TenSP, SANPHAM.TienSP, ChiTietDonHang.SL, ChiTietDonHang.MaDH , SANPHAM.TienSP* ChiTietDonHang.SL AS ThanhTien FROM SANPHAM INNER JOIN ChiTietDonHang ON SANPHAM.MaSP = ChiTietDonHang.MaSP WHERE ChiTietDonHang.MaDH = " + MaBlog;

                DataTable dt1 = XLDL.GetData(sql1);
                gvGioHang.DataSource = dt1;
                gvGioHang.DataBind();




            }
        }

        protected void btnLuu_Click(object sender, EventArgs e)
        {



            string MaBlog = Request.QueryString["MaDH"].ToString();
            string ngay = DateTime.Now.ToString("MM/dd/yyyy");

            string ten = tbTenKH.Text;
            string dc = tbDiaChi.Text;
            string sdt = tbSDT.Text;
            string pttt = tbPTTT.Text;
            int tt = int.Parse(tbThanhTien.Text);



            string sql = "update DonHang set NgayLapDH='" + ngay + "',TenKH=N'" + ten + "',DiaChi=N'" + dc + "',SDT='" + sdt + "',PTTT=N'" + pttt + "',ThanhTien="+tt+" where MaDH=" + MaBlog;
            XLDL.Excute(sql);

            Response.Redirect("DonHang.Aspx");
        }

        protected void gvGioHang_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvGioHang.PageIndex = e.NewPageIndex;
            gvGioHang.DataBind();
        }
    }
    }