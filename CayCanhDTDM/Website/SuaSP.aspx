<%@ Page Title="" Language="C#" MasterPageFile="~/QuanTri.Master" AutoEventWireup="true" CodeBehind="SuaSP.aspx.cs" Inherits="Website.SuaSP" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
    <table  style="height: 598px; width: 100%;" class="nav-justified" ">
        <tr>
            <td class="text-center" colspan="2">
                <h1><strong>SỬA SẢN PHẨM</strong></h1>
            </td>
        </tr>
        <tr>
            <td class="text-left" style="height: 40px; width: 233px"><strong>&nbsp;&nbsp;&nbsp; Mã Sản Phẩm</strong></td>
            <td style="height: 40px">
                <asp:TextBox ID="tbMaSP" runat="server" Enabled="False"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="text-left" style="height: 40px; width: 233px"><strong>&nbsp;&nbsp;&nbsp; Tên Sản Phẩm</strong></td>
            <td style="height: 40px">
                <asp:TextBox ID="tbTenSP" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="modal-sm" style="width: 233px; text-align: left; height: 36px;"><strong>&nbsp;&nbsp;&nbsp; Đơn Giá</strong></td>
            <td style="height: 36px">
                <asp:TextBox ID="tbDonGia" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="modal-sm" style="width: 233px; text-align: left; height: 36px;">&nbsp;&nbsp;&nbsp; <strong>Nhà Cung Cấp&nbsp;</strong></td>
            <td style="height: 36px">
                <asp:TextBox ID="tbNCC" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="modal-sm" style="width: 233px; text-align: left; "><strong>&nbsp;&nbsp;&nbsp; Mô Tả:&nbsp;&nbsp;&nbsp; </strong></td>
            <td>
   
                
                
   <asp:Label ID="lbnd" runat="server" CssClass="lbnd"></asp:Label>
                &nbsp;<textarea id="tbND" name="tbND" style="width: 465px; height: 100px" ></textarea>
                 <script>
                
                CKEDITOR.replace('tbND');
               CKFinder.setupCKEditor(null, '/ckfinder');

                var nd = document.getElementById('<%= lbnd.ClientID %>').innerHTML;
                document.getElementById('tbND').innerHTML =nd;
                </script>
                
                <br />
      
                
                
   
                
            </td>
            
        </tr>
        <tr>
            <td class="modal-sm" style="width: 233px; text-align: left; height: 34px;"><strong>&nbsp;&nbsp;&nbsp; Mã Loại Sản Phẩm:</strong></td>
            <td style="height: 34px">
                <asp:DropDownList ID="rdlMaLoaiSP" runat="server">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="modal-sm" style="width: 233px; text-align: left; height: 36px;"><strong>&nbsp;&nbsp;&nbsp;Hình Minh Họa </strong></td>
            <td style="height: 36px">
                <asp:FileUpload ID="FileUpload1" runat="server" Width="348px" Height="27px" />
                <br />
                <asp:Label ID="lbUpload" runat="server"></asp:Label>
                <asp:Label ID="lbThongBao" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="modal-sm" style="width: 233px; text-align: left; height: 33px;"><strong>&nbsp;&nbsp;&nbsp; Số Lượng</strong></td>
            <td style="height: 33px">
                <asp:TextBox ID="tbSoLuong" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="modal-sm" style="width: 233px; text-align: left; height: 34px;"><strong>&nbsp;&nbsp;&nbsp; Số Lượt Bán</strong></td>
            <td style="height: 34px">
                <asp:TextBox ID="tbSoLuongBan" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="modal-sm" style="width: 233px; text-align: left"><strong>&nbsp;&nbsp;&nbsp; Số Lượng Xem</strong></td>
            <td>
                <asp:TextBox ID="tbSoLanXem" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="modal-sm" style="width: 233px; text-align: center">&nbsp;</td>
            <td>
                <asp:Button ID="btnCapNhat" runat="server" CssClass="btnDat" OnClick="btnCapNhat_Click" Text="Cập Nhật" />
            </td>
        </tr>
    </table>
</asp:Content>
