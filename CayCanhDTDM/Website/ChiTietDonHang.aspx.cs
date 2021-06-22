using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Website
{
    public partial class ChiTietDonHang : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["TenDN"] == null)
            {

                Response.Write("<script>alert('Bạn chưa đăng nhập');</script>");
                Server.Transfer("Default.aspx", true);

            }
            else
            {
                
                string matk = Session["MaTk"].ToString();
                string ktra = Request.QueryString["MaDH"];
                string sql1 = "sELECT matk FROM DonHang where EXISTS( select matk from taikhoan where DonHang.matk = taikhoan.matk  and donhang.madh= " + ktra + "); ";

                DataTable dt = XLDL.GetData(sql1);

                    if (dt.Rows[0]["matk"].ToString()==matk)
                    {
                        loaddata();
                    }
                    else
                    {
                        Response.Redirect("QuanLiThongTin.aspx");
                    }

                
                
            }
        }

        private void loaddata()
        {
            if (Request.QueryString["MaDH"] != null)
            {

                string MaBlog = Request.QueryString["MaDH"].ToString();

                string sql = "select MaDH,NgayLapDH,TenKH,DiaChi,SDT,PTTT,ThanhTien from DonHang Where MaDH=" + MaBlog;

                DataTable dt = XLDL.GetData(sql);

                string sql1 = "SELECT SANPHAM.MaSP, SANPHAM.TenSP, SANPHAM.TienSP, ChiTietDonHang.SL, ChiTietDonHang.MaDH , SANPHAM.TienSP* ChiTietDonHang.SL AS ThanhTien FROM SANPHAM INNER JOIN ChiTietDonHang ON SANPHAM.MaSP = ChiTietDonHang.MaSP WHERE ChiTietDonHang.MaDH = " + MaBlog;

                DataTable dt1 = XLDL.GetData(sql1);
                gvGioHang.DataSource = dt1;
                gvGioHang.DataBind();




            }
        }

        protected void gvGioHang_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvGioHang.PageIndex = e.NewPageIndex;
            gvGioHang.DataBind();
        }
    }
}