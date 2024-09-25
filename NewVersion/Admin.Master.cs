﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NewVersion
{
    public partial class Admin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            AdminBreadcrumbDataSource.Provider = SiteMap.Providers["AdminSiteMapProvider"];
        }

        // Method to get the profile picture URL for the current user
        protected string GetProfilePictureUrl()
        {
            string username = HttpContext.Current.User.Identity.Name;
            string profilePictureUrl = "~/admin/assets/img/default.jpg"; // Default image path

            // Connect to the database and retrieve the profile picture URL
            string connString = ConfigurationManager.ConnectionStrings["productConnectionString"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connString))
            {
                conn.Open();
                string query = "SELECT ProfilePicture FROM AdminUser WHERE Username = @Username";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Username", username);
                    object result = cmd.ExecuteScalar();

                    if (result != null)
                    {
                        profilePictureUrl = "~/admin/assets/img/" + result.ToString(); // Append the profile picture filename
                    }
                }
            }
            return profilePictureUrl; // Return the URL
        }
    }
}