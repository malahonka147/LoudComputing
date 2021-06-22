using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Website
{
    public partial class ThemBlog : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnLuu_Click(object sender, EventArgs e)
        {
            try
            {

                
                string TieuDe = tbTieuDe.Text;
                string NoiDung = HttpUtility.HtmlEncode(Request.Form["tbND"]);

                string TTND = tbTTND.Text;
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
                string HinhAnh = FileUpload1.FileName;

                
                DateTime datetime = DateTime.Now;
                string Ngay = datetime.ToString("MM/dd/yyyy hh:mm:ss");
                
                string str = "insert into Blog values (N'" + HinhAnh + "',N'" + TieuDe + "',N'" + TTND + "',N'" + NoiDung + "',0,'" + Ngay + "',1)";
                XLDL.Excute(str);
                Response.Write("<script>alert('Them thanh cong !!!');</script>");
                Response.Redirect("DanhSachBlog.aspx");
            }
            catch
            {
                Response.Write("<script>alert('Them That Bai !!!');</script>");
            }
        }
    }
}