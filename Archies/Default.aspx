<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Archies.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table>
                    <tr>
                        <td>
                            Id : <asp:TextBox ID="TxtId" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Name : <asp:TextBox ID="TxtName" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            ProductCode : <asp:TextBox ID="TxtProductCode" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                     <tr>
                        <td>
                            Description : <asp:TextBox ID="TxtDescription" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Price : <asp:TextBox ID="TxtPrice" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                     <tr>
                        <td>
                            CategoryId : <asp:TextBox ID="TxtCategory" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                     <tr>
                        <td>
                            Isactive : <asp:TextBox ID="TxtActive" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                     <tr>
                        <td>
                            CreatedBy : <asp:TextBox ID="TxtCreatedBy" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            CreatedOn : <asp:TextBox ID="TxtCreatedOn" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            ModifiedOn : <asp:TextBox ID="TxtModifiedOn" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            ModifiedBy : <asp:TextBox ID="TxtModifiedBy" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                         <td>
                            <asp:Button ID="ButtonAdd" runat="server" Text="Add" OnClick="ButtonAdd_Click" />
                             <asp:Button ID="Buttonupdate" runat="server" Text="Update" />
                               <asp:Button ID="ButtonDelete" runat="server" Text="Delete" />                          
                        </td>
                      </tr>
            </table>
        </div>
    </form>
</body>
</html>
