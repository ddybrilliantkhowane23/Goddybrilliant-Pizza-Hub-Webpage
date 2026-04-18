using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PizzaOrder
{
    public partial class _Default : Page
    {
        private decimal sizePrice = 0m;
        private decimal crustPrice = 0m;
        private const decimal toppingPrice = 2m;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    divTip.Visible = false;
                    divSummary.Visible = false;
                }
            }
            catch (Exception ex)
            {
                Response.Write("Error in Page_Load: " + ex.Message);
            }
        }

        // CustomValidator for Pizza Size
        protected void cvSize_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = rbSmall.Checked || rbMedium.Checked || rbLarge.Checked;
        }

        // CustomValidator for Crust Type
        protected void cvCrust_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = rbThin.Checked || rbThick.Checked;
        }

        protected void rbSize_CheckedChanged(object sender, EventArgs e)
        {
            try { /* optional */ }
            catch (Exception ex) { Response.Write("Error in rbSize_CheckedChanged: " + ex.Message); }
        }

        protected void rbCrust_CheckedChanged(object sender, EventArgs e)
        {
            try { /* optional */ }
            catch (Exception ex) { Response.Write("Error in rbCrust_CheckedChanged: " + ex.Message); }
        }

        protected void chkAddTip_CheckedChanged(object sender, EventArgs e)
        {
            try
            {
                divTip.Visible = chkAddTip.Checked;
                rvTip.Enabled = chkAddTip.Checked;
                if (!chkAddTip.Checked)
                    txtTip.Text = "";
            }
            catch (Exception ex)
            {
                Response.Write("Error in chkAddTip_CheckedChanged: " + ex.Message);
            }
        }

        private decimal CalculateTotal()
        {
            try
            {
                if (rbSmall.Checked) sizePrice = 35m;
                else if (rbMedium.Checked) sizePrice = 50m;
                else if (rbLarge.Checked) sizePrice = 80m;
                else sizePrice = 0m;

                if (rbThin.Checked) crustPrice = 5m;
                else if (rbThick.Checked) crustPrice = 8m;
                else crustPrice = 0m;

                decimal total = sizePrice + crustPrice + toppingPrice;

                if (chkAddTip.Checked && !string.IsNullOrEmpty(txtTip.Text))
                {
                    decimal tip;
                    if (decimal.TryParse(txtTip.Text, out tip))
                        total += tip;
                }
                return total;
            }
            catch (Exception ex)
            {
                Response.Write("Error in CalculateTotal: " + ex.Message);
                return 0m;
            }
        }

        protected void btnOrder_Click(object sender, EventArgs e)
        {
            try
            {
                if (Page.IsValid)
                {
                    string name = txtName.Text;
                    string email = txtEmail.Text;
                    string size = "";
                    if (rbSmall.Checked) size = "Small (R35)";
                    else if (rbMedium.Checked) size = "Medium (R50)";
                    else if (rbLarge.Checked) size = "Large (R80)";
                    string topping = ddlTopping.SelectedItem.Text;
                    string crust = "";
                    if (rbThin.Checked) crust = "Thin (R5)";
                    else if (rbThick.Checked) crust = "Thick (R8)";

                    decimal total = CalculateTotal();
                    string tipInfo = "";
                    if (chkAddTip.Checked && !string.IsNullOrEmpty(txtTip.Text))
                        tipInfo = ", plus tip of R" + txtTip.Text;

                    string summary = $"Thank you, {name}! Your order:<br />" +
                                     $"Size: {size}<br />" +
                                     $"Crust: {crust}<br />" +
                                     $"Topping: {topping} (R2)<br />" +
                                     $"Total cost: R{total:F2}{tipInfo}<br />" +
                                     $"A confirmation has been sent to {email}.";

                    lblSummary.Text = summary;
                    divSummary.Visible = true;
                }
            }
            catch (Exception ex)
            {
                Response.Write("Error in btnOrder_Click: " + ex.Message);
            }
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            try
            {
                txtName.Text = "";
                txtEmail.Text = "";
                rbSmall.Checked = false;
                rbMedium.Checked = false;
                rbLarge.Checked = false;
                ddlTopping.SelectedIndex = 0;
                rbThin.Checked = false;
                rbThick.Checked = false;
                chkAddTip.Checked = false;
                divTip.Visible = false;
                txtTip.Text = "";
                divSummary.Visible = false;
            }
            catch (Exception ex)
            {
                Response.Write("Error in btnClear_Click: " + ex.Message);
            }
        }
    }
}