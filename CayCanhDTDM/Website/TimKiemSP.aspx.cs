using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Website
{
    
    public partial class TimKiemSP : System.Web.UI.Page
    {
        static PagedDataSource p = new PagedDataSource();
        public static int intSTT;
        public static int trangthu = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                trangthu = 0;
                loaddata();
                load_data();
            }
        }
        public void loaddata()
        {


            try
            {
                string nd = Session["TimKiemSP"].ToString();
                
                string sql = "select  LOAISANPHAM.TenLoaiSP, SANPHAM.TenSP, SANPHAM.HinhAnh, SANPHAM.TienSP, SANPHAM.MaSP, LOAISANPHAM.MaLoaiSP,dbo.ufn_removeMark(TenSP) as  tensp_khongdau FROM LOAISANPHAM INNER JOIN SANPHAM ON LOAISANPHAM.MaLoaiSP = SANPHAM.MaLoaiSP   where dbo.ufn_removeMark(tensp) like N'%" + nd + "%' or sanpham.tensp like N'%" + nd + "%'";
                DataTable dt = XLDL.GetData(sql);
                
                string tenspcd = dt.Rows[0]["TenSP"].ToString();
                if (dt.Rows.Count > 0)
                    {
                        lbThongBao.Text = "<p style='font-weight:bold;padding:10px'>Kết quả tìm kiếm: " + nd + "</p>";
                        themdiv.DataSource = XLDL.GetData(sql);
                        themdiv.DataBind();

                    }
                    else
                    {

                        lbThongBao.Text = "<p style='font-weight:bold;padding:10px'>Kết quả tìm kiếm: " + nd + "</p><br>Không tìm thấy sản phẩm.";
                    }
                
            }
            catch
            {
                lbThongBao.Text = "<p style='font-weight:bold;padding:10px'>Kết quả tìm kiếm:</p><br>Không tìm thấy sản phẩm.";
            }
            
                
            
            
            
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            trangthu = 0;
            load_data();
        }

        public void load_data()
        {

            try
            {
                string nd = Session["TimKiemSP"].ToString();
                string sql =  "select  LOAISANPHAM.TenLoaiSP, SANPHAM.TenSP, SANPHAM.HinhAnh, SANPHAM.TienSP, SANPHAM.MaSP, LOAISANPHAM.MaLoaiSP,dbo.ufn_removeMark(TenSP) as  tensp_khongdau FROM LOAISANPHAM INNER JOIN SANPHAM ON LOAISANPHAM.MaLoaiSP = SANPHAM.MaLoaiSP   where dbo.ufn_removeMark(tensp) like N'%" + nd + "%' or sanpham.tensp like N'%" + nd + "%'";

                p.DataSource = XLDL.GetData(sql).DefaultView;


                p.PageSize = 12;

                p.CurrentPageIndex = trangthu;

                p.AllowPaging = true;


                btnDau.Enabled = true;
                btnTruoc.Enabled = true;
                btnSau.Enabled = true;
                btnCuoi.Enabled = true;


                if (p.IsFirstPage == true)

                {

                    btnDau.Enabled = false;
                    btnTruoc.Enabled = false;
                    btnSau.Enabled = true;
                    btnCuoi.Enabled = true;

                }


                if (p.IsLastPage == true)

                {

                    btnDau.Enabled = true;
                    btnTruoc.Enabled = true;
                    btnSau.Enabled = false;
                    btnCuoi.Enabled = false;



                }
                if (p.PageCount == 1)
                {
                    btnDau.Visible = false;
                    btnTruoc.Visible = false;
                    btnSau.Visible = false;
                    btnCuoi.Visible = false;
                    tbTrang.Visible = false;
                }

                tbTrang.Text = (trangthu + 1) + " / " + p.PageCount;


                themdiv.DataSource = p;

                themdiv.DataBind();
            }
            catch
            {
                Response.Redirect("Default.aspx");
            }






        }

        protected void btnTruoc_Click(object sender, EventArgs e)
        {
            if (p.CurrentPageIndex > 0)
            {
                trangthu--;
                load_data();
            }

        }

        protected void btnSau_Click(object sender, EventArgs e)
        {
            trangthu++;
            load_data();

        }

        protected void btnCuoi_Click(object sender, EventArgs e)
        {
            if (p.CurrentPageIndex >= 0)
            {
                trangthu = p.PageCount - 1;
                load_data();
            }



        }
    }
}