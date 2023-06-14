using System;
using System.Globalization;
using System.Windows.Data;

namespace ExploreRussia.MVVM.Converters
{
    internal class ComboBoxPopupWidthConverter : IValueConverter
    {
        public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
        {
            double width = (double)value;
            return width - 40;
        }

        public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
        {
            double width = (double)value;
            return width + 40;
        }
    }
}
