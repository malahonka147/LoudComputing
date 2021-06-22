<%@ Page Title="" Language="C#" MasterPageFile="~/Template.Master" AutoEventWireup="true" CodeBehind="GioHang.aspx.cs" Inherits="Website.GioHang" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <strong>
<br />
&nbsp;&nbsp;&nbsp;
<asp:Label ID="lbGioHang" runat="server" style="color: #FF0000"></asp:Label>
</strong>    <br />
    <table style="width: 100%; height: 365px;" class="ThongTinGioHang" >
        <tr >
            <td  colspan="3" style="text-align: center; font-size: xx-large; height: 70px;">
                <asp:Label ID="lbThongTinGH" runat="server" Font-Bold="True" Text="THÔNG TIN GIỎ HÀNG"></asp:Label>
                <br />
                <asp:Label ID="lbThongBao" runat="server" style="font-size: medium; color: #FF0000"></asp:Label>
            </td>
            <td style="width: 309px; height: 70px;"></td>
        </tr>
        <tr>
            <td colspan="4">
                <asp:GridView ID="gvGioHang" runat="server" AutoGenerateColumns="False" CssClass="gvgiohang" DataKeyNames="MaSP" Width="1016px" CellPadding="3" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" OnRowCommand="GridView1_RowCommand" >
                    <Columns>
                        <asp:BoundField DataField="MaSP" HeaderText="Mã SP"  />
                        <asp:BoundField DataField="TenSP" HeaderText="Tên SP" />
                        <asp:BoundField DataField="DonGia" HeaderText="Đơn Giá" />
                        <asp:BoundField DataField="ThanhTien" HeaderText="Đơn Giá" />
                        <asp:TemplateField HeaderText="Số lượng">
                            <ItemTemplate>
              
                                <asp:TextBox ID="tbSoLuong" runat="server" Text='<%# Eval("SoLuong") %>' Width="50px"  ></asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:ButtonField ButtonType="Image" CommandName="Xoa" ImageUrl="~/Anh/Icon/Delete.jpg" >
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:ButtonField>
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
            <td colspan="2" style="height: 21px;"></td>
            <td class="auto-style6" style="height: 21px; text-align: right;" colspan="2">
                <asp:Label ID="lbTC" runat="server" Text="Tổng cộng:"></asp:Label>
                <asp:Label ID="lbTongThanhTien" runat="server" style="color: #FF0000"></asp:Label>
            &nbsp;
                <asp:Label ID="lbVND" runat="server" Text="VNĐ"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width: 638px; height: 86px; text-align: center;">
                <asp:Button ID="btnTTM" runat="server" Text="Tiếp Tục Mua" CssClass="btnDat" OnClick="btnTTM_Click" />
            </td>
            <td style="width: 1554px; height: 86px; text-align: center;">
                <asp:Button ID="btnXoaGH" runat="server" Text="Xóa Giỏ Hàng" CssClass="btnDat" OnClick="btnXoaGH_Click" />
            </td>
            <td class="auto-style6" style="width: 776px; height: 86px; text-align: center;">
                <asp:Button ID="btnCapNhat" runat="server" Text="Cập Nhật" CssClass="btnDat" OnClick="btnCapNhat_Click" />
            </td>
            <td style="height: 86px; text-align: center; width: 309px;">
                <asp:Button ID="btnDathang" runat="server" Text="Đặt Hàng" CssClass="btnDat" OnClick="btnDathang_Click" />
            </td>
        </tr>
        </table>
</asp:Content>
