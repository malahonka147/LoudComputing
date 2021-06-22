using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Website
{
    public partial class KHSuaBlog : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["TenDN"] == null)
                {


                    Response.Write("<script>alert('Bạn chưa đăng nhập');</script>");
                    Server.Transfer("Default.aspx", true);



                }
                else
                {
                    string ktra = Request.QueryString["MaBlog"];
                    string matk = Session["MaTK"].ToString();
                    string sql1 = "sELECT matk FROM Blog where EXISTS( select matk from taikhoan where blog.matk = taikhoan.matk  and blog.mablog= " + ktra + "); ";
                    DataTable dt = XLDL.GetData(sql1);

                    if (dt.Rows[0]["matk"].ToString() == matk)
                    {
                        loaddata();
                    }
                    else
                    {
                        Response.Redirect("Quanlibaiviet.aspx");
                    }

                    
                }
            }


        }

        protected void btnLuu_Click(object sender, EventArgs e)
        {


            try
            {
                string mblog = Request.QueryString["MaBlog"].ToString();
                DateTime datetime = DateTime.Now;
                string ngaycapnhat = datetime.ToString("MM/dd/yyyy hh:mm:ss");

                string tieude = tbTieuDe.Text;
                string nd = HttpUtility.HtmlEncode(Request.Form["tbND"]);


                string ngdang = tbNguoiDang.Text;
                int slx = int.Parse(tbSoLanXem.Text);
                string savePath = MapPath("~/Anh/Blog/");
                if (FileUpload1.HasFile)
                {

                    savePath += FileUpload1.FileName;

                    FileUpload1.SaveAs(savePath);


                    lbThongBao.Text = "Upload ảnh thành công.";


                }
                else
                {

                    lbThongBao.Text = "Ảnh chưa được upload.";
                }
                string ha = FileUpload1.FileName;

                string tbnd = tbTTND.Text;

                string matk = Session["MaTK"].ToString();
                string sql = "update Blog set hinhanh=N'" + ha + "',Tieude=N'" + tieude + "',TTND=N'" + tbnd + "',NoiDung=N'" + nd + "',SoLanXem=" + slx + ",NgayDang='" + ngaycapnhat + "',MaTK=" + matk + " where MaBlog=" + mblog;
                XLDL.Excute(sql);

                Response.Redirect("Quanlibaiviet.Aspx");
            }
            catch
            {
                Response.Write("<script>alert('Sửa Thất Bại !!!');</script>");
            }
            
        }
        private void loaddata()
        {
            if (Request.QueryString["MaBlog"] != null)
            {

                string MaBlog = Request.QueryString["MaBlog"].ToString();

                string sql = "SELECT [MaBlog], [HinhAnh], [TieuDe], [TTND], [NoiDung], [SoLanXem], [NgayDang], [MaTK] FROM [Blog] Where MaBlog=" + MaBlog;

                DataTable dt = XLDL.GetData(sql);
                tbMaBlog.Text = dt.Rows[0]["MaBlog"].ToString();
                tbTieuDe.Text = dt.Rows[0]["TieuDe"].ToString();
                lbnd.Visible = true;
                string nd = dt.Rows[0]["NoiDung"].ToString();
                lbnd.Text = nd;

                tbNguoiDang.Text = dt.Rows[0]["MaTK"].ToString();
                tbSoLanXem.Text = dt.Rows[0]["SoLanXem"].ToString();

                string filename = dt.Rows[0]["HinhAnh"].ToString();

                tbTTND.Text = dt.Rows[0]["TTND"].ToString();

                string matk = dt.Rows[0]["MaTK"].ToString();

                






            }
        }
        }
}