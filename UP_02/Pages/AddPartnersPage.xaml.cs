using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
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
    /// Interaction logic for AddPartnersPage.xaml
    /// </summary>
    public partial class AddPartnersPage : Page
    {
        private Partners _currenPartner = new Partners();
        public AddPartnersPage(Partners selectedPartner)
        {
            InitializeComponent();
            if (selectedPartner != null)
            {
                _currenPartner = selectedPartner;

            }
            else 
            { 
                BtHistory.Visibility = Visibility.Hidden; 
            }
            DataContext = _currenPartner;

            CbType.ItemsSource = Entities.GetContext().PartnersType.ToList();




        }

        //private void BtCancel_Click(object sender, RoutedEventArgs e)
        //{
        //    NavigationService.GoBack();
        //}

        private void BtSave_Click(object sender, RoutedEventArgs e)
        {
            StringBuilder errors = new StringBuilder();

            if (string.IsNullOrWhiteSpace(_currenPartner.Name))
                errors.AppendLine("Укажите наименование партнера!");
            if (CbType.Text == "")
                errors.AppendLine("Выберите тип партнера!");
            if (_currenPartner.Rating.ToString()=="")
                errors.AppendLine("Укажите рейтинг партнера!");
            
            //else
            //    _currentUser.Role = cBoxRole.Text;
            if (string.IsNullOrWhiteSpace(_currenPartner.Address))
                errors.AppendLine("Укажите юридический адрес!");
            if (string.IsNullOrWhiteSpace(_currenPartner.INN))
                errors.AppendLine("Укажите ИНН!");
            if (string.IsNullOrWhiteSpace(_currenPartner.PhoneNumber))
                errors.AppendLine("Укажите номер телефона!");
            if (string.IsNullOrWhiteSpace(_currenPartner.Email))
                errors.AppendLine("Укажите email!");

            if (errors.Length > 0)
            {
                MessageBox.Show(errors.ToString(), "Внимание", MessageBoxButton.OK, MessageBoxImage.Warning);
                return;
            }
            //string pattern = "^\\d{10}$";
            //string pattern = @"^[+]7\d{0,10}$";
            //string pattern1 = @"^\d{0,1}$";

            if (!Regex.IsMatch(TbRate.Text, @"^\d{0,1}$") | TbRate.Text.Length > 2 | int.Parse(TbRate.Text)>10 | int.Parse(TbRate.Text) < 1)
            {
                MessageBox.Show("Введите рейтинг от 1 до 10!", "Внимание!", MessageBoxButton.OK, MessageBoxImage.Information);
                return;
            }

            if (!Regex.IsMatch(TbINN.Text, @"^\d{10}$")| TbINN.Text.Length>10)
            {
                MessageBox.Show("Введите ИНН, состоящий из 10 цифр!", "Внимание!", MessageBoxButton.OK, MessageBoxImage.Information);
                return;
            }
            if (!Regex.IsMatch(TbPhone.Text, @"^[+]7\d{10}$") | TbPhone.Text.Length != 12)
            {
                MessageBox.Show("Введите номер телефона в формате +7XXXXXXXXXX, состоящий из 12 символов!", "Внимание!", MessageBoxButton.OK, MessageBoxImage.Information);
                return;
            }

            //if (PasswordBox.Text.Length < 6)
            //{
            //    MessageBox.Show("Введите пароль минимум из 6 символов!");
            //    return;
            //}
            //else if (!Regex.IsMatch(PasswordBox.Text, "^[a-zA-Z0-9]*$") | !Regex.IsMatch(PasswordBox.Text, "[0-9]+") | !Regex.IsMatch(PasswordBox.Text, "[A-Za-z]+"))
            //{
            //    MessageBox.Show("Доступна только английская раскладка! В пароле должна присутствовать хотя бы 1 цифра.");
            //    return;
            //}

            using (var db = new Entities())
            {
                

                
                if (_currenPartner.Id == 0)
                    Entities.GetContext().Partners.Add(_currenPartner);
                try
                {
                    Entities.GetContext().SaveChanges();
                    MessageBox.Show("Данные успешно сохранены!", "Внимание!", MessageBoxButton.OK, MessageBoxImage.Information);
                    NavigationService.Navigate(new PartnersPage());
                }
                catch (Exception o)
                {
                    MessageBox.Show(o.Message.ToString());
                    return;
                }
                

            }

        }

        private void BtHistory_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new PartnerHistoryPage(_currenPartner));
        }

        
    }
}
