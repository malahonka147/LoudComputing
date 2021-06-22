<%@ Page Title="" Language="C#" MasterPageFile="~/Template.Master" AutoEventWireup="true" CodeBehind="XacNhanDonHang.aspx.cs" Inherits="Website.XacNhanDonHang" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <table style="padding: 25px; width: 96%; height: 182px;">
        <tr>
            <td style="width: 863px">Kính Chào Quý Khách !</td>
        </tr>
        <tr>
            <td style="width: 863px">Thông tin đơn đặt hàng của quý khách đã được chúng tôi ghi nhận.<br />
                Chúng tôi sẽ phản hồi thông tin sớm nhất có thể tới quý khách.<br />
                <br />
                Công ty chúng tôi rất hân hạnh được phục vụ quý khách.<br />
                Khi cần quý khách có thể liên hệ chúng tôi qua số điện thoại của trung tâm chăm sóc khách hàng 03956121358<br />
                <br />
                Xin cảm ơn</td>
        </tr>
        <tr>
            <td style="text-align: right; width: 863px; height: 47px;">
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Default.aspx" CssClass="btnDat">Tiếp Tục Mua Sắm</asp:HyperLink>
            </td>
        </tr>
    </table>
</asp:Content>
