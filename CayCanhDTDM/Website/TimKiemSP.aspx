<%@ Page Title="" Language="C#" MasterPageFile="~/Template.Master" AutoEventWireup="true" CodeBehind="TimKiemSP.aspx.cs" Inherits="Website.TimKiemSP" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <br>
    <asp:Label ID="lbThongBao" runat="server" ></asp:Label>
    <asp:DataList ID="themdiv" runat="server" RepeatColumns="3" Width="997px">
        
        <ItemTemplate>
            <div class="blognd" style="width: 320px">
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
    <div class="phantrang" style="text-align: center">
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
