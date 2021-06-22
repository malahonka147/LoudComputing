<%@ Page Title="" Language="C#" MasterPageFile="~/Template.Master" AutoEventWireup="true" CodeBehind="TinTuc.aspx.cs" Inherits="Website.TinTuc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <asp:DataList ID="DataList2" runat="server" RepeatColumns="4" Width="367px">
        
        <ItemTemplate>
            <div class="blognd">
                <div>
                    <a href='<%# Eval("MaBlog","ChiTietTinTuc.aspx?MaBlog={0}") %>'>
                    <asp:Image ID="Image1" runat="server" Height="151px" ImageAlign="Middle" ImageUrl='<%# "~/Anh/Blog/"+"/"+Eval("HinhAnh") %>' style="margin-right: 0" Width="235px"  CssClass="anh"/>
                    </a>
                </div>
                <div class="kc">
                    <strong>
                    <asp:HyperLink ID="HyperLink1" runat="server" CssClass="Link" NavigateUrl='<%# Eval("MaBlog","ChiTietTinTuc.aspx?MaBlog={0}") %>' style="color: #009900" Text='<%# Eval("TieuDe") %>'></asp:HyperLink>
                    </strong>
                </div>
                <div class="kc">
                    <asp:HyperLink ID="HyperLink2" runat="server" CssClass="Link" NavigateUrl='<%# Eval("MaBlog","ChiTietTinTuc.aspx?MaBlog={0}") %>' style="color: #999999; font-size: small" Text='<%# Eval("TTND") %>'></asp:HyperLink>
                </div>
                <table style="width:100%;">
                    <tr>
                        <td>
                            <asp:Label ID="NgayDangLabel" runat="server" style="font-size: xx-small" Text='<%# Eval("NgayDang","{0:dd/MM/yyyy}") %>' />
                        </td>
                        <td style="text-align: right">
                            <asp:Label ID="NguoiDangLabel" runat="server" style="font-size: xx-small" Text='<%# Eval("TenTK") %>' />
                        </td>
                    </tr>
                </table>
                <br />
                
            </div>
        </ItemTemplate>
        
    </asp:DataList>
    <div class="phantrang">
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WebBanCayCanhConnectionString %>" SelectCommand="SELECT BLOG.MaBlog, BLOG.HinhAnh, BLOG.TieuDe, BLOG.TTND, BLOG.NgayDang, TaiKhoan.TenTK FROM BLOG INNER JOIN TaiKhoan ON BLOG.MaTK = TaiKhoan.MaTK"></asp:SqlDataSource>
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
