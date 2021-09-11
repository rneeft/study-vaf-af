using System;
using System.Windows.Forms;

namespace Expirement
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            MessageBox.Show(this, "Hello world version 1");
        }

        private void button2_Click(object sender, EventArgs e)
        {
            MessageBox.Show(this, "Welcome new version!");
        }
    }
}
