using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace Archies
{
    public partial class AddPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                clearControls();
                refreshdata();
            }
        }
        public void refreshdata()
        {
            string con = "Data Source=DESKTOP-JPJBUP8\\SQLEXPRESS;Initial Catalog=Archies;Integrated Security=true";
            SqlConnection db = new SqlConnection(con);
            db.Open();
            SqlCommand cmd = new SqlCommand("select * from Tbl_ProductMaster WHERE IsActive='1'", db);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
        public void clearControls()
        {
            TxtName.Text = "";
            TxtProductCode.Text = "";
            TxtDescription.Text = " ";
            TxtPrice.Text = " ";
            RegularExpressionValidator4.Enabled = false;
        }
        protected void ButtonAdd_Click(object sender, EventArgs e)
        {
            string con = "Data Source=DESKTOP-JPJBUP8\\SQLEXPRESS;Initial Catalog=Archies;Integrated Security=true";
            SqlConnection db = new SqlConnection(con);
            //Double price = Convert.ToDouble(TxtPrice.Text);
            decimal price = Convert.ToDecimal(TxtPrice.Text);
            SqlCommand cmd = new SqlCommand("spInsert", db);
            cmd.CommandType = CommandType.StoredProcedure;
            //cmd.Parameters.AddWithValue("@Action", "Insert");
            cmd.Parameters.AddWithValue("@Name", TxtName.Text);
            cmd.Parameters.AddWithValue("@ProductCode", TxtProductCode.Text);
            cmd.Parameters.AddWithValue("@Description", TxtDescription.Text);
            cmd.Parameters.AddWithValue("@Price", price);
            db.Open();
            int m = cmd.ExecuteNonQuery();
            db.Close();
            if (m != 0)
            {
                refreshdata();
                clearControls();
                Response.Write("<script>alert('You have insert successfully!!')</script>");

            }
            else
            {

                Response.Write("<script>alert('Something wents wrong !!')</script>");
            }

        }
        protected void ButtonClear_Click(object sender, EventArgs e)
        {
            string con = "Data Source=DESKTOP-JPJBUP8\\SQLEXPRESS;Initial Catalog=Archies;Integrated Security=true";
            SqlConnection db = new SqlConnection(con);
            clearControls();
        }
        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

            string con = "Data Source=DESKTOP-JPJBUP8\\SQLEXPRESS;Initial Catalog=Archies;Integrated Security=true";
            SqlConnection db = new SqlConnection(con);
            db.Open();

            //int id = Convert.ToInt16(GridView1.DataKeys[e.RowIndex].Values["id"].ToString());
            ////con.Open();
            //SqlCommand cmd = new SqlCommand("delete from Tbl_ProductMaster where id =@id", db);
            //cmd.Parameters.AddWithValue("id", id);
            //int i = cmd.ExecuteNonQuery();
            //refreshdata();
            //db.Close();

            int id = Convert.ToInt16(GridView1.DataKeys[e.RowIndex].Values["id"].ToString());
            Label txtName = GridView1.Rows[e.RowIndex].FindControl("lblName") as Label;
            Label txtProductCode = GridView1.Rows[e.RowIndex].FindControl("lblProductCode") as Label;
            Label txtDescription = GridView1.Rows[e.RowIndex].FindControl("lblDescription") as Label;
            Label txtPrice = GridView1.Rows[e.RowIndex].FindControl("lblPrice") as Label;
            SqlCommand cmd = new SqlCommand("spDelete", db);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Id", id);
            //cmd.Parameters.AddWithValue("@Name", txtName.Text);
            //cmd.Parameters.AddWithValue("@ProductCode", txtProductCode.Text);
            //cmd.Parameters.AddWithValue("@Description", txtDescription.Text);
            //cmd.Parameters.AddWithValue("@Price", txtPrice.Text);
            //cmd.Parameters.AddWithValue("@Isactive", false);
            int i = cmd.ExecuteNonQuery();
            db.Close();
            if (i != 0)
            {
                refreshdata();
                Response.Write("<script>alert('You have Deleted successfully!!')</script>");
            }
            else
            {
                Response.Write("<script>alert('Something wents wrong !!')</script>");
            }
            GridView1.EditIndex = -1;
        }
        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            refreshdata();
        }
        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            refreshdata();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string con = "Data Source=DESKTOP-JPJBUP8\\SQLEXPRESS;Initial Catalog=Archies;Integrated Security=true";
            SqlConnection db = new SqlConnection(con);


            TextBox txtName = GridView1.Rows[e.RowIndex].FindControl("txtName") as TextBox;
            TextBox txtProductCode = GridView1.Rows[e.RowIndex].FindControl("txtProductCode") as TextBox;
            TextBox txtDescription = GridView1.Rows[e.RowIndex].FindControl("txtDescription") as TextBox;
            TextBox txtPrice = GridView1.Rows[e.RowIndex].FindControl("txtPrice") as TextBox;
            int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values["id"].ToString());
            SqlCommand cmd = new SqlCommand("spUpdate", db);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Id", id);
            cmd.Parameters.AddWithValue("@Name", txtName.Text);
            cmd.Parameters.AddWithValue("@ProductCode", txtProductCode.Text);
            cmd.Parameters.AddWithValue("@Description", txtDescription.Text);
            cmd.Parameters.AddWithValue("@Price", txtPrice.Text);
            cmd.Parameters.AddWithValue("@Isactive", true);
            db.Open();

            int i = cmd.ExecuteNonQuery();
          
            db.Close();
            if (i != 0)
            {
               
                Response.Write("<script>alert('You have Updated successfully!!')</script>");
               
            }
            else
            {
                Response.Write("<script>alert('Something wents wrong !!')</script>");
            }
            
            GridView1.EditIndex = -1;
            refreshdata();
        }

    }
}