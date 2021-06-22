<%@ Page Title="" Language="C#" MasterPageFile="~/Template.Master" AutoEventWireup="true" CodeBehind="KHThemBlog.aspx.cs" Inherits="Website.KHThemBlog" %>
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
    <table style="height: 598px;" class="nav-justified" ">
        <tr>
            <td class="text-center" colspan="2">
                <h1><strong>THÊM MỚI </strong>BLOG</h1>
            </td>
        </tr>
        <tr>
            <td class="text-left" style="height: 34px; width: 124px"><strong>&nbsp;&nbsp;&nbsp; </strong><b>T</b><span style="font-weight: bold">iêu Đề</span></td>
            <td style="height: 34px">
                <asp:TextBox ID="tbTieuDe" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="modal-sm" style="width: 124px; text-align: left; height: 58px;"><strong>&nbsp;&nbsp;&nbsp; T</strong><span style="font-weight: bold">T ND</span>&nbsp;&nbsp;&nbsp; </td>
            <td style="height: 58px">
                <asp:TextBox ID="tbTTND" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="modal-sm" style="width: 124px; text-align: left; height: 105px;"><strong>&nbsp;&nbsp;&nbsp; Nội Dung</strong></td>
            <td style="height: 105px">
                &nbsp;
                
                <asp:Label ID="lbnd" runat="server" CssClass="lbnd"></asp:Label>
                &nbsp;<textarea id="tbND" name="tbND" style="width: 465px; height: 100px" ></textarea>
                 <script>
                
                CKEDITOR.replace('tbND');
               CKFinder.setupCKEditor(null, '/ckfinder');

                var nd = document.getElementById('<%= lbnd.ClientID %>').innerHTML;
                document.getElementById('tbND').innerHTML =nd;
                </script>

            </td>
            
        </tr>
        <tr>
            <td class="modal-sm" style="width: 124px; text-align: left; height: 31px;"><strong>&nbsp;&nbsp;&nbsp; Hình Minh Họa&nbsp;&nbsp;&nbsp; </strong></td>
            <td style="height: 31px">
                <asp:FileUpload ID="FileUpload1" runat="server" Width="348px" Height="27px" />
&nbsp;
        <strong>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="FileUpload1" ErrorMessage="Chưa chọn ảnh!!!" style="color: #FF0000"></asp:RequiredFieldValidator>
                <br />
                <asp:Label ID="lbThongBao" runat="server"></asp:Label>
                </strong>
            </td>
        </tr>
        <tr>
            <td class="modal-sm" style="width: 124px; text-align: left; height: 6px;"></td>
            <td style="height: 6px">
                <asp:Button ID="btnLuu" runat="server" CssClass="btnDat" OnClick="btnLuu_Click" Text="Lưu" />
            </td>
        </tr>
    </table>
</asp:Content>
