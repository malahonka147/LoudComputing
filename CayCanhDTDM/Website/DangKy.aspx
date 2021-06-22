<%@ Page Title="" Language="C#" MasterPageFile="~/Template.Master" AutoEventWireup="true" CodeBehind="DangKy.aspx.cs" Inherits="Website.DangKy" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <table style="width:100%;">
    <tr>
        <td class="phantrang" colspan="2" style="font-size: xx-large"><strong>Đăng Ký</strong></td>
    </tr>
    <tr>
        <td class="auto-style6" style="width: 387px; text-align: right; height: 49px"><strong>&nbsp;Thông tin tài khoản</strong></td>
        <td style="height: 49px">
            <asp:Label ID="lbThongBao" runat="server"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="auto-style6" style="width: 387px; text-align: right; height: 49px"><strong>Tài Khoản:</strong></td>
        <td style="height: 49px">
            <asp:TextBox ID="tbTK" runat="server" CssClass="input" Height="29px" Width="183px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rpTK" runat="server" ControlToValidate="tbTK" ErrorMessage="Chưa nhập mật khẩu" style="color: #FF0000">*</asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="auto-style6" style="width: 387px; text-align: right; height: 48px"><strong>Mật Khẩu: </strong></td>
        <td style="height: 48px">
            <asp:TextBox ID="tbMK" runat="server" CssClass="input" Height="29px" Width="183px" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rpMK" runat="server" ControlToValidate="tbMK" ErrorMessage="Chưa nhập mật khẩu" style="color: #FF0000">*</asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="auto-style6" style="width: 387px; text-align: right; height: 48px"><strong>Nhập lại mật khẩu</strong></td>
        <td style="height: 48px">
            <asp:TextBox ID="tbNLMK" runat="server" CssClass="input" Height="29px" Width="183px" TextMode="Password"></asp:TextBox>
            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="tbMK" ControlToValidate="tbNLMK" ErrorMessage="Mật khẩu nhập lại không chính xác!!" style="color: #FF0000">*</asp:CompareValidator>
        </td>
    </tr>
    <tr>
        <td class="auto-style6" style="width: 387px; text-align: right; height: 48px"><strong>Thông tin khách hàng</strong></td>
        <td style="height: 48px">
            &nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style6" style="width: 387px; text-align: right; height: 48px"><strong>Họ Tên:</strong></td>
        <td style="height: 48px">
            <asp:TextBox ID="tbTenTK" runat="server" CssClass="input" Height="29px" Width="183px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tbTenTK" ErrorMessage="Chưa nhập họ tên" style="color: #FF0000">*</asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="auto-style6" style="width: 387px; text-align: right; height: 48px"><strong>Email:</strong></td>
        <td style="height: 48px">
            <asp:TextBox ID="tbEmail" runat="server" CssClass="input" Height="29px" Width="183px" TextMode="Email"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="tbEmail" ErrorMessage="Chưa nhập email!!" style="color: #FF0000">*</asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="auto-style6" style="width: 387px; text-align: right; height: 48px"><strong>Địa Chỉ:</strong></td>
        <td style="height: 48px">
            <asp:TextBox ID="tbDiaChi" runat="server" CssClass="input" Height="76px" Width="352px" TextMode="MultiLine"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="tbDiaChi" ErrorMessage="Chưa nhập địa chỉ" style="color: #FF0000">*</asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="auto-style6" style="width: 387px; text-align: right; height: 48px"><strong>SDT:</strong></td>
        <td style="height: 48px">
            <asp:TextBox ID="tbSDT" runat="server" CssClass="input" Height="29px" Width="183px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="tbSDT" ErrorMessage="Chưa nhập SDT" style="color: #FF0000">*</asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="auto-style6" style="width: 387px; text-align: right; height: 61px">&nbsp;</td>
        <td class="kc" style="height: 61px">
            <asp:Button ID="btnDN" runat="server" CssClass="btnDat" OnClick="btnDN_Click" Text="Đăng Ký" />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WebBanCayCanhConnectionString %>" SelectCommand="SELECT [TenTK], [TenDN], [MatKhau], [LoaiTK] FROM [TaiKhoan]"></asp:SqlDataSource>
            <br />
        </td>
    </tr>
    <tr>
        <td class="auto-style6" style="width: 387px; text-align: right; height: 61px"></td>
        <td class="kc" style="height: 61px">
            <asp:ValidationSummary ID="vsThongBao" runat="server" />
        </td>
    </tr>
</table>
</asp:Content>
