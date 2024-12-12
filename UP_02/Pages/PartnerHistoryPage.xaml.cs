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
using UP_02.Model;

namespace UP_02.Pages
{
    /// <summary>
    /// Interaction logic for PartnerHistoryPage.xaml
    /// </summary>
    public partial class PartnerHistoryPage : Page
    {
        public PartnerHistoryPage()
        {
            InitializeComponent();
            DataGridHistory.ItemsSource = Entities.GetContext().PartnerProducts.ToList();
        }
        public PartnerHistoryPage(Partners y)
        {
            InitializeComponent();
            DataGridHistory.ItemsSource = Entities.GetContext().PartnerProducts.Where(x=>x.IdPartner==y.Id).ToList();
            TblPartner.Text = y.Name;
        }
    }
}
