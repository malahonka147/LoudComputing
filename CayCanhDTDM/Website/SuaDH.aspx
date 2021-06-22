<%@ Page Title="" Language="C#" MasterPageFile="~/QuanTri.Master" AutoEventWireup="true" CodeBehind="SuaDH.aspx.cs" Inherits="Website.SuaDH" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <table style="height: 598px;" class="nav-justified" ">
        <tr>
            <td class="text-center" colspan="2">
                <caption class="text-center">
            </td>
        </tr>
                    <strong><span style="font-size: xx-large">Sửa đơn hàng</span></strong><tr>
            <td class="text-left" style="height: 5px; width: 124px"><strong>&nbsp;&nbsp;&nbsp;Mã D</strong><span style="font-weight: bold">H</span></td>
            <td style="height: 5px">
                <asp:TextBox ID="tbMaDH" runat="server" Enabled="False"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="text-left" style="height: 13px; width: 124px">&nbsp;&nbsp; <strong>Ngày Lập DH&nbsp;</strong></td>
            <td style="height: 13px">
                <asp:Label ID="lbNgayLapDH" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="text-left" style="height: 24px; width: 124px"><strong>&nbsp;</strong><b>&nbsp;&nbsp; </b><strong>Tên KH</strong></td>
            <td style="height: 24px">
                <asp:TextBox ID="tbTenKH" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="modal-sm" style="width: 124px; text-align: left; height: 4px;"><strong>&nbsp;&nbsp;&nbsp; Địa Chỉ</strong>&nbsp;&nbsp;&nbsp; </td>
            <td style="height: 4px">
                <asp:TextBox ID="tbDiaChi" runat="server" Height="93px" TextMode="MultiLine" Width="434px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="modal-sm" style="width: 124px; text-align: left; height: 26px;"><strong>&nbsp;&nbsp;&nbsp; S</strong><span style="font-weight: bold">DT</span></td>
            <td style="height: 26px">
                <asp:TextBox ID="tbSDT" runat="server"></asp:TextBox>
   
                
                
   
                
            </td>
            
        </tr>
        <tr>
            <td class="modal-sm" style="width: 124px; text-align: left; height: 39px;"><strong>&nbsp;&nbsp;&nbsp; PTTT&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;</strong></td>
            <td style="height: 39px">
                <asp:TextBox ID="tbPTTT" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="modal-sm" style="width: 124px; text-align: left; height: 13px;">&nbsp; <strong>Thành Tiền&nbsp;</strong></td>
            <td style="height: 13px">
                <asp:TextBox ID="tbThanhTien" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="modal-sm" style="width: 124px; text-align: left; height: 2px;"></td>
            <td style="height: 2px">
                <asp:Button ID="btnLuu" runat="server" CssClass="btnDat" OnClick="btnLuu_Click" Text="Lưu" />
            </td>
        </tr>
    </table>
    <table style="width:100%;">
        
        <tr>
            <td style="padding: 20px">
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
