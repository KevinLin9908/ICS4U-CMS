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
    public partial class test : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // The Page is accessed for the first time. 
            if (!IsPostBack)
            {
                // Enable the GridView paging option and  
                // specify the page size. 
                gvProject.AllowPaging = true;
                gvProject.PageSize = 15;


                // Enable the GridView sorting option. 
                gvProject.AllowSorting = true;


                // Initialize the sorting expression. 
                ViewState["SortExpression"] = "ProjectID ASC";


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
                DataSet dsProject = new DataSet();


                // Create a SELECT query. 
                string strSelectCmd = "SELECT ProjectID,ProjectName FROM Project";


                // Create a SqlDataAdapter object 
                // SqlDataAdapter represents a set of data commands and a  
                // database connection that are used to fill the DataSet and  
                // update a SQL Server database.  
                SqlDataAdapter da = new SqlDataAdapter(strSelectCmd, conn);


                // Open the connection 
                conn.Open();


                // Fill the DataTable named "Project" in DataSet with the rows 
                // returned by the query.new n 
                da.Fill(dsProject, "Project");


                // Get the DataView from Project DataTable. 
                DataView dvProject = dsProject.Tables["Project"].DefaultView;


                // Set the sort column and sort order. 
                dvProject.Sort = ViewState["SortExpression"].ToString();


                // Bind the GridView control. 
                gvProject.DataSource = dvProject;
                gvProject.DataBind();
            }
        }

        protected void gvProject_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            // Set the index of the new display page.  
            gvProject.PageIndex = e.NewPageIndex;


            // Rebind the GridView control to  
            // show data in the new page. 
            BindGridView();
        }

        protected void gvProject_RowEditing(object sender, GridViewEditEventArgs e)
        {
            // Make the GridView control into edit mode  
            // for the selected row.  
            gvProject.EditIndex = e.NewEditIndex;


            // Rebind the GridView control to show data in edit mode. 
            BindGridView();


            // Hide the Add button. 
            lbtnAdd.Visible = false;
        }

        protected void gvProject_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            // Exit edit mode. 
            gvProject.EditIndex = -1;


            // Rebind the GridView control to show data in view mode. 
            BindGridView();


            // Show the Add button. 
            lbtnAdd.Visible = true;
        }

        protected void gvProject_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["WebFormConnectionString"].ToString()))
            {
                // Create a command object. 
                SqlCommand cmd = new SqlCommand();


                // Assign the connection to the command. 
                cmd.Connection = conn;


                // Set the command text 
                // SQL statement or the name of the stored procedure  
                cmd.CommandText = "UPDATE Project SET ProjectName = @ProjectName WHERE ProjectID = @ProjectID";


                // Set the command type 
                // CommandType.Text for ordinary SQL statements;  
                // CommandType.StoredProcedure for stored procedures. 
                cmd.CommandType = CommandType.Text;


                // Get the ProjectID of the selected row. 
                string strProjectID = gvProject.Rows[e.RowIndex].Cells[2].Text;                
                string strProjectName = ((TextBox)gvProject.Rows[e.RowIndex].FindControl("TextBox2")).Text;


                // Append the parameters. 
                cmd.Parameters.Add("@ProjectID", SqlDbType.Int).Value = strProjectID;                
                cmd.Parameters.Add("@ProjectName", SqlDbType.VarChar, 50).Value = strProjectName;


                // Open the connection. 
                conn.Open();


                // Execute the command. 
                cmd.ExecuteNonQuery();
            }


            // Exit edit mode. 
            gvProject.EditIndex = -1;


            // Rebind the GridView control to show data after updating. 
            BindGridView();


            // Show the Add button. 
            lbtnAdd.Visible = true;
        }

        protected void gvProject_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["WebFormConnectionString"].ToString()))
            {
                // Create a command object. 
                SqlCommand cmd = new SqlCommand();


                // Assign the connection to the command. 
                cmd.Connection = conn;


                // Set the command text 
                // SQL statement or the name of the stored procedure  
                cmd.CommandText = "DELETE FROM Project WHERE ProjectID = @ProjectID";


                // Set the command type 
                // CommandType.Text for ordinary SQL statements;  
                // CommandType.StoredProcedure for stored procedures. 
                cmd.CommandType = CommandType.Text;


                // Get the ProjectID of the selected row. 
                string strProjectID = gvProject.Rows[e.RowIndex].Cells[2].Text;


                // Append the parameter. 
                cmd.Parameters.Add("@ProjectID", SqlDbType.Int).Value = strProjectID;


                // Open the connection. 
                conn.Open();


                // Execute the command. 
                cmd.ExecuteNonQuery();
            }


            // Rebind the GridView control to show data after deleting. 
            BindGridView();
        }

        protected void gvProject_Sorting(object sender, GridViewSortEventArgs e)
        {
            string[] strSortExpression = ViewState["SortExpression"].ToString().Split(' ');


            // If the sorting column is the same as the previous one,  
            // then change the sort order. 
            if (strSortExpression[0] == e.SortExpression)
            {
                if (strSortExpression[1] == "ASC")
                {
                    ViewState["SortExpression"] = e.SortExpression + " " + "DESC";
                }
                else
                {
                    ViewState["SortExpression"] = e.SortExpression + " " + "ASC";
                }
            }
            // If sorting column is another column,   
            // then specify the sort order to "Ascending". 
            else
            {
                ViewState["SortExpression"] = e.SortExpression + " " + "ASC";
            }


            // Rebind the GridView control to show sorted data. 
            BindGridView();
        }

        protected void gvProject_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            // Make sure the current GridViewRow is a data row. 
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // Make sure the current GridViewRow is either  
                // in the normal state or an alternate row. 
                if (e.Row.RowState == DataControlRowState.Normal || e.Row.RowState == DataControlRowState.Alternate)
                {
                    // Add client-side confirmation when deleting. 
                    ((LinkButton)e.Row.Cells[1].Controls[0]).Attributes["onclick"] = "if(!confirm('Are you certain you want to delete this Project ?')) return false;";
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
                cmd.CommandText = "INSERT INTO Project (  ProjectName ) VALUES ( @ProjectName )";


                // Set the command type 
                // CommandType.Text for ordinary SQL statements;  
                // CommandType.StoredProcedure for stored procedures. 
                cmd.CommandType = CommandType.Text;


                // Append the parameters.                 
                cmd.Parameters.Add("@ProjectName", SqlDbType.VarChar, 50).Value = tbProjectName.Text;


                // Open the connection. 
                conn.Open();


                // Execute the command. 
                cmd.ExecuteNonQuery();
            }


            // Rebind the GridView control to show inserted data. 
            BindGridView();


            // Empty the TextBox controls. 
            //tbLastName.Text = "";
            tbProjectName.Text = "";


            // Show the Add button and hiding the Add panel. 
            lbtnAdd.Visible = true;
            pnlAdd.Visible = false;
        }

        protected void lbtnCancel_Click(object sender, EventArgs e)
        {
            // Empty the TextBox controls. 
            //tbLastName.Text = "";
            tbProjectName.Text = "";


            // Show the Add button and hiding the Add panel. 
            lbtnAdd.Visible = true;
            pnlAdd.Visible = false;
        }
    }
}