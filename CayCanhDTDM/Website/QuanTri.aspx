<%@ Page Title="" Language="C#" MasterPageFile="~/QuanTri.Master" AutoEventWireup="true" CodeBehind="QuanTri.aspx.cs" Inherits="Website.QuanTri" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  

    <table style="width:100%">
                <tr>
                    <td class="text-center">
                        <h1><strong>DANH SÁCH SẢN PHẨM</strong></h1>
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btnThem" runat="server" CssClass="btnDat" Text="Thêm mới" OnClick="btnThem_Click" />
                        <br />
                        <br />
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="text-center">
                            <asp:GridView ID="gvSP" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="MaSP" OnPageIndexChanging="gvSP_PageIndexChanging" Width="100%" OnRowCommand="gvSP_RowCommand" PageSize="20">
                                <Columns>
                                    <asp:BoundField DataField="MaSP" HeaderText="Mã SP" ReadOnly="True" SortExpression="MaSP" >
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="TenSP" HeaderText="Tên SP" SortExpression="TenSP" >
                                    <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="TienSP" HeaderText="Đơn Giá" SortExpression="TienSP" >
                                    <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="NgayCapNhat" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Ngày Cập Nhật" SortExpression="NgayCapNhat" InsertVisible="False" >
                                    <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="SoLuongBan" HeaderText="Số Lượng Bán" SortExpression="SoLuongBan" >
                                    <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="SoLanXem" HeaderText="Sồ Lượt Xem" SortExpression="SoLanXem" >
                                    <ItemStyle HorizontalAlign="Center" Width="80px" />
                                    </asp:BoundField>
                                    <asp:TemplateField HeaderText="Sửa">
                                        <ItemTemplate>
                                            <asp:HyperLink ID="HyperLink1" runat="server" ImageUrl="~/Anh/Icon/Edit.png" NavigateUrl='<%# "~/SuaSP.aspx?Ma="+Eval("MaSP") %>'>Sửa</asp:HyperLink>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                   
                                    <asp:ButtonField ButtonType="Image" CommandName="Xoa" HeaderText="Xóa" ImageUrl="~/Anh/Icon/Delete.jpg" />
                                </Columns>
                                <FooterStyle BackColor="White" ForeColor="#000066" />
                                <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Center" VerticalAlign="Middle" Wrap="True" />
                                <RowStyle ForeColor="#000066" />
                                <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                <SortedAscendingHeaderStyle BackColor="#007DBB" />
                                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                <SortedDescendingHeaderStyle BackColor="#00547E" />
                            </asp:GridView>
                        </div>
                    </td>
                </tr>
            </table>
</asp:Content>
