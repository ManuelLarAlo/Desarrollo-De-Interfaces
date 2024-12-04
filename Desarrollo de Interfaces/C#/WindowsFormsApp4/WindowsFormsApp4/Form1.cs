using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace WindowsFormsApp4
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            // TODO: esta línea de código carga datos en la tabla 'gestionDataSet.Proveedores' Puede moverla o quitarla según sea necesario.
            this.proveedoresTableAdapter.Fill(this.gestionDataSet.Proveedores);

            // TODO: esta línea de código carga datos en la tabla 'gestionDataSet.Articulos' Puede moverla o quitarla según sea necesario.
            this.articulosTableAdapter.FillByIdProveedor(this.gestionDataSet.Articulos, comboBox1.SelectedValue.ToString());

        }
    }
}
