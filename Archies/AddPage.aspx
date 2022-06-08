﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddPage.aspx.cs" Inherits="Archies.AddPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>CRUD OPERATION BY STORED PROCEDURE</title>
    <style type="text/css">
</style>

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>CRUD OPERATION BY STORED PROCEDURE</h1>
            <table>

                <tr>
                    <td>ProductName :
                        <asp:TextBox ID="TxtName" runat="server" MaxLength="20" size="20" ></asp:TextBox>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                            ControlToValidate="TxtName" ForeColor="Red" ErrorMessage="This is required field,can not be blank."></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>ProductCode :
                        <asp:TextBox ID="TxtProductCode" runat="server" MaxLength="20" size="20" ></asp:TextBox>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                            ControlToValidate="TxtProductCode" ForeColor="Red" ErrorMessage="This is required field,can not be blank."></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>Description :                         
                        <asp:TextBox ID="TxtDescription" runat="server" MaxLength="50" size="20" ></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>PricPrice:
                        <asp:TextBox ID="TxtPrice" runat="server" MaxLength="6" size="20" ToolTip="Mendetory"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server"
                            ControlToValidate="TxtPrice" ForeColor="Red" ErrorMessage="Enter only 0-9 numbers."
                            ValidationExpression="^[0-9]*$"></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                            ControlToValidate="TxtPrice" ForeColor="Red" ErrorMessage="This is required field,can not be blank."></asp:RequiredFieldValidator>
                    </td>
                </tr>

                <tr>
                    <td>
                        <%-- <asp:Button ID="ButtonUpdate" runat="server" Text="Update" OnClick="ButtonUpdate_Click" />
                            
                               <asp:Button ID="ButtonDelete" runat="server" Text="Delete" OnClick="ButtonDelete_Click" />    
                                <asp:Button ID="ButtonView" runat="server" Text="View" OnClick="ButtonView_Click" />--%>

                        <asp:Button ID="ButtonAdd" runat="server" Text="Submit" OnClick="ButtonAdd_Click" Width="74px" BackColor="#3399FF" BorderColor="Black" ForeColor="#003300" />
                        <asp:Button ID="ButtonClear" runat="server" Text="Clear" OnClick="ButtonClear_Click" Width="90px" BackColor="#DCDCDC" BorderColor="Black" ForeColor="#003300" />
                    </td>
                </tr>


            </table>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
                DataKeyNames="id" AutoGenerateDeleteButton="True"
                AutoGenerateEditButton="True" OnRowCancelingEdit="GridView1_RowCancelingEdit"
                OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing"
                OnRowUpdating="GridView1_RowUpdating" CellSpacing="2" BackColor="#FFCC66" BorderColor="#003300" ForeColor="#003300">
                
              <Columns>
                    <%--<asp:TemplateField HeaderText="Action" ItemStyle-Width="100">
                        <ItemTemplate>
                            <asp:Label ID="lblActionMethod" Text= '<%# Container.DataItemIndex + 0 %>' runat="server" />
                        </ItemTemplate>
                        <ItemStyle Width="100px"></ItemStyle>
                    </asp:TemplateField>--%>
                 
                        
                    <asp:TemplateField HeaderText="S.No" ItemStyle-Width="100">
                        <ItemTemplate>
                            <asp:Label ID="lblRowNumber" Text='<%# Container.DataItemIndex + 0 %>' runat="server" />
                        </ItemTemplate>

                        <ItemStyle Width="100px"></ItemStyle>
                    </asp:TemplateField>
                    
                    <asp:TemplateField HeaderText="Name">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtName" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblName" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="ProductCode">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtProductCode" runat="server" Text='<%# Bind("ProductCode") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblProductCode" runat="server" Text='<%# Bind("ProductCode") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Description">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtDescription" runat="server" Text='<%# Bind("Description") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblDescription" runat="server" Text='<%# Bind("Description") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Price">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtPrice" runat="server" Text='<%# Bind("Price") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblPrice" runat="server" Text='<%# Bind("Price") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="CreatedOn">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtCreatedOn" runat="server" Text='<%# Bind("CreatedOn") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblCreatedOn" runat="server" Text='<%# Bind("CreatedOn") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                   
                </Columns>
                <HeaderStyle BackColor="White" ForeColor="Red" />

            </asp:GridView>
        </div>
    </form>
</body>
</html>