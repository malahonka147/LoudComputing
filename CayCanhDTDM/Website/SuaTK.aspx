<%@ Page Title="" Language="C#" MasterPageFile="~/QuanTri.Master" AutoEventWireup="true" CodeBehind="SuaTK.aspx.cs" Inherits="Website.SuaTK" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <table style="height: 598px;" class="nav-justified" ">
        <tr>
            <td class="text-center" colspan="2">
                <caption class="text-center">
            </td>
        </tr>
                    <span style="font-size: xx-large">
                    <strong>Sửa Tài Khoản</strong></span><tr>
            <td class="text-left" style="height: 20px; width: 124px"><strong>&nbsp;&nbsp;&nbsp; Mã TK</strong>&nbsp;&nbsp; <strong>&nbsp;</strong></td>
            <td style="height: 20px">
                <asp:TextBox ID="tbMaTK" runat="server" Enabled="False"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="text-left" style="height: 24px; width: 124px"><strong>&nbsp;</strong><b>&nbsp;&nbsp; </b><strong>Tên KH</strong></td>
            <td style="height: 24px">
                <asp:TextBox ID="tbTenKH" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="modal-sm" style="width: 124px; text-align: left; height: 13px;"><strong>&nbsp;&nbsp;&nbsp; Địa Chỉ</strong>&nbsp;&nbsp;&nbsp; </td>
            <td style="height: 13px">
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
            <td class="modal-sm" style="width: 124px; text-align: left; height: 12px;"><strong>&nbsp;&nbsp;&nbsp; Email</strong></td>
            <td style="height: 12px">
                <asp:TextBox ID="tbEmail" runat="server" Width="283px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="modal-sm" style="width: 124px; text-align: left; height: 13px;">&nbsp; <strong>Tên DN</strong></td>
            <td style="height: 13px">
                <asp:TextBox ID="tbDN" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="modal-sm" style="width: 124px; text-align: left; height: 13px;">&nbsp;<strong> Mật Khẩu&nbsp;</strong></td>
            <td style="height: 13px">
                <asp:TextBox ID="tbMK" runat="server"></asp:TextBox>
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
                &nbsp;</td>
        </tr>
        <tr>
            <td style="height: 21px; text-align: right; padding-right: 25px;">&nbsp;&nbsp;</td>
        </tr>
    </table>
</asp:Content>
