using System;
using System.Data.Entity;
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
using UP_02.Model;

namespace UP_02.Pages
{
    /// <summary>
    /// Interaction logic for PartnersPage.xaml
    /// </summary>
    public partial class PartnersPage : Page
    {
        public PartnersPage()
        {
            InitializeComponent();
            var currentPartners = Entities.GetContext().Partners.Include(p => p.PartnersType).ToList();
            ListPartners.ItemsSource = currentPartners;
        }

        private void BtAdd_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new AddPartnersPage(null));
            
        }

        private void ListPartners_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {
            if (sender is ListBox listBox)
            {
               
                var selectedItem = listBox.SelectedItem as Partners;

                
                if (selectedItem != null)
                {
                    NavigationService.Navigate(new AddPartnersPage(selectedItem));
                }
            }
          
        }
    }
}
