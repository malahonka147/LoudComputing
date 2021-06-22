using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Website
{
    public partial class ChiTietTinTuc : System.Web.UI.Page
    {
        static PagedDataSource p = new PagedDataSource();
        public static int intSTT;
        public static int trangthu=0;

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
                string mablog = Request.QueryString["MaBlog"].ToString();
                string sql = "SELECT [MaBlog], [HinhAnh], [TieuDe], [NoiDung], [NgayDang], [MaTK] FROM [BLOG] Where MaBlog=" + mablog;
                DataList5.DataSource = XLDL.GetData(sql);
                DataList5.DataBind();
            }
            catch
            {
            }
            
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            
                if (Session["TenDN"] == null)
                {
                    lbThongBao.Text = "Vui lòng đăng nhập trước khi bình luận!!!";
                }
                else
                {
                 string nd = HttpUtility.HtmlEncode(Request.Form["tbND"]);
                if (nd == "")
                {
                    lbThongBao.Text = "Chưa nhập nội dung!!!";
                }
                else
                {
                    string ten = Session["TenDN"].ToString();
                    string sql = "SELECT [MaTK], [TenDN] FROM [TaiKhoan] where TenDN=N'" + ten + "'";
                    DataTable dt = XLDL.GetData(sql);
                    string matk = dt.Rows[0]["MaTK"].ToString();


                    string mablog = Request.QueryString["MaBlog"].ToString();


                    
                    string ngay = DateTime.Now.ToString("MM/dd/yyyy HH:mm:ss");
                    string sql1 = "Insert into BinhLuanBLog values (" + mablog + "," + matk + ",'" + ngay + "',N'" + nd + "')";
                    XLDL.Excute(sql1);
                    Response.Redirect("ChiTietTinTuc.aspx?MaBlog=" + mablog);
                    }
                     
                   
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

            
                string mablog = Request.QueryString["MaBlog"].ToString();
                string sql = "SELECT BinhLuanBlog.MaBlog, BinhLuanBlog.NgayBL, BinhLuanBlog.NoiDungBL, TaiKhoan.TenTK FROM BinhLuanBlog INNER JOIN TaiKhoan ON BinhLuanBlog.MaTK = TaiKhoan.MaTK where binhluanBlog.MaBlog='" + mablog + "' order by binhluanblog.NgayBL desc";


                p.DataSource = XLDL.GetData(sql).DefaultView;

                p.PageSize = 5;

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


                DataList4.DataSource = p;

                DataList4.DataBind();
            }
            catch
            {
                Response.Redirect("Default.aspx");
            }





        }

        protected void btnTruoc_Click(object sender, EventArgs e)
        {
            if(p.CurrentPageIndex>0)
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
            if(p.CurrentPageIndex>=0)
            {
                trangthu = p.PageCount - 1;
                load_data();
            }
            

           
        }

 
    }
}