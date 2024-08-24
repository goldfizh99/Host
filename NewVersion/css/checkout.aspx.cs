﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NewVersion.css
{
    public partial class checkout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ddlBanks_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Update label text with the selected value
            lblTransfer.Text = ddlPaymentMethod.SelectedItem.Text;

        }

        protected void btnOrder_Click(object sender, EventArgs e)
        {
            string paymentMethod = lblTransfer.Text;

            if (paymentMethod == "Public Bank")
            {
                Response.Redirect("https://www.publicbank.com");
            }
            else if (paymentMethod == "Touch n Go")
            {
                Response.Redirect("https://www.touchngo.com.my");
            }
            else
            {
                lblText.Text = "Please select a valid payment method.";
            }
        }

        protected void btnCloseDialog_Click(object sender, EventArgs e)
        {
            Response.Redirect("checkout.aspx");
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            PlaceHolder1.Controls.Clear();

            // 创建第一个 Label 控件
            Label lbl1 = new Label();
            lbl1.ID = "lbl1";
            lbl1.Text = "First Name: " + c_diff_fname.Text;

            // 创建第二个 Label 控件
            Label lbl2 = new Label();
            lbl2.ID = "lbl2";
            lbl2.Text = "Phone Number: " + c_diff_phone.Text;

            // 创建第三个 Label 控件
            Label lbl3 = new Label();
            lbl3.ID = "lbl3";
            lbl3.Text = "Address: " + c_diff_address.Text;

            // 将控件和文本组合添加到 PlaceHolder 中
            PlaceHolder1.Controls.Add(lbl1);
            PlaceHolder1.Controls.Add(new LiteralControl("<br />"));  // 添加换行
            PlaceHolder1.Controls.Add(lbl2);
            PlaceHolder1.Controls.Add(new LiteralControl("<br />"));  // 添加换行
            PlaceHolder1.Controls.Add(lbl3);

            Response.Redirect("checkout.aspx");
        }


    }
}