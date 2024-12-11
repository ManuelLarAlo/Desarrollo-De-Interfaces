using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.OleDb;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.Button;
using static System.Windows.Forms.VisualStyles.VisualStyleElement;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.ToolBar;

namespace Practica7Entrega
{
    public partial class Form2 : Form
    {
        OleDbCommand oleCommand;
        OleDbDataAdapter oleAdapter;
        OleDbCommandBuilder oleBuilder;
        DataSet oleDs;
        DataTable oleTable;

        public Form2()
        {
            cargarGridView();
            cargaComboBox();
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            int registros = guardarDescripcion();
            if (registros < 0) MessageBox.Show("No se ha podido guardar la descripcion");
            else MessageBox.Show("Descripcion guardada");
            cargarGridView();
            cargaComboBox();

        }

        private void button3_Click(object sender, EventArgs e)
        {
            guardarModificacion();
            cargarGridView();
            cargaComboBox();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            borradoDescripcion();
            cargarGridView();
            cargaComboBox();
        }

        private int guardarDescripcion()
        {
            int filas;
            try
            {
                string conexion = "Provider=Microsoft.ACE.OLEDB.12.0; Data Source=|DataDirectory|\\practica.accdb";
                string descripcion = textBox1.Text;
                string sentencia = "INSERT INTO Evaluaciones(Evaluacion) values ('" + descripcion + "')";

                OleDbConnection miCnx = new OleDbConnection(conexion);
                OleDbCommand miCmd = new OleDbCommand(sentencia, miCnx);
                miCnx.Open();
                filas = miCmd.ExecuteNonQuery();
                textBox1.Text = "";
                miCnx.Close();
                miCnx.Dispose();
            }
            catch
            {
                filas = -1;
            }
            return filas;
        }

        private void cargarGridView()
        {
            string conexion = "Provider=Microsoft.ACE.OLEDB.12.0; Data Source=|DataDirectory|\\practica.accdb";
            string sentencia = "SELECT * FROM Evaluaciones";
            OleDbConnection miCnx = new OleDbConnection(conexion);
            miCnx.Open();

            oleCommand = new OleDbCommand(sentencia, miCnx);
            oleAdapter = new OleDbDataAdapter(oleCommand);
            oleBuilder = new OleDbCommandBuilder(oleAdapter);

            oleDs = new DataSet();
            oleAdapter.Fill(oleDs, "Evaluaciones");
            oleTable = oleDs.Tables["Evaluaciones"];
            miCnx.Close();

            dataGridView1.ReadOnly = true;
            dataGridView1.DataSource = oleDs.Tables["Evaluaciones"];
            dataGridView1.SelectionMode = DataGridViewSelectionMode.FullRowSelect;
        }

        public void guardarModificacion()
        {
            oleAdapter.Update(oleTable);

        }
        private void borradoDescripcion()
        {
            if (MessageBox.Show("Estas seguro de que quieres borrar esta fila?", "Delete", MessageBoxButtons.YesNo) == DialogResult.Yes)
            {
                if (comboBox1.SelectedIndex >= 0) // Asegurarte de que hay un elemento seleccionado
                {
                    // Obtener el DataTable desde el DataSource
                    DataTable table = (DataTable)comboBox1.DataSource;

                    // Eliminar la fila correspondiente al elemento seleccionado
                    table.Rows[comboBox1.SelectedIndex].Delete();

                    // Actualizar el DataSource (esto es opcional porque ya está vinculado)
                    comboBox1.DataSource = null; // Desvincular temporalmente si es necesario
                    comboBox1.DataSource = table;
                }
                else
                {
                    MessageBox.Show("Seleccione un elemento para eliminar.");
                }
                oleAdapter.Update(oleTable);
            }
        }

        private void cargaComboBox()
        {
            string conexion = "Provider=Microsoft.ACE.OLEDB.12.0; Data Source=|DataDirectory|\\practica.accdb";
            string sentencia = "SELECT * FROM Evaluaciones";
            OleDbConnection miCnx = new OleDbConnection(conexion);
            miCnx.Open();

            oleCommand = new OleDbCommand(sentencia, miCnx);
            oleAdapter = new OleDbDataAdapter(oleCommand);
            oleBuilder = new OleDbCommandBuilder(oleAdapter);

            oleDs = new DataSet();
            oleAdapter.Fill(oleDs, "Evaluaciones");
            oleTable = oleDs.Tables["Evaluaciones"];
            miCnx.Close();

            comboBox1.DataSource = oleDs.Tables["Evaluaciones"];
            comboBox1.DisplayMember = "Evaluacion";
        }

        private void button2_Click(object sender, EventArgs e)
        {
            cargarGridView();
            cargaComboBox();
        }
        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}
