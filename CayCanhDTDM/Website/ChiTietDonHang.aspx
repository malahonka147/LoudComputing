<%@ Page Title="" Language="C#" MasterPageFile="~/Template.Master" AutoEventWireup="true" CodeBehind="ChiTietDonHang.aspx.cs" Inherits="Website.ChiTietDonHang" %>
<asp:Content ID="Content1" ContentPlaceHolderID="left" runat="server">
    <div class="leftthongtin">
        <table style="width: 100%; height: 178px;">
            <tr>
                <td class="tieude phantrang" style="height: 43px"><strong>Quản lí tài khoản</strong></td>
            </tr>
            <tr>
                <td style="text-align: left;">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:HyperLink ID="hpThongTin" runat="server" NavigateUrl="~/QuanLiThongTin.aspx">Thông tin tài khoản</asp:HyperLink>
                </td>
            </tr>
            
            <tr>
                <td style="text-align: left;">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:HyperLink ID="hpDoiMK" runat="server" NavigateUrl="~/DoiMatKhau.aspx">Đổi Mật Khẩu</asp:HyperLink>
                </td>
            </tr>
            
            <tr>
                <td style="height: 28px; text-align: left;" >
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:HyperLink ID="hpDonHang" runat="server" NavigateUrl="~/QuanLiDonHang.aspx">Quản lí đơn hàng</asp:HyperLink>
                </td>
            </tr>
            
            <tr>
                <td style="text-align: left">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:HyperLink ID="hpBaiViet" runat="server" NavigateUrl="~/QuanLiBaiViet.aspx">Quản lí bài viết</asp:HyperLink>
                </td>
            </tr>
        </table>
    </div>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <table style="width:100%;">
        
        <tr>
            <td style="padding: 20px">
                <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
                <asp:GridView ID="gvGioHang" runat="server" AutoGenerateColumns="False" CssClass="gvgiohang" DataKeyNames="MaDH" Width="959px" CellPadding="3" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" OnPageIndexChanging="gvGioHang_PageIndexChanging"  >
                    <Columns>
                        <asp:BoundField DataField="MaSP" HeaderText="Mã SP"  />
                        <asp:BoundField DataField="TenSP" HeaderText="Tên SP" />
                        <asp:BoundField DataField="TienSP" HeaderText="Đơn Giá" />
                        <asp:BoundField DataField="SL" HeaderText="Số Lượng" />
                        <asp:BoundField DataField="ThanhTien" HeaderText="Thành Tiền" />
                        <asp:TemplateField HeaderText="Sửa" Visible="False"></asp:TemplateField>
                        <asp:ButtonField ButtonType="Image" CommandName="Xoa" HeaderText="Xóa" ImageUrl="~/Anh/Icon/Delete.jpg" Text="Xóa" Visible="False" />
                    </Columns>
                    <FooterStyle BackColor="White" ForeColor="#000066" />
                    <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                    <RowStyle ForeColor="#000066" Height="40px" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#007DBB" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#00547E" />
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td style="height: 21px; text-align: right; padding-right: 25px;">&nbsp;&nbsp;</td>
        </tr>
    </table>
</asp:Content>
