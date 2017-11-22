using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebForm1
{
    public partial class TaskListPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // The Page is accessed for the first time. 
            if (!IsPostBack)
            {              
                // Populate the GridView. 
                BindGridView();
            }
        }

        private void BindGridView()
        {
            // Get the connection string from Web.config.  
            // When we use Using statement,  
            // we don't need to explicitly dispose the object in the code,  
            // the using statement takes care of it. 
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["WebFormConnectionString"].ToString()))
            {
                // Create a DataSet object. 
                DataSet dsTaskList = new DataSet();


                // Create a SELECT query. 
                string strSelectCmd = "SELECT TaskListID,TaskListName FROM TaskList";


                // Create a SqlDataAdapter object 
                // SqlDataAdapter represents a set of data commands and a  
                // database connection that are used to fill the DataSet and  
                // update a SQL Server database.  
                SqlDataAdapter da = new SqlDataAdapter(strSelectCmd, conn);


                // Open the connection 
                conn.Open();


                // Fill the DataTable named "TaskList" in DataSet with the rows 
                // returned by the query.new n 
                da.Fill(dsTaskList, "TaskList");


                // Get the DataView from TaskList DataTable. 
                DataView dvTaskList = dsTaskList.Tables["TaskList"].DefaultView;


                // Set the sort column and sort order. 
               // dvTaskList.Sort = ViewState["SortExpression"].ToString();


                // Bind the GridView control. 
                gvTaskList.DataSource = dvTaskList;
                gvTaskList.DataBind();
            }
        }

        protected void gvTaskList_RowEditing(object sender, GridViewEditEventArgs e)
        {
            // Make the GridView control into edit mode  
            // for the selected row.  
            gvTaskList.EditIndex = e.NewEditIndex;


            // Rebind the GridView control to show data in edit mode. 
            BindGridView();


            // Hide the Add button. 
            lbtnAdd.Visible = false;
        }

        protected void gvTaskList_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            // Exit edit mode. 
            gvTaskList.EditIndex = -1;


            // Rebind the GridView control to show data in view mode. 
            BindGridView();


            // Show the Add button. 
            lbtnAdd.Visible = true;
        }

        protected void gvTaskList_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["WebFormConnectionString"].ToString()))
            {
                // Create a command object. 
                SqlCommand cmd = new SqlCommand();


                // Assign the connection to the command. 
                cmd.Connection = conn;


                // Set the command text 
                // SQL statement or the name of the stored procedure  
                cmd.CommandText = "UPDATE TaskList SET TaskListName = @TaskListName WHERE TaskListID = @TaskListID";


                // Set the command type 
                // CommandType.Text for ordinary SQL statements;  
                // CommandType.StoredProcedure for stored procedures. 
                cmd.CommandType = CommandType.Text;


                // Get the TaskListID of the selected row. 
                string strTaskListID = gvTaskList.Rows[e.RowIndex].Cells[2].Text;
                string strTaskListName = ((TextBox)gvTaskList.Rows[e.RowIndex].FindControl("TextBox2")).Text;


                // Append the parameters. 
                cmd.Parameters.Add("@TaskListID", SqlDbType.Int).Value = strTaskListID;
                cmd.Parameters.Add("@TaskListName", SqlDbType.VarChar, 50).Value = strTaskListName;


                // Open the connection. 
                conn.Open();


                // Execute the command. 
                cmd.ExecuteNonQuery();
            }


            // Exit edit mode. 
            gvTaskList.EditIndex = -1;


            // Rebind the GridView control to show data after updating. 
            BindGridView();


            // Show the Add button. 
            lbtnAdd.Visible = true;
        }

        protected void gvTaskList_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["WebFormConnectionString"].ToString()))
            {
                // Create a command object. 
                SqlCommand cmd = new SqlCommand();


                // Assign the connection to the command. 
                cmd.Connection = conn;


                // Set the command text 
                // SQL statement or the name of the stored procedure  
                cmd.CommandText = "DELETE FROM TaskList WHERE TaskListID = @TaskListID";


                // Set the command type 
                // CommandType.Text for ordinary SQL statements;  
                // CommandType.StoredProcedure for stored procedures. 
                cmd.CommandType = CommandType.Text;


                // Get the TaskListID of the selected row. 
                string strTaskListID = gvTaskList.Rows[e.RowIndex].Cells[2].Text;


                // Append the parameter. 
                cmd.Parameters.Add("@TaskListID", SqlDbType.Int).Value = strTaskListID;


                // Open the connection. 
                conn.Open();


                // Execute the command. 
                cmd.ExecuteNonQuery();
            }


            // Rebind the GridView control to show data after deleting. 
            BindGridView();
        }

        protected void gvTaskList_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            // Make sure the current GridViewRow is a data row. 
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // Make sure the current GridViewRow is either  
                // in the normal state or an alternate row. 
                if (e.Row.RowState == DataControlRowState.Normal || e.Row.RowState == DataControlRowState.Alternate)
                {
                    // Add client-side confirmation when deleting. 
                    ((LinkButton)e.Row.Cells[1].Controls[0]).Attributes["onclick"] = "if(!confirm('Are you certain you want to delete this TaskList ?')) return false;";
                }
            }
        }

        protected void lbtnAdd_Click(object sender, EventArgs e)
        {
            // Hide the Add button and showing Add panel. 
            lbtnAdd.Visible = false;
            pnlAdd.Visible = true;
        }

        protected void lbtnSubmit_Click(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["WebFormConnectionString"].ToString()))
            {
                // Create a command object. 
                SqlCommand cmd = new SqlCommand();


                // Assign the connection to the command. 
                cmd.Connection = conn;


                // Set the command text 
                // SQL statement or the name of the stored procedure  
                cmd.CommandText = "INSERT INTO TaskList (  TaskListName, ProjectId ) VALUES ( @TaskListName, @ProjectId )";


                // Set the command type 
                // CommandType.Text for ordinary SQL statements;  
                // CommandType.StoredProcedure for stored procedures. 
                cmd.CommandType = CommandType.Text;


                // Append the parameters.     
                var ProjectId = 1;

                cmd.Parameters.Add("@TaskListName", SqlDbType.VarChar, 50).Value = tbTaskListName.Text;
                cmd.Parameters.Add("@ProjectId", SqlDbType.Int).Value = ProjectId;


                // Open the connection. 
                conn.Open();


                // Execute the command. 
                cmd.ExecuteNonQuery();
            }


            // Rebind the GridView control to show inserted data. 
            BindGridView();


            // Empty the TextBox controls. 
            //tbLastName.Text = "";
            tbTaskListName.Text = "";


            // Show the Add button and hiding the Add panel. 
            lbtnAdd.Visible = true;
            pnlAdd.Visible = false;
        }

        protected void lbtnCancel_Click(object sender, EventArgs e)
        {
            // Empty the TextBox controls. 
            //tbLastName.Text = "";
            tbTaskListName.Text = "";


            // Show the Add button and hiding the Add panel. 
            lbtnAdd.Visible = true;
            pnlAdd.Visible = false;
        }

    }
}