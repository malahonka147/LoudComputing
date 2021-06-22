using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
namespace Website
{
    public partial class ThemSP : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                DataTable dt = XLDL.GetData("Select MaLoaiSP,TenLoaiSP from LOAISANPHAM");
                if (dt.Rows.Count > 0)
                {
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        rdLSP.Items.Add("i");
                        rdLSP.Items[i].Text = dt.Rows[i][1].ToString();
                        rdLSP.Items[i].Value = dt.Rows[i][0].ToString();
                    }
                }
            }
            
        }

        protected void rdLSP_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }
        
        protected void btnLuu_Click(object sender, EventArgs e)
        {
            
                
                string TenSP = tbTenSP.Text;
                string LoaiSP = rdLSP.SelectedValue.ToString();
                int TienSP = int.Parse(tbDonGia.Text);
                string NCC = HttpUtility.HtmlEncode(tbNCC.Text);

                string mota = HttpUtility.HtmlEncode(Request.Form["tbND"]);
            DataTable dt1 = XLDL.GetData("Select TenLoaiSP from LOAISANPHAM where MaLoaiSP="+LoaiSP);
                
                string savePath = MapPath("~/Anh/CayCanh/"+"/");
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
                string HinhAnh = FileUpload1.FileName;


                DateTime datetime = DateTime.Now;
                string Ngay = datetime.ToString("MM/dd/yyyy");
                int SL = int.Parse(tbSoLuong.Text);
                int SLX =0;
                string str = "insert into SanPham values (" + LoaiSP + ",N'" + TenSP + "',"+SL + ",'"+HinhAnh + "',N'"+NCC+ "',"+TienSP+ ",'"+Ngay+ "',1,"+SLX+ ",N'"+mota+"'"+")";
                XLDL.Excute(str);
                Response.Write("<script>alert('Them thanh cong !!!');</script>");
                Response.Redirect("QuanTri.aspx");
            

        }

        protected void NgayCapNhat_SelectionChanged(object sender, EventArgs e)
        {
            
            
        }

        
        
    }
    }
