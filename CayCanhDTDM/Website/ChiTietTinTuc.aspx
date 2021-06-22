<%@ Page Title="" Language="C#" MasterPageFile="~/Template.Master" AutoEventWireup="true" CodeBehind="ChiTietTinTuc.aspx.cs" Inherits="Website.ChiTietTinTuc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <div class="ndtintuc">
        <asp:DataList ID="DataList5" runat="server">
            <ItemTemplate>
                <asp:Label ID="Label1" runat="server" Text='<%# System.Web.HttpUtility.HtmlDecode(Eval("NoiDung").ToString().Replace("\n","<br>")) %>'></asp:Label>
            </ItemTemplate>
        </asp:DataList>
        </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WebBanCayCanhConnectionString %>" SelectCommand="SELECT [MaBlog], [HinhAnh], [TieuDe], [NoiDung], [NgayDang], [NguoiDang] FROM [BLOG] Where MaBlog=@MaBlog">
        <SelectParameters>
            <asp:QueryStringParameter Name="MaBlog" QueryStringField="MaBlog" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <div class="Danhsachsp">
    <strong>Bình Luận</strong></div>
    <div class="binhluannoidung">
        <strong>Nội dung</strong><br />&nbsp;
         <asp:Label ID="lbnd" runat="server" CssClass="lbnd"></asp:Label>
                &nbsp;<textarea id="tbND" name="tbND" style="width: 465px; height: 100px" ></textarea>
                 <script>
                
                CKEDITOR.replace('tbND');
               CKFinder.setupCKEditor(null, '/ckfinder');

                var nd = document.getElementById('<%= lbnd.ClientID %>').innerHTML;
                document.getElementById('tbND').innerHTML =nd;
                </script>
        
        <br />
        <asp:Button ID="Button1" runat="server" CssClass="btnDat" Text="Bình Luận" style="margin:10px" OnClick="Button1_Click"/>
        <br /><strong>
        <asp:Label ID="lbThongBao" runat="server" style="color: #FF0000"></asp:Label>
        </strong>
    </div>
    <br /><asp:DataList ID="DataList4" runat="server">
        <ItemTemplate>
            <div class="ndbl">
                <div >
                    
            <table style="width:100%;">
                <tr>
                    <td>
                        <asp:Label ID="NguoiBLLabel" runat="server" CssClass="fa-inverse" style="color: #3333CC" Text='<%# Eval("TenTK") %>' />
                        &nbsp;<span style="font-size: xx-small">đã bình luận ngày</span>
                        <asp:Label ID="NgayBLLabel" runat="server" CssClass="fa-inverse" style="font-size: xx-small; color: #000000" Text='<%# Eval("NgayBL","{0:dd/MM/yyyy HH:mm}") %>' />
                    </td>
                </tr>
                </table>
                </div>
                    <br />
                    <asp:Label ID="NoiDungBLLabel" runat="server" Text='<%# System.Web.HttpUtility.HtmlDecode(Eval("NoiDungBL").ToString().Replace("\n","<br>")) %>' />
                <br />
                
                </div>
            
        </ItemTemplate>
    </asp:DataList>
    <div class="phantrang" >
        <asp:SqlDataSource ID="SqlDataSource2" runat="server"></asp:SqlDataSource>
    <asp:Button ID="btnDau" runat="server" OnClick="Button2_Click" Text="Trang Đầu" Height="30px" />
    &nbsp;<asp:Button ID="btnTruoc" runat="server" Text="Trước" Height="30px" OnClick="btnTruoc_Click" Width="50px" />
        <asp:Label ID="tbTrang" runat="server"></asp:Label>
    <asp:Button ID="btnSau" runat="server" Text="Sau" Height="30px" OnClick="btnSau_Click" Width="50px" />
    &nbsp;<asp:Button ID="btnCuoi" runat="server" Text="Trang Cuối" Height="30px" OnClick="btnCuoi_Click" />
        <br />
        <br />
        </div>
</asp:Content>
