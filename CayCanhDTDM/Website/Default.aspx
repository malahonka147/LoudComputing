<%@ Page Title="" Language="C#" MasterPageFile="~/Template.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Website.TrangChu" %>
<%@ Register src="SanPham.ascx" tagname="SanPham" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <div class="sphot">
        <div class="Danhsachsp">
            Sản phẩm bán chạy</div>

        
        <asp:DataList ID="DataList2" runat="server"  RepeatColumns="6">
            
            <ItemTemplate>
                
                <table class="auto-style3">
                    <tr>
                        <td style="text-align: center">
                            <a href="<%# Eval("MaSP", "ChiTietSanPham.aspx?MaSP={0}") %>"><asp:Image ID="Image1" runat="server" Height="267px" ImageUrl='<%# "~/Anh/CayCanh/"+Eval("HinhAnh") %>' Width="244px" CssClass="anh" /></a>
                            &nbsp;<br /><strong>
                            <asp:HyperLink ID="MaSP" runat="server" NavigateUrl='<%# "~/GioHang.aspx?MaSP="+Eval("MaSP") %>' Text='<%# Eval("MaSP") %>' Visible="False"></asp:HyperLink>
                            </strong>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: center"><strong>
                            <asp:HyperLink ID="TenSP" runat="server" CssClass="tenSP" NavigateUrl='<%# Eval("MaSP", "ChiTietSanPham.aspx?MaSP={0}") %>' Text='<%# Eval("TenSP") %>' Width="139px"></asp:HyperLink>
                            </strong></td>
                    </tr>
                    <tr>
                        <td style="text-align: center">
                            <asp:Label ID="Label1" runat="server" style="color: #FF0000" Text='<%# Eval("TienSP") %> '> </asp:Label>
                            <span style="color: #FF0000">VNĐ</span><br /></td>
                    </tr>
                </table>
                

            </ItemTemplate>
            
        </asp:DataList>
            
            
    </div>
        <div class="Danhsachsp">
            Danh sách sản phẩm</div>
    
<asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:WebBanCayCanhConnectionString %>" SelectCommand="SELECT LOAISANPHAM.TenLoaiSP, SANPHAM.TenSP, SANPHAM.HinhAnh, SANPHAM.TienSP, SANPHAM.MaSP, LOAISANPHAM.MaLoaiSP FROM LOAISANPHAM INNER JOIN SANPHAM ON LOAISANPHAM.MaLoaiSP = SANPHAM.MaLoaiSP"></asp:SqlDataSource>

    <asp:DataList ID="DataList3" runat="server" RepeatColumns="3" Width="997px">
        <ItemTemplate>
            <div class="blognd" style="width: 321px">
                <table class="auto-style3">
                    <tr>
                        <td class="auto-style7" rowspan="3"><a href="<%# Eval("MaSP", "ChiTietSanPham.aspx?MaSP={0}") %>">
                            <asp:Image ID="Image1" runat="server" Height="207px" ImageUrl='<%# "~/Anh/CayCanh/"+Eval("HinhAnh") %>' Width="170px" CssClass="anh" />
                            </a></td>
                        <td class="auto-style12">&nbsp;<strong><asp:HyperLink ID="MaSP" runat="server" NavigateUrl='<%# "~/GioHang.aspx?MaSP="+Eval("MaSP") %>' Text='<%# Eval("MaSP") %>' Visible="False"></asp:HyperLink>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong>
                            <asp:HyperLink ID="TenSP" runat="server" Text='<%# Eval("TenSP") %>' NavigateUrl='<%# Eval("MaSP", "ChiTietSanPham.aspx?MaSP={0}") %>' CssClass="tenSP" Width="139px"></asp:HyperLink>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp; <span class="auto-style5"><strong>Giá:</strong></span>
                            <asp:Label ID="GiaSP" runat="server" Text='<%# Eval("TienSP") %>' CssClass="auto-style11" style="color: #FF0000"></asp:Label>
                            <span class="auto-style11" style="color: #FF0000">VNĐ</span></td>
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
    <div class="phantrang">
        <br />
    <asp:Button ID="btnDau" runat="server" OnClick="Button2_Click" Text="Trang Đầu" Height="30px" />
    &nbsp;<asp:Button ID="btnTruoc" runat="server" Text="Trước" Height="30px" OnClick="btnTruoc_Click" Width="50px" />
        <asp:Label ID="tbTrang" runat="server"></asp:Label>
    <asp:Button ID="btnSau" runat="server" Text="Sau" Height="30px" OnClick="btnSau_Click" Width="50px" />
    &nbsp;<asp:Button ID="btnCuoi" runat="server" Text="Trang Cuối" Height="30px" OnClick="btnCuoi_Click" />
        <br />
        <br />
        </div>
        </asp:Content>
