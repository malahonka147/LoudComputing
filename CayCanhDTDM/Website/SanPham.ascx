<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SanPham.ascx.cs" Inherits="Website.SanPham" %>

<style type="text/css">
    .auto-style3 {
        width: 100%;
        height: 166px;
        margin-right: 10px;
    }
    .auto-style5 {
        color: #000000;
        
    }
    
    
    .auto-style7 {
        width: 67px;
    }
    .auto-style10 {
        text-align: center;
    }
    
    
    .auto-style11 {
        color: #FF0000;
    }
    .auto-style12 {
        text-align: left;
    }
    
    
    </style>

<asp:DataList ID="DataList5" runat="server" DataSourceID="SqlDataSource5" Width="240px" RepeatColumns="4" OnItemCommand="DataList1_ItemCommand">
    <ItemTemplate>
        <div class="blognd">
        <table class="auto-style3">
            <tr>
                <td class="auto-style7" rowspan="3">
                    <a href="<%# Eval("MaSP", "ChiTietSanPham.aspx?MaSP={0}") %>"><asp:Image ID="Image1" runat="server" Height="136px" ImageUrl='<%# "~/Anh/CayCanh/"+Eval("TenLoaiSP") +"/"+Eval("HinhAnh") %>' Width="100px" CssClass="anh" /></a>
                </td>
                <td class="auto-style12">&nbsp;<strong><asp:HyperLink ID="MaSP" runat="server" NavigateUrl='<%# "~/GioHang.aspx?MaSP="+Eval("MaSP") %>' Text='<%# Eval("MaSP") %>' Visible="False"></asp:HyperLink>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong><asp:HyperLink ID="TenSP" runat="server" Text='<%# Eval("TenSP") %>' NavigateUrl='<%# Eval("MaSP", "ChiTietSanPham.aspx?MaSP={0}") %>' CssClass="tenSP" Width="139px"></asp:HyperLink>
                </td>
            </tr>
            <tr>
                <td>&nbsp; <span class="auto-style5"><strong>Giá:</strong></span>
                    <asp:Label ID="GiaSP" runat="server" Text='<%# Eval("TienSP") %>' CssClass="auto-style11"></asp:Label>
                    <span class="auto-style11">VNĐ</span></td>
            </tr>
            <tr>
                <td class="auto-style10">
                    <asp:HyperLink ID="HyperLink1" runat="server" CssClass="btnDat" NavigateUrl='<%# "~/GioHang.aspx?MSP="+Eval("MaSP") %>' Font-Underline="false">Đặt Mua</asp:HyperLink>
                </td>
            </tr>
        </table>
        </div>
    </ItemTemplate>
</asp:DataList>
<asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:WebBanCayCanhConnectionString %>" SelectCommand="SELECT LOAISANPHAM.TenLoaiSP, SANPHAM.TenSP, SANPHAM.HinhAnh, SANPHAM.TienSP, SANPHAM.MaSP, LOAISANPHAM.MaLoaiSP FROM LOAISANPHAM INNER JOIN SANPHAM ON LOAISANPHAM.MaLoaiSP = SANPHAM.MaLoaiSP"></asp:SqlDataSource>

