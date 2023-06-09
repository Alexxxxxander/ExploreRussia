﻿using System.ComponentModel;
using System.Runtime.CompilerServices;


namespace ExploreRussia.Core
{
    /// <summary>
    /// Базовый класс объекта
    /// </summary>
    internal class ObservableObject : INotifyPropertyChanged
    {
        public event PropertyChangedEventHandler PropertyChanged;
        protected void OnPropertyChanged([CallerMemberName] string name = null)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(name));
        }
    }
}
