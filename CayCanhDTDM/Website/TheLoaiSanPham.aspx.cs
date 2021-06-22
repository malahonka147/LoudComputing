using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Website
{
    public partial class TheLoaiSanPham : System.Web.UI.Page
    {
        static PagedDataSource p = new PagedDataSource();
        public static int intSTT;
        public static int trangthu = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                trangthu = 0;
                load_data();
                loaddata();
                
            }

        }
        public void loaddata()
        {
           try
            {
                string maloai = Request.QueryString["MaLoaiSP"].ToString();
                string sql = "SELECT LOAISANPHAM.TenLoaiSP, SANPHAM.TenSP, SANPHAM.HinhAnh, SANPHAM.TienSP, SANPHAM.MaSP, LOAISANPHAM.MaLoaiSP FROM LOAISANPHAM INNER JOIN SANPHAM ON LOAISANPHAM.MaLoaiSP = SANPHAM.MaLoaiSP where sanpham.maloaisp=" + maloai + " order by Sanpham.MaSP asc";

                DataList3.DataSource = XLDL.GetData(sql);
                DataList3.DataBind();
                string sql1 = "select TenLoaiSP from loaisanpham where MaLoaiSP=" + maloai;
                DataList4.DataSource = XLDL.GetData(sql1);
                DataList4.DataBind();
            }
            catch

            {

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

                string maloai = Request.QueryString["MaLoaiSP"].ToString();
                string sql = "SELECT LOAISANPHAM.TenLoaiSP, SANPHAM.TenSP, SANPHAM.HinhAnh, SANPHAM.TienSP, SANPHAM.MaSP, LOAISANPHAM.MaLoaiSP FROM LOAISANPHAM INNER JOIN SANPHAM ON LOAISANPHAM.MaLoaiSP = SANPHAM.MaLoaiSP where sanpham.maloaisp=" + maloai + " order by Sanpham.MaSP asc";

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


                DataList3.DataSource = p;

                DataList3.DataBind();
            }
            catch
            {
                Response.Redirect("~/TrangChu.aspx");
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