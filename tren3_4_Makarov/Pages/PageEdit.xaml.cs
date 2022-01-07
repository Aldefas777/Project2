using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using tren3_4_Makarov.AppDataFile;
using tren3_4_Makarov.Pages;

namespace tren3_4_Makarov.Pages
{
    /// <summary>
    /// Логика взаимодействия для PageEdit.xaml
    /// </summary>
    public partial class PageEdit : Page
    {
        public PageEdit(Sklad sklad)
        {
            InitializeComponent();

            comboOwner.SelectedIndex = (int)sklad.Type_id - 1;
            comboOwner.SelectedValuePath = "id";
            comboOwner.DisplayMemberPath = "Name";
            comboOwner.ItemsSource = ConnectDB.conObj.Type_Material.ToList();

            SkladObj.ID = sklad.id;

            txtAdress.Text = sklad.Adress;
            txtRasstoyanie.Text = Convert.ToString(sklad.Rasstoyanie);
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                IEnumerable<Sklad> sklads = ConnectDB.conObj.Sklads.Where(x => x.id == SkladObj.ID).AsEnumerable().
                    Select(x =>
                    {
                        x.Adress = txtAdress.Text;
                        x.Rasstoyanie = Convert.ToInt32(txtRasstoyanie.Text);
                        x.Type_id = (int)comboOwner.SelectedValue;

                        return x;
                    });

                foreach (Sklad skld in sklads)
                {
                    ConnectDB.conObj.Entry(skld).State = System.Data.Entity.EntityState.Modified;
                }

                ConnectDB.conObj.SaveChanges();
                MessageBox.Show("Данные успешно изменены!", "Уведомление", MessageBoxButton.OK, MessageBoxImage.Information);
            }
            catch (Exception er)
            {
                MessageBox.Show(er.Message.ToString());
            }
        }
    }
}
