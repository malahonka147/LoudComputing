<%@ Page Title="" Language="C#" MasterPageFile="~/QuanTri.Master" AutoEventWireup="true" CodeBehind="ThemSP.aspx.cs" Inherits="Website.ThemSP" ValidateRequest="false"%>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server" >

    <table style="height: 598px;" class="nav-justified" ">
        <tr>
            <td class="text-center" colspan="2">
                <h1><strong>THÊM MỚI SẢN PHẨM</strong></h1>
            </td>
        </tr>
        <tr>
            <td class="text-left" style="height: 41px; width: 124px"><strong>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; Tên Sản Phẩm</strong></td>
            <td style="height: 41px">
                <asp:TextBox ID="tbTenSP" runat="server"></asp:TextBox>
                <strong>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="tbTenSP" ErrorMessage="Chưa Nhập Tên SP" style="color: #FF0000"></asp:RequiredFieldValidator>
                </strong>
            </td>
        </tr>
        <tr>
            <td class="modal-sm" style="width: 124px; text-align: left; height: 36px;"><strong>&nbsp;&nbsp;&nbsp; Đơn Giá</strong></td>
            <td style="height: 36px">
                <asp:TextBox ID="tbDonGia" runat="server"></asp:TextBox>
                <strong>
                <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="tbDonGia" Display="Dynamic" ErrorMessage=" 0&lt;= Đơn Giá &lt;=999999999" MaximumValue="999999999" MinimumValue="0" style="color: #FF0000"></asp:RangeValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="tbDonGia" Display="Dynamic" ErrorMessage="Chưa Nhập Đơn Giá" style="color: #FF0000"></asp:RequiredFieldValidator>
                </strong>
            </td>
        </tr>
        <tr>
            <td class="modal-sm" style="width: 124px; text-align: left; height: 36px;">&nbsp;&nbsp;&nbsp; <strong>Nhà Cung Cấp&nbsp;</strong></td>
            <td style="height: 36px">
                <asp:TextBox ID="tbNCC" runat="server"></asp:TextBox>
                <strong>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="tbNCC" ErrorMessage="Chưa nhập nhà cung cấp!!!" style="color: #FF0000"></asp:RequiredFieldValidator>
                </strong>
            </td>
        </tr>
        <tr>
            <td class="modal-sm" style="width: 124px; text-align: left; height: 51px;"><strong>&nbsp;&nbsp;&nbsp; Mô Tả:</strong></td>
            <td style="height: 51px">
                <asp:Label ID="lbnd" runat="server" CssClass="lbnd"></asp:Label>
                &nbsp;<textarea id="tbND" name="tbND" style="width: 465px; height: 100px" ></textarea>
                 <script>
                
                CKEDITOR.replace('tbND');
               CKFinder.setupCKEditor(null, '/ckfinder');

                var nd = document.getElementById('<%= lbnd.ClientID %>').innerHTML;
                document.getElementById('tbND').innerHTML =nd;
                </script></td>
            
        </tr>
        <tr>
            <td class="modal-sm" style="width: 124px; text-align: left; height: 36px;"><strong>&nbsp;&nbsp;&nbsp; Hình Minh Họa</strong></td>
            <td style="height: 36px">
                <asp:FileUpload ID="FileUpload1" runat="server" Width="348px" Height="27px" />
    &nbsp;<br />
                <asp:Label ID="lbThongBao" runat="server"></asp:Label>
        <br />
      
                    <strong>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="FileUpload1" ErrorMessage="Chưa chọn ảnh!!!" style="color: #FF0000"></asp:RequiredFieldValidator>
                </strong>
            </td>
        </tr>
        <tr>
            <td class="modal-sm" style="width: 124px; text-align: left; "><strong>&nbsp;&nbsp;&nbsp; Loại Sản Phẩm:&nbsp;&nbsp;</strong></td>
            <td>
                <asp:DropDownList ID="rdLSP" runat="server" OnSelectedIndexChanged="rdLSP_SelectedIndexChanged">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="modal-sm" style="width: 124px; text-align: left; "><strong>&nbsp;&nbsp;&nbsp; Số Lượng&nbsp;&nbsp;&nbsp; </strong></td>
            <td>
                <asp:TextBox ID="tbSoLuong" runat="server"></asp:TextBox>
                <strong>
                <asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="tbSoLuong" Display="Dynamic" ErrorMessage="0&lt;=Số lượng &lt;=99999" MaximumValue="99999" MinimumValue="0" style="color: #FF0000"></asp:RangeValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="tbSoLuong" Display="Dynamic" ErrorMessage="Chưa nhập số lượng" style="color: #FF0000"></asp:RequiredFieldValidator>
                </strong>
            </td>
        </tr>
        <tr>
            <td class="modal-sm" style="width: 124px; text-align: left">&nbsp;</td>
            <td>
                <asp:Button ID="btnLuu" runat="server" CssClass="btnDat" OnClick="btnLuu_Click" Text="Lưu" />
            </td>
        </tr>
    </table>
    

</asp:Content>
