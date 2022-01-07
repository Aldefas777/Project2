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
    /// Логика взаимодействия для PageAdd.xaml
    /// </summary>
    public partial class PageAdd : Page
    {
        public PageAdd()
        {
            InitializeComponent();

            comboOwner.SelectedValuePath = "id";
            comboOwner.DisplayMemberPath = "Name";
            comboOwner.ItemsSource = ConnectDB.conObj.Type_Material.ToList();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                Sklad sklad = new Sklad()
                {
                    Adress = txtAdress.Text,
                    Rasstoyanie = Convert.ToInt32(txtRasstoyanie.Text),
                    Type_Material = comboOwner.SelectedItem as Type_Material

                };
                ConnectDB.conObj.Sklads.Add(sklad);
                ConnectDB.conObj.SaveChanges();
                MessageBox.Show("Данные успешно добавлены!", "Уведомление", MessageBoxButton.OK, MessageBoxImage.Information);
            }
            catch (Exception er)
            {
                MessageBox.Show(er.Message.ToString());
            }
        }
    }
}
