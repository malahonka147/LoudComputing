<%@ Page Title="" Language="C#" MasterPageFile="~/Template.Master" AutoEventWireup="true" CodeBehind="QuanLiThongTin.aspx.cs" Inherits="Website.QuanLiThongTin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="left" runat="server">

    <div class="leftthongtin">
        <br />
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
    <table style="height: 598px;" class="nav-justified" ">
        <tr>
            <td class="text-center" colspan="2">
                <caption class="text-center">
            </td>
        </tr>
                    <span style="font-size: xx-large">
                    <strong>&nbsp;<br />
                    Thông Tin Tài Khoản</strong></span><tr>
            <td class="text-left" style="height: 46px; width: 124px"><strong>&nbsp;&nbsp;&nbsp; Mã TK</strong>&nbsp;&nbsp; <strong>&nbsp;</strong></td>
            <td style="height: 46px" class="auto-style46">
                <asp:TextBox ID="tbMaTK" runat="server" Enabled="False" Height="32px" Width="204px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="text-left" style="height: 37px; width: 124px"><strong>&nbsp;</strong><b>&nbsp;&nbsp; </b><strong>Tên KH</strong></td>
            <td style="height: 37px">
                <asp:TextBox ID="tbTenKH" runat="server" Height="32px" Width="204px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="modal-sm" style="width: 124px; text-align: left; height: 75px;"><strong>&nbsp;&nbsp;&nbsp; Địa Chỉ</strong>&nbsp;&nbsp;&nbsp; </td>
            <td style="height: 75px" class="auto-style46">
                <asp:TextBox ID="tbDiaChi" runat="server" Height="93px" TextMode="MultiLine" Width="434px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="modal-sm" style="width: 124px; text-align: left; height: 53px;"><strong>&nbsp;&nbsp;&nbsp; S</strong><span style="font-weight: bold">DT</span></td>
            <td style="height: 53px">
                <asp:TextBox ID="tbSDT" runat="server" Height="32px" Width="204px"></asp:TextBox>
   
                
                
   
                
            </td>
            
        </tr>
        <tr>
            <td class="modal-sm" style="width: 124px; text-align: left; height: 26px;"><strong>&nbsp;&nbsp;&nbsp; Email</strong>&nbsp; &nbsp;<strong> </strong></td>
            <td style="height: 26px">
                <asp:TextBox ID="tbEmail" runat="server" Width="254px" Height="32px" TextMode="Email"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="modal-sm" style="width: 124px; text-align: left; height: 120px;"></td>
            <td style="height: 120px">
                <asp:Button ID="btnLuu" runat="server" CssClass="btnDat" OnClick="btnLuu_Click" Text="Lưu" />
            </td>
        </tr>
    </table>
    </asp:Content>
