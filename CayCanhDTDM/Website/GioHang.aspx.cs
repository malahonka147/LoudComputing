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
    
    public partial class GioHang : System.Web.UI.Page
    {
        

        

        protected void Page_Load(object sender, EventArgs e)
        {

            /**/
            if(!IsPostBack)
            {
                loaddata();
                
            }
            







        }
       public void loaddata()
        {
            try
            {
                if (Request.QueryString["MSP"] != null)
                {
                    string MaSP = Request.QueryString["MSP"].ToString();
                    DataTable dt = XL.Docbang("Select TenSP,TienSP from SANPHAM Where MaSP=" + MaSP );
                    string TenSP = dt.Rows[0][0].ToString();

                    int DonGia = int.Parse(dt.Rows[0][1].ToString());
                    int SoLuong = 1;
                    ThemVaoGioHang(MaSP, TenSP, DonGia, SoLuong);

                }
                if (Session["Giohang"] != null)
                {
                    DataTable dt = new DataTable();
                    dt = (DataTable)Session["GioHang"];
                    System.Decimal tongThanhTien = 0;
                    foreach (DataRow r in dt.Rows)
                    {
                        r["Thanhtien"] = Convert.ToInt32(r["SoLuong"]) * Convert.ToDecimal(r["Dongia"]);
                        tongThanhTien += Convert.ToDecimal(r["Thanhtien"]);
                        lbTongThanhTien.Text = tongThanhTien.ToString();
                    }
                    gvGioHang.DataSource = dt;
                    gvGioHang.DataBind();
                }
                angiohang();
            }
            catch
            {

            }
            
            

        }
        public void angiohang()
        {
            if (Session["Giohang"] == null)
            {
                lbThongTinGH.Visible = false;
                lbTC.Visible = false;
                lbVND.Visible = false;
                btnCapNhat.Visible = false;
                btnDathang.Visible = false;
                btnXoaGH.Visible = false;
                btnTTM.Visible = false;
                lbGioHang.Text = "Giỏ hàng rỗng!!!";
            }
        }
        public void ThemVaoGioHang(string MaSP, string TenSP,int DonGia,int SoLuong)
        {
            DataTable dt;
            if (Session["GioHang"] == null)
            {
                dt = new DataTable();
                dt.Columns.Add("MaSP");
                dt.Columns.Add("TenSP");
                dt.Columns.Add("DonGia");
                dt.Columns.Add("SoLuong");
                dt.Columns.Add("ThanhTien");
            }
            else dt = (DataTable)Session["GioHang"];
            int dong = SPDaCoTrongGioHang(MaSP, dt);
            if(dong!= -1)

            {
                dt.Rows[dong]["SoLuong"] = Convert.ToInt32(dt.Rows[dong]["SoLuong"]) + SoLuong;

            }
            else
            {
                DataRow dr = dt.NewRow();
                dr["MaSP"] = MaSP;
                dr["TenSP"] = TenSP;
                dr["DonGia"] = DonGia;
                dr["SoLuong"] = SoLuong;
                dr["ThanhTien"] = DonGia * SoLuong;
                dt.Rows.Add(dr);
            }
            Session["GioHang"] = dt;
        }
        public  static int SPDaCoTrongGioHang(string MaSP,DataTable dt)
        {
            int dong = -1;
            for(int i=0;i<dt.Rows.Count;i++)
            {
                if(dt.Rows[i]["MaSP"].ToString()==MaSP)
                {
                    dong = i;
                    break;
                }
            }
            return dong;
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            
                if (e.CommandName == "Xoa")
                {
                    int chiso = int.Parse(e.CommandArgument.ToString());
                    try
                    {
                        DataTable dt = (DataTable)Session["GioHang"];
                        dt.Rows.RemoveAt(chiso);
                        Session["GioHang"] = dt;
                        
                        
                    
                        Response.Redirect("~/GioHang.aspx");

                    }
                    catch
                    {
                        Response.Redirect("~/GioHang.aspx");
                    }
                }
            
            
        }

        protected void btnXoaGH_Click(object sender, EventArgs e)
        {
            Session["GioHang"] = null;
           
            Response.Redirect("~/GioHang.aspx");
        }

        protected void btnTTM_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Default.aspx");
        }

        protected void btnCapNhat_Click(object sender, EventArgs e)
        {
                try
            {
                DataTable dt = (DataTable)Session["GioHang"];
                foreach (GridViewRow r in gvGioHang.Rows)
                {
                    foreach (DataRow dr in dt.Rows)
                    {
                        if (Convert.ToString(gvGioHang.DataKeys[r.DataItemIndex].Value) == dr["MaSP"].ToString())
                        {
                            TextBox t = (TextBox)r.Cells[2].FindControl("tbSoLuong");

                            if (Convert.ToInt32(t.Text) <= 0)
                                dt.Rows.Remove(dr);
                            else
                                dr["SoLuong"] = t.Text;
                            break;

                        }
                    }
                    Session["GioHang"] = dt;
                    Response.Redirect("~/GioHang.aspx");

                }
            }
            catch
            {
                lbThongBao.Text = "Cập Nhật Thất Bại";
                Response.Redirect("~/GioHang.aspx");
            }
               
            
            
            
        }

        protected void btnDathang_Click(object sender, EventArgs e)
        {
            if (Session["TenDN"] == null)
            {
                Response.Write("<script>alert('Bạn chưa đăng nhập');</script>");
                Server.Transfer("Default.aspx", true);
                
            }
            else Response.Redirect("~/ThanhToan.aspx");

        }
        
    }
}