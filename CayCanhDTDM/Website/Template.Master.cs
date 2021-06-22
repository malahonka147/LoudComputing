using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace Website
{
    public partial class Template : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                
                loaddata();
                if(Session["TenDN"]!=null)
                {
                    hpDN.Visible = false;
                    hpDK.Visible = false;
                    lbTenDN.Text = "Xin chào: ";
                    if (Session["MaTK"].ToString() != null)
                    {
                        string MaTK = Session["MaTK"].ToString();

                        string sql = "Select MaTK, TenTK, Email, DiaChi, SDT, TenDN, MatKhau from TaiKhoan Where MaTK=" + MaTK;

                        DataTable dt = XLDL.GetData(sql);
                        string tentk= dt.Rows[0]["TenTK"].ToString();
                        hpTenDN.InnerText = tentk;
                    }
                    
                    hpDX.Visible = true;
                }
                else
                {
                    hpDN.Visible = true;
                    hpDK.Visible = true;
                    hpDX.Visible = false;
                    hpTenDN.Visible = false;
                    lbTenDN.Visible = false;
                    
                }
                if (Session["Giohang"] != null)
                {
                    DataTable dt = new DataTable();
                    dt = (DataTable)Session["GioHang"];
                    System.Decimal tongThanhTien = 0;
                    foreach (DataRow r in dt.Rows)
                    {
                        r["Thanhtien"] = Convert.ToInt32(r["SoLuong"])
                       * Convert.ToDecimal(r["Dongia"]);
                        tongThanhTien +=
                       Convert.ToDecimal(r["Thanhtien"]);
                        lbTongThanhTien.Text = " | " + tongThanhTien.ToString();
                    }
                }
            }
            
        }
        public void loaddata()
        {
            try
            {
                string sql = "SELECT [MaLoaiSP],[TenLoaiSP] FROM[LOAISANPHAM]";

                Danhmuc.DataSource = XLDL.GetData(sql);
                Danhmuc.DataBind();

                DataList1.DataSource = XLDL.GetData(sql);
                DataList1.DataBind();

                string sql1 = "SELECT top(2) [MaBlog], [HinhAnh], [NgayDang],[TieuDe], [TTND] FROM [BLOG] order by [NgayDang] desc";
                DataList2.DataSource = XLDL.GetData(sql1);
                DataList2.DataBind();
            }
            catch
            {

            }
            

            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string nd = tbNDTimKiem.Text;

            Session["TimKiemSP"] = nd;
            Response.Redirect("~/TimKiemSP.aspx");
            
        }

        
       

        protected void hpDX_Click1(object sender, EventArgs e)
        {
            Session["TenDN"] = null;
            Session["MaTK"] = null;
            Session["GioHang"] = null;
            Response.Redirect("Default.aspx");
        }

        
    }
}