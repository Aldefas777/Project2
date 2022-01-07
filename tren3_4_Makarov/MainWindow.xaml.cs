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

namespace tren3_4_Makarov
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();

            ConnectDB.conObj = new z3_MakarovEntities();
            FrameObj.FrameMain = FrmMain;

            FrmMain.Navigate(new PageMain());
        }

        private void btnSklad_Click(object sender, RoutedEventArgs e)
        {

        }

        private void btnMaterial_Click(object sender, RoutedEventArgs e)
        {

        }

        private void btnFAQ_Click(object sender, RoutedEventArgs e)
        {

        }

        private void btnBack_Click(object sender, RoutedEventArgs e)
        {
            if (FrameObj.FrameMain.CanGoBack)
            {
                FrameObj.FrameMain.GoBack();
            }
        }
    }
}
