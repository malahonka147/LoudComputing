<%@ Page Title="" Language="C#" MasterPageFile="~/Template.Master" AutoEventWireup="true" CodeBehind="ThanhToan.aspx.cs" Inherits="Website.ThanhToan" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <table style="width:100%;">
        <tr>
            <td style="padding: 25px; height: 80px; background-color: #CCFFCC; text-align: center; font-size: xx-large;"><strong>THÔNG TIN GIỎ HÀNG</strong></td>
        </tr>
        <tr>
            <td style="padding: 20px">
                <asp:GridView ID="gvGioHang" runat="server" AutoGenerateColumns="False" CssClass="gvgiohang" DataKeyNames="MaSP" Width="959px" CellPadding="3" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px"  >
                    <Columns>
                        <asp:BoundField DataField="MaSP" HeaderText="Mã SP"  />
                        <asp:BoundField DataField="TenSP" HeaderText="Tên SP" />
                        <asp:BoundField DataField="DonGia" HeaderText="Đơn Giá" />
                        <asp:BoundField DataField="ThanhTien" HeaderText="Đơn Giá" />
                        <asp:TemplateField HeaderText="Số lượng">
                            <ItemTemplate>
              
                                <asp:TextBox ID="tbSoLuong" runat="server" Text='<%# Eval("SoLuong") %>' Width="50px" Enabled="False"  ></asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
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
            <td style="height: 21px; text-align: right; padding-right: 25px;">Tổng Tiền: <asp:Label ID="lbTongTien" runat="server" style="color: #FF0000"></asp:Label>
            &nbsp;VNĐ</td>
        </tr>
    </table>
    <br />
    <table style="width:100%;">
        <tr>
            <td colspan="2" style="padding: 25px; background-color: #CCCCC; height: 52px;"><strong>THÔNG TIN GIAO HÀNG<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WebBanCayCanhConnectionString %>" SelectCommand="SELECT [MaTK], [TenTK], [Email], [DiaChi], [SDT] FROM [TaiKhoan]"></asp:SqlDataSource>
                </strong></td>
        </tr>
        <tr>
            <td class="auto-style13" style="padding: 25px; width: 175px; height: 54px;">Người nhận: </td>
            <td style="height: 54px">
                <asp:TextBox ID="txtTenNguoiNhan" runat="server" Width="395px" Height="30px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtTenNguoiNhan" ErrorMessage="Chưa Chọn Người Nhận!!!" style="color: #FF0000"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style13" style="padding: 25px; width: 175px;">Địa Chỉ: </td>
            <td>
                <asp:TextBox ID="txtDiaChiNhan" runat="server" Width="392px" Height="30px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtDiaChiNhan" ErrorMessage="Chưa Nhập Địa Chỉ Giao Hàng!!!" style="color: #FF0000"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style13" style="padding: 25px; width: 175px;">Điện Thoại: </td>
            <td>
                <asp:TextBox ID="txtDienThoaiNhan" runat="server" Width="389px" Height="30px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtDienThoaiNhan" ErrorMessage="Chưa Nhập Số Điện Thoại!!!" style="color: #FF0000"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style13" style="padding: 25px; width: 175px;">Hình Thức Thanh Toán: </td>
            <td>
                <asp:RadioButtonList ID="rblHinhThucThanhToan" runat="server">
                    <asp:ListItem>Thanh Toán Trực Tiếp</asp:ListItem>
                    <asp:ListItem>Thanh Toán Bằng Thẻ</asp:ListItem>
                </asp:RadioButtonList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="rblHinhThucThanhToan" ErrorMessage="Vui lòng chọn hình thức thanh toán !!!" style="color: #FF0000"></asp:RequiredFieldValidator>
                <br />
            </td>
        </tr>
        <tr>
            <td class="auto-style13" style="padding: 25px; width: 175px;">&nbsp;</td>
            <td style="height: 21px">
                <br />
                <asp:Button ID="btDongY" runat="server" Text="Thanh Toán" OnClick="btDongY_Click" CssClass="btnDat" />
            </td>
        </tr>
    </table>
    <asp:Label ID="lbThongBaoLoi" runat="server"></asp:Label>
    <br />

</asp:Content>
