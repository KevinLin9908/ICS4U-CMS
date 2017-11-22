using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace WebForm1
{
    public partial class NewTaskPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void CancelButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }

        protected void SaveButton_Click(object sender, EventArgs e)
        {
            int TaskId = 0;
            string constr = ConfigurationManager.ConnectionStrings["WebFormConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("Insert_Task"))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@TaskName", NewTaskNameTxtBox.Text.Trim());
                        cmd.Parameters.AddWithValue("@TaskListName", DropDownList1.SelectedValue);
                        cmd.Parameters.AddWithValue("@priority", PriorityDropDownList.SelectedValue);
                        cmd.Parameters.AddWithValue("@TaskDate", Convert.ToDateTime(DateTextBox.Text));
                        cmd.Connection = con;
                        con.Open();
                        TaskId = Convert.ToInt32(cmd.ExecuteScalar());
                        con.Close();
                    }
                }
                string message = string.Empty;
                switch (TaskId)
                {
                    case -1:
                        message = "Task Name already exists.\\nPlease choose a different Task Name.";
                        break;
                    default:
                        message = "Save successful";
                        break;
                }
                ClientScript.RegisterStartupScript(GetType(), "alert", "alert('" + message + "');", true);
            }
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            DateTextBox.Text = Calendar1.SelectedDate.ToString();
        }
    }
}