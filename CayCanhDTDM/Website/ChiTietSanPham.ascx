<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ChiTietSanPham.ascx.cs" Inherits="Website.ChiTietSanPham1" %>
<style type="text/css">



    .auto-style1 {
        width: 143px;
    }
    .auto-style4 {
        color: #3333FF;
    }
    .auto-style5 {
        color: #FF0000;
    }
    .auto-style3 {
        height: 49px;
    }
    .auto-style2 {
        height: 23px;
    }
    </style>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WebBanCayCanhConnectionString %>" SelectCommand="SELECT SANPHAM.MaSP, SANPHAM.MaLoaiSP, SANPHAM.TenSP, SANPHAM.SoLuongSP, SANPHAM.HinhAnh, SANPHAM.NhaCC, SANPHAM.TienSP, SANPHAM.Mota, LOAISANPHAM.TenLoaiSP FROM SANPHAM INNER JOIN LOAISANPHAM ON SANPHAM.MaLoaiSP = LOAISANPHAM.MaLoaiSP WHERE (SANPHAM.MaSP = @MaSP)">
    <SelectParameters>
        <asp:QueryStringParameter Name="MaSP" QueryStringField="MaSP" Type="String" />
    </SelectParameters>
</asp:SqlDataSource>
<asp:DataList ID="DataList7" runat="server" DataKeyField="MaSP">
    <ItemTemplate>
        <div class="ndtintuc">
            <table style="width:100%;">
                <tr>
                    <td class="auto-style1" rowspan="3">&nbsp;<asp:Image ID="Image1" runat="server" CssClass="anh" Height="168px" ImageUrl='<%# "~/Anh/CayCanh/"+Eval("TenLoaiSP")+"/"+Eval("HinhAnh") %>' Width="116px" />
                    </td>
                    <td>Tên SP: <strong>
                        <asp:Label ID="TenSPLabel" runat="server" CssClass="auto-style4" Text='<%# Eval("TenSP") %>' />
                        </strong>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td>
                        <br />
                        Đơn Giá:
                        <asp:Label ID="TienSPLabel" runat="server" CssClass="auto-style5" Text='<%# Eval("TienSP") %>' />
                        <br />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:HyperLink ID="HyperLink1" runat="server" CssClass="btnDat" Font-Underline="false" NavigateUrl='<%# "~/GioHang.aspx?MSP="+Eval("MaSP") %>'>Đặt Mua</asp:HyperLink>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <br />
                        &nbsp;<strong>Mô tả</strong></td>
                </tr>
                <tr>
                    <td class="auto-style2" colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="MotaLabel" runat="server" Text='<%# Eval("Mota").ToString().Replace("\n","<br>") %>' />
                    </td>
                </tr>
            </table>
        </div>
        
    </ItemTemplate>
</asp:DataList>


