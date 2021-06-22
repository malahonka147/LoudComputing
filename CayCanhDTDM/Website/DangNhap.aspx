<%@ Page Title="" Language="C#" MasterPageFile="~/Template.Master" AutoEventWireup="true" CodeBehind="DangNhap.aspx.cs" Inherits="Website.DangNhap" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
   
    
    <table style="width:100%;">
    <tr>
        <td class="phantrang" colspan="2" style="font-size: xx-large"><strong>Đăng Nhập</strong></td>
    </tr>
    <tr>
        <td class="auto-style6" style="width: 387px; text-align: right; height: 49px"><strong>Tài Khoản: </strong></td>
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
        <td class="auto-style6" style="width: 387px; text-align: right; height: 61px"></td>
        <td class="kc" style="height: 61px">
            <asp:Button ID="btnDN" runat="server" CssClass="btnDat" OnClick="btnDN_Click" Text="Đăng Nhập" />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WebBanCayCanhConnectionString %>" SelectCommand="SELECT [TenTK], [TenDN], [MatKhau], [LoaiTK] FROM [TaiKhoan]"></asp:SqlDataSource>
            <br />
            <asp:Label ID="lbThongBao" runat="server"></asp:Label>
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
