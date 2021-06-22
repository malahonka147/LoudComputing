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
    public partial class ThanhToan : System.Web.UI.Page
    {
        int tt;
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (Session["GioHang"] == null)
                Response.Redirect("~/GioHang.aspx");
            if(Session["TenDN"]==null)
            {
                Response.Redirect("~/Default.aspx");
            }
            loaddata();
            if (Session["GioHang"] != null)
            {
                DataTable dt = new DataTable();
                dt = (DataTable)Session["GioHang"];
                System.Decimal tongThanhTien = 0;
                foreach (DataRow r in dt.Rows)
                {
                    r["Thanhtien"] = Convert.ToInt32(r["SoLuong"]) * Convert.ToDecimal(r["Dongia"]);
                    tongThanhTien += Convert.ToDecimal(r["Thanhtien"]);
                    lbTongTien.Text = tongThanhTien.ToString();
                }

                gvGioHang.DataSource = dt;
                gvGioHang.DataBind();
                tt = int.Parse(tongThanhTien.ToString());
            }
            

        }
        public void loaddata()
        {
            string matk=Session["MaTK"].ToString();
            string sql = "SELECT [MaTK], [TenTK], [Email], [DiaChi], [SDT] FROM [TaiKhoan] where MaTK="+matk;
            DataTable dt = XLDL.GetData(sql);

            txtTenNguoiNhan.Text=dt.Rows[0]["TenTK"].ToString();
            txtDienThoaiNhan.Text=dt.Rows[0]["SDT"].ToString();
            txtDiaChiNhan.Text = dt.Rows[0]["DiaChi"].ToString();
           
        }

        protected void btDongY_Click(object sender, EventArgs e)
        {
            //int httt; 
            ////int htgh;
            //string TenNguoiNhan, DiaChiNhan, DienThoaiNhan;
            //TenNguoiNhan = txtTenNguoiNhan.Text;
            //DiaChiNhan = txtDiaChiNhan.Text;
            //DienThoaiNhan = txtDienThoaiNhan.Text;
            //float tongThanhTien = float.Parse(lbTongTien.Text);
            //httt = Convert.ToInt32(rblHinhThucThanhToan.SelectedItem.Value);
            //htgh = Convert.ToInt32(rblHinhThucGiaoHang.SelectedItem.Value);
            try
            {
                //SqlConnection con = new SqlConnection(XLDL.strCon);
                //con.Open();
                //SqlCommand cmd = new SqlCommand();
                //cmd.CommandType = CommandType.Text;
                //cmd.Connection = con;

                //cmd.CommandText = @"INSERT INTO DONDATHANG (MaKH,TriGia,TenNguoiNhan,DiaChiNhan,DienThoaiNhan,HTThanhToan) Values(" + MaKH + ", @ngaydathang," + tongThanhTien + ",@ngaygiaohang,'" + TenNguoiNhan + "','" + DiaChiNhan + "','" + DienThoaiNhan + "','" + httt + ")";
                ////cmd.Parameters.Add("@ngaydathang", SqlDbType.SmallDateTime);
                ////cmd.Parameters["@ngaydathang"].Value = DateTime.Today;
                ////cmd.Parameters.Add("@ngaygiaohang", SqlDbType.SmallDateTime);
                ////cmd.Parameters["@ngaygiaohang"].Value = DateTime.Today;
                //cmd.ExecuteNonQuery();
                //con.Close();

                //string s = "SELECT max(SoDH) from DONDATHANG Where MaKH=" + MaKH;
                //int SoDonHang = int.Parse(XLDL.GetData(s).Rows[0][0].ToString());
                //DataTable dt = new DataTable();
                //dt = (DataTable)Session["GioHang"];
                //int MaSach, SoLuong;
                //float DonGia;

                //for(int i=0;i< dt.Rows.Count; i++)
                //{
                //    MaSach = int.Parse(dt.Rows[i]["MaSach"].ToString());
                //    SoLuong = int.Parse(dt.Rows[i]["SoLuong"].ToString());
                //    DonGia = int.Parse(dt.Rows[i]["DonGia"].ToString());
                //    s = "INSERT INTO CTDATHANG(SoDH, MaSach, SoLuong, DonGia) VALUES (" + SoDonHang + "," + MaSach + "," + SoLuong + "," + DonGia + ")";
                //    XLDL.Excute(s);

                //}
                string ten = txtTenNguoiNhan.Text;
                string dc = txtDiaChiNhan.Text;
                string sdt = txtDienThoaiNhan.Text;
                string pttt = rblHinhThucThanhToan.SelectedValue.ToString();
                string ngay = DateTime.Now.ToString("MM/dd/yyyy");
                string matk = Session["MaTK"].ToString();
                string sql = "insert into DonHang(MaTK,NgayLapDH,TenKH,DiaChi,SDT,PTTT,ThanhTien)  values(" + matk + ",'" + ngay + "',N'" + ten + "',N'" + dc + "','" + sdt + "',N'" + pttt + "'," + tt + ")";

                XLDL.Excute(sql);



                string s = " SELECT Max(MaDH) from DonHang ";



                int SoDonHang = int.Parse(XLDL.GetData(s).Rows[0][0].ToString());
                Response.Write(SoDonHang);
                DataTable dt = new DataTable();
                dt = (DataTable)Session["GioHang"];
                int MaSP, SoLuong;


                for (int i = 0; i < dt.Rows.Count; i++)
                {

                    MaSP = int.Parse(dt.Rows[i]["MaSP"].ToString());
                    SoLuong = int.Parse(dt.Rows[i]["SoLuong"].ToString());

                    s = "INSERT INTO ChiTietDonHang VALUES (" + SoDonHang + "," + MaSP + "," + SoLuong + ")";

                    XLDL.Excute(s);

                }

                Session["GioHang"] = null;
                
                Response.Redirect("~/XacNhanDonHang.aspx");
            }
            catch
            {
                lbThongBaoLoi.Text = "Loi trong qua trinh cap nhat du lieu";
            }
        }
    }
}