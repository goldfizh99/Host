﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Razorpay.Api;
using Newtonsoft.Json;


namespace NewVersion.css
{
    public partial class checkout : System.Web.UI.Page
    {
        private const string _key = "rzp_test_7sBM0c2utoTQ59";
        private const string _secret = "OKDPvhfckfnU2BnhPs7dKERM";

        protected void Page_Load(object sender, EventArgs e)
        {
            // if data already store at the Session 
            string userName = Session["UserName"] != null ? Session["UserName"].ToString() : "Default Name";
            string contact = Session["Contact"] != null ? Session["Contact"].ToString() : "0000000000";
            string email = Session["Email"] != null ? Session["Email"].ToString() : "default@example.com";

            // input the user details to javascript(checkout) 
            ClientScript.RegisterStartupScript(this.GetType(), "setUserInfo",
                $"<script>var userDetails = {{ name: '{userName}', contact: '{contact}', email: '{email}' }};</script>",
                false);
        }

        
        protected void btnCloseDialog_Click(object sender, EventArgs e)
        {
            Response.Redirect("checkout.aspx");
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            PlaceHolder1.Controls.Clear();

            Label lbl1 = new Label();
            lbl1.ID = "lbl1";
            lbl1.Text = "First Name: " + c_diff_fname.Text;

            Label lbl2 = new Label();
            lbl2.ID = "lbl2";
            lbl2.Text = "Phone Number: " + c_diff_phone.Text;

            Label lbl3 = new Label();
            lbl3.ID = "lbl3";
            lbl3.Text = "Address: " + c_diff_address.Text;

            PlaceHolder1.Controls.Add(lbl1);
            PlaceHolder1.Controls.Add(new LiteralControl("<br />"));
            PlaceHolder1.Controls.Add(lbl2);
            PlaceHolder1.Controls.Add(new LiteralControl("<br />"));
            PlaceHolder1.Controls.Add(lbl3);

        }

        protected void btnPay_Click1(object sender, EventArgs e)
        {
            string currency = "MYR";
            double amount = GetAmountFromLabel(lblAmount.Text);

            if (amount <= 0)
            {
                throw new Exception("Parsed amount is less than or equal to 0: " + amount);
            }

            double amountInSubunits = amount * 100;

            if (amountInSubunits <= 0)
            {
                throw new Exception("Amount in subunits is less than or equal to 0: " + amountInSubunits);
            }

            double Amount = GetAmountFromLabel(lblAmount.Text);
            Session["Amount"] = Amount; // store to session

            string description = "Razorpay Payment Gateway";
            string imageLogo = "";

            Dictionary<string, string> notes = new Dictionary<string, string>()
            {
                {"note 1", "This is a Payment Note"},
                {"note 2", "Here another note, you can add max 15 notes"}
            };

            string orderId = CreateOrder(currency, amountInSubunits, notes);
            string jsFunction = "OpenPaymentWindow('" + _key + "','" + currency + "','" + amountInSubunits + "','" + description + "', '" + imageLogo + "', '" + orderId + "','" + JsonConvert.SerializeObject(notes) + "');";
            ClientScript.RegisterStartupScript(this.GetType(), "OpenPaymentWindow", jsFunction, true);
        }

        private double GetAmountFromLabel(string amountText)
        {
            // slipt "RM"
            string cleanedAmountText = amountText.Replace("RM ", "").Trim();

            double amount;
            if (double.TryParse(cleanedAmountText, out amount))
            {
                return amount; //successful,return amount
            }
            else
            {
                return -1; // failed
            }
        }

        private string CreateOrder(string currency, double amountInSubunits, Dictionary<string, string> notes)
        {
            try
            {
                int paymentCapture = 1;

                RazorpayClient client = new RazorpayClient(_key, _secret);

                Dictionary<string, object> options = new Dictionary<string, object>();
                options.Add("currency", currency);
                options.Add("amount", amountInSubunits);
                options.Add("payment_capture", paymentCapture);
                options.Add("notes", notes);

                System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls12;
                System.Net.ServicePointManager.Expect100Continue = false;

                Razorpay.Api.Order orderResponse = client.Order.Create(options);
                var orderId = orderResponse.Attributes["id"].ToString();
                return orderId;
            }
            catch (Exception ex)
            {
                throw new Exception("Error when create Order: " + ex.Message);
            }
        }

    }
}
    