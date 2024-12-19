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
using UP_02.Up_02;

namespace UP_02.Pages
{
    /// <summary>
    /// Interaction logic for PartnersPage.xaml
    /// </summary>
    public partial class PartnersPage : Page
    {
        private List<Partn> newPartners;
        public PartnersPage()
        {
            InitializeComponent();
            var currentPartners = Entities.GetContext().Partners.ToList();
            newPartners = new List<Partn>(); 
            foreach (Partners partner in currentPartners)
            {
                newPartners.Add(new Partn(partner));
            }
            ListPartners.ItemsSource = newPartners;
        }

        private void BtAdd_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new AddPartnersPage(null));            
        }

        private void ListPartners_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {
            if (sender is ListBox listBox)
            {             
                var selectedItem = listBox.SelectedItem as Partn; 
                if (selectedItem != null)
                {
                    NavigationService.Navigate(new AddPartnersPage(selectedItem.partner));
                }
            }         
        }   
    }
    class Partn : Partners
    {
        public Partners partner;
        public string discount { get; set; }
        public Partn(Partners partner)
        {
            this.partner = partner;
            this.Id = partner.Id;
            this.IdPartnersType = partner.IdPartnersType;
            this.Name = partner.Name;
            this.Director = partner.Director;
            this.Email = partner.Email;
            this.PhoneNumber = partner.PhoneNumber;
            this.Address = partner.Address;
            this.INN = partner.INN;
            this.Rating = partner.Rating;
            this.PartnerProducts = partner.PartnerProducts;
            this.PartnersType = partner.PartnersType;
            int count = Entities.GetContext().PartnerProducts.Where(x => x.IdPartner == partner.Id).ToList().Count();
            if (count > 0)
            {
                count = Entities.GetContext().PartnerProducts.Where(x => x.IdPartner == partner.Id).ToList().Sum(p => p.Quantity);
            }
            if (count > 300000)
                discount = "15%";
            else if (count <= 300000 & count >= 50000)
                discount = "10%";
            else if (count >= 10000 & count < 50000)
                discount = "5%";
            else
                discount = "0%";
        }
        
    }
}




