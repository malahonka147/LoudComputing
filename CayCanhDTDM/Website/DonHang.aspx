<%@ Page Title="" Language="C#" MasterPageFile="~/QuanTri.Master" AutoEventWireup="true" CodeBehind="DonHang.aspx.cs" Inherits="Website.DonHang" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <table style="width:100%">
                <tr>
                    <td class="text-center">
                        <h1><strong>DANH SÁCH ĐƠN HÀNG</strong></h1>
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <br />
                        <br />
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="text-left">
                            <asp:GridView ID="gvBlog" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="MaDH" OnPageIndexChanging="gvBlog_PageIndexChanging" Width="100%" OnRowCommand="gvBlog_RowCommand" CssClass="fixcss">
                                <Columns>
                                    <asp:BoundField DataField="MaDH" HeaderText="Mã Đơn Hàng" ReadOnly="True" >
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="20px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="NgayLapDH" HeaderText="Ngày Lập ĐH" DataFormatString="{0:dd/MM/yyyy}" >
                                    <ItemStyle Width="50px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="TenKH" HeaderText="Tên Khách Hàng" ><ItemStyle CssClass="gvBlog" Width="50px" />
                                    </asp:BoundField>
                                    <asp:BoundField  DataField="DiaChi" HeaderText="Địa Chỉ" >
                                        <ItemStyle CssClass="gvBlog" Width="100px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="SDT" HeaderText="SDT" >
                                    <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="PTTT" HeaderText="Phương Thức Thanh Toán" />
                                    <asp:BoundField DataField="ThanhTien" HeaderText="Thành Tiền" />
                                    <asp:TemplateField HeaderText="Sửa">
                                        <ItemTemplate>
                                            <asp:HyperLink ID="HyperLink1" runat="server" ImageUrl="~/Anh/Icon/Edit.png" NavigateUrl='<%# "~/SuaDH.aspx?MaDH="+Eval("MaDH") %>'>Sửa</asp:HyperLink>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:ButtonField ButtonType="Image" CommandName="Xoa" HeaderText="Xóa" ImageUrl="~/Anh/Icon/Delete.jpg" >
                                    <ItemStyle HorizontalAlign="Center" />
                                    </asp:ButtonField>
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
