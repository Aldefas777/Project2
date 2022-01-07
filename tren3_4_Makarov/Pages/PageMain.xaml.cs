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
using System.Windows.Threading;
using tren3_4_Makarov.AppDataFile;
using tren3_4_Makarov.Pages;

namespace tren3_4_Makarov.Pages
{
    /// <summary>
    /// Логика взаимодействия для PageMain.xaml
    /// </summary>
    public partial class PageMain : Page
    {
        public PageMain()
        {
            InitializeComponent();

            DispatcherTimer timer = new DispatcherTimer();

            ListSclad.ItemsSource = ConnectDB.conObj.Materials.ToList();

            timer.Interval = TimeSpan.FromSeconds(10);
            timer.Tick += UpdateData;
            timer.Start();
        }

        private void UpdateData(object sender, EventArgs e)
        {
            ListSclad.ItemsSource = ConnectDB.conObj.Sklads.ToList();
        }

        private void btnRed_Click(object sender, RoutedEventArgs e)
        {
            FrameObj.FrameMain.Navigate(new PageEdit((sender as Button).DataContext as Sklad));
        }

        private void btnAdd_Click(object sender, RoutedEventArgs e)
        {
            FrameObj.FrameMain.Navigate(new PageAdd());
        }

        private void btnDelete_Click(object sender, RoutedEventArgs e)
        {
            if (MessageBox.Show("Вы точно хотите удалить данную запись?", "Внимание", MessageBoxButton.YesNo, MessageBoxImage.Question) == MessageBoxResult.Yes)
            {
                try
                {

                    ConnectDB.conObj.Sklads.Remove(((sender as Button).DataContext as Sklad));
                    ConnectDB.conObj.SaveChanges();
                    MessageBox.Show("Данные удалены!");
                }
                catch (Exception er)
                {
                    MessageBox.Show(er.Message.ToString());
                }

            }
            
            
        }
    }
}
