using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.Security;

namespace WebTest
{
    public partial class Login : System.Web.UI.Page
    {
        protected void ValidateUser(object sender, EventArgs e)
        {
            //int userId = 0;
            //if (Login1.UserName == "Kevin")
            //{
            //    if (Login1.Password != "12345")
            //    {
            //        userId = -1;
            //    }
            //}
            //else
            //    userId = -2;
            //switch (userId)
            //{
            //    case -1:
            //        Login1.FailureText = "password is incorrect.";
            //        break;
            //    case -2:
            //        Login1.FailureText = "user name is in correct.";
            //        break;
            //    default:
            //        Login1.FailureText = "account is not active.";
            //        break;
            //}

            int userId = 0;
            string constr = ConfigurationManager.ConnectionStrings["WebFormConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("Validate_User"))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Username", Login1.UserName);
                    cmd.Parameters.AddWithValue("@Password", Login1.Password);
                    cmd.Connection = con;
                    con.Open();
                    userId = Convert.ToInt32(cmd.ExecuteScalar());
                    con.Close();
                }
                switch (userId)
                {
                    case -1:
                        Login1.FailureText = "Username and/or password is incorrect.";
                        break;
                    case -2:
                        Login1.FailureText = "Account has not been activated.";
                        break;
                    default:
                        Session["UserId"] = userId;
                        FormsAuthentication.RedirectFromLoginPage(Login1.UserName, Login1.RememberMeSet);
                        break;
                }
            }
        }
    }
}