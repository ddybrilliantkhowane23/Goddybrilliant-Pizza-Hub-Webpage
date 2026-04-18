<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="PizzaOrder._Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Goddybrilliant Pizza Hub – Friday Promo</title>
    <link href="Styles.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="header">
                <h1>🍕 Goddybrilliant Pizza Hub</h1>
                <p>Friday Promo – Add one favourite topping for only R2!</p>
            </div>

            <!-- Customer Details -->
            <div class="section">
                <div class="row">
                    <asp:Label ID="lblName" runat="server" Text="Your Name:" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtName" runat="server" CssClass="textbox"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtName"
                        ErrorMessage="Name is required" Text="*" ForeColor="Red" Display="Dynamic" />
                </div>
                <div class="row">
                    <asp:Label ID="lblEmail" runat="server" Text="Email Address:" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="textbox"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail"
                        ErrorMessage="Email is required" Text="*" ForeColor="Red" Display="Dynamic" />
                    <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail"
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                        ErrorMessage="Invalid email format" Text="Invalid" ForeColor="Red" Display="Dynamic" />
                </div>
            </div>

            <!-- Pizza Size (RadioButtons) -->
            <div class="section">
                <h3>Choose Pizza Size</h3>
                <asp:RadioButton ID="rbSmall" runat="server" GroupName="PizzaSize" Text="Small – R35" AutoPostBack="true" OnCheckedChanged="rbSize_CheckedChanged" />
                <br />
                <asp:RadioButton ID="rbMedium" runat="server" GroupName="PizzaSize" Text="Medium – R50" AutoPostBack="true" OnCheckedChanged="rbSize_CheckedChanged" />
                <br />
                <asp:RadioButton ID="rbLarge" runat="server" GroupName="PizzaSize" Text="Large – R80" AutoPostBack="true" OnCheckedChanged="rbSize_CheckedChanged" />
                <!-- CustomValidator for size selection -->
                <asp:CustomValidator ID="cvSize" runat="server" ErrorMessage="Please select a pizza size" 
                    Text="*" ForeColor="Red" Display="Dynamic" OnServerValidate="cvSize_ServerValidate" />
            </div>

            <!-- Topping -->
            <div class="section">
                <h3>Add Topping (R2)</h3>
                <asp:DropDownList ID="ddlTopping" runat="server" CssClass="dropdown">
                    <asp:ListItem Value="">-- Select Topping --</asp:ListItem>
                    <asp:ListItem>Mushrooms</asp:ListItem>
                    <asp:ListItem>Pepperoni</asp:ListItem>
                    <asp:ListItem>Olives</asp:ListItem>
                    <asp:ListItem>Bacon</asp:ListItem>
                    <asp:ListItem>Extra Cheese</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfvTopping" runat="server" ControlToValidate="ddlTopping"
                    InitialValue="" ErrorMessage="Please select a topping" Text="*" ForeColor="Red" Display="Dynamic" />
            </div>

            <!-- Crust Type (RadioButtons) -->
            <div class="section">
                <h3>Choose Crust Type</h3>
                <asp:RadioButton ID="rbThin" runat="server" GroupName="CrustType" Text="Thin – R5" AutoPostBack="true" OnCheckedChanged="rbCrust_CheckedChanged" />
                <br />
                <asp:RadioButton ID="rbThick" runat="server" GroupName="CrustType" Text="Thick – R8" AutoPostBack="true" OnCheckedChanged="rbCrust_CheckedChanged" />
                <!-- CustomValidator for crust selection -->
                <asp:CustomValidator ID="cvCrust" runat="server" ErrorMessage="Please select a crust type" 
                    Text="*" ForeColor="Red" Display="Dynamic" OnServerValidate="cvCrust_ServerValidate" />
            </div>

            <!-- Tip Checkbox + TextBox -->
            <div class="section">
                <asp:CheckBox ID="chkAddTip" runat="server" Text="Add a tip" AutoPostBack="true" OnCheckedChanged="chkAddTip_CheckedChanged" />
                <div id="divTip" runat="server" visible="false" class="tip-area">
                    <asp:Label ID="lblTip" runat="server" Text="Tip amount (R):" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtTip" runat="server" CssClass="textbox-small"></asp:TextBox>
                    <asp:RangeValidator ID="rvTip" runat="server" ControlToValidate="txtTip"
                        MinimumValue="1" MaximumValue="100" Type="Double"
                        ErrorMessage="Tip must be between R1 and R100" Text="*" ForeColor="Red" Display="Dynamic" Enabled="false" />
                </div>
            </div>

            <!-- Validation Summary -->
            <div class="validation-summary">
                <asp:ValidationSummary ID="vsSummary" runat="server" HeaderText="Please fix the following errors:" ForeColor="Red" />
            </div>

            <!-- Buttons -->
            <div class="button-row">
                <asp:Button ID="btnOrder" runat="server" Text="Place Order" CssClass="button" OnClick="btnOrder_Click" />
                <asp:Button ID="btnClear" runat="server" Text="Clear" CssClass="button-clear" OnClick="btnClear_Click" CausesValidation="false" />
            </div>

            <!-- Order Summary -->
            <div id="divSummary" runat="server" visible="false" class="summary">
                <h3>Order Confirmation</h3>
                <asp:Label ID="lblSummary" runat="server" CssClass="summary-text"></asp:Label>
            </div>
        </div>
    </form>
</body>
</html>