using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.Common;
using System.Data.OleDb;
using System.Drawing;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Practica7Entrega
{
    public partial class Form1 : Form
    {
        OleDbCommand oleCommand;
        OleDbDataAdapter oleAdapter;
        OleDbCommandBuilder oleBuilder;
        DataSet oleDs;
        DataTable oleTable;

        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            cargarGridView();
            dataGridView1.ReadOnly = true;
            
        }

        private void cargarGridView()
        {
            string conexion = "Provider=Microsoft.ACE.OLEDB.12.0; Data Source=|DataDirectory|\\practica.accdb";
            string sentencia = "SELECT * FROM Alumnos";
            OleDbConnection miCnx = new OleDbConnection(conexion);
            miCnx.Open();

            oleCommand = new OleDbCommand(sentencia, miCnx);
            oleAdapter = new OleDbDataAdapter(oleCommand);
            oleBuilder = new OleDbCommandBuilder(oleAdapter);

            oleDs = new DataSet();
            oleAdapter.Fill(oleDs, "Alumnos");
            oleTable = oleDs.Tables["Alumnos"];
            miCnx.Close();

            dataGridView1.DataSource = oleDs.Tables["Alumnos"];
            dataGridView1.ReadOnly = true;
            button3.Enabled = false;
            dataGridView1.SelectionMode = DataGridViewSelectionMode.FullRowSelect;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            int registros = guardarAlumno();
            if (registros < 0) MessageBox.Show("No se ha podido guardar alumno/a");
            else MessageBox.Show("Alumno/a guardado");
        }

        private void button2_Click(object sender, EventArgs e)
        {
            modificarRegistro();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            guardarModificacion();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            borradoAlumno();
        }

        private int guardarAlumno()
        {
            int filas;
            try
            {
                string conexion = "Provider=Microsoft.ACE.OLEDB.12.0; Data Source=|DataDirectory|\\practica.accdb";
                string nombre = textBox1.Text;
                string apellidos = textBox2.Text;
                string nif = textBox3.Text;
                bool baja = checkBox1.Checked;
                string sentencia = "INSERT INTO ALUMNOS(Nombre, Apellidos, NIF, Baja) values ('" + nombre + "', '" + apellidos + "', '" + nif + "' , " + baja + ")";

                OleDbConnection miCnx = new OleDbConnection(conexion);
                OleDbCommand miCmd = new OleDbCommand(sentencia, miCnx);
                miCnx.Open();
                filas = miCmd.ExecuteNonQuery();
                textBox1.Text = "";
                textBox2.Text = "";
                textBox3.Text = "";
                checkBox1.Checked = false;
                miCnx.Close();
                miCnx.Dispose();
            }
            catch
            {
                filas = -1;
            }
            return filas;
        }

        public void guardarModificacion()
        {
            oleAdapter.Update(oleTable);
            dataGridView1.ReadOnly = true;
            button3.Enabled = false;
            button2.Enabled = true;
            button4.Enabled = true;

        }

        private void modificarRegistro()
        {

            button2.Enabled = false;
            button3.Enabled = true;
            button4.Enabled = false;
            dataGridView1.ReadOnly = false;

        }
        private void borradoAlumno()
        {
            if (MessageBox.Show("Estas seguro de que quieres borrar esta fila?", "Delete", MessageBoxButtons.YesNo) == DialogResult.Yes)
            {
                dataGridView1.Rows.RemoveAt(dataGridView1.SelectedRows[0].Index);
                oleAdapter.Update(oleTable);
            }
        }

        private void button5_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form2 form2 = new Form2();
            form2.Show();
            cargarGridView();
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }
    }
}
