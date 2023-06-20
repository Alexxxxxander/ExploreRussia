using System;

namespace ExploreRussia.MVVM.Model
{
    /// <summary>
    /// Класс модели логов
    /// </summary>
    internal class LogModel
    {
        public int Id { get; set; }
        public int UserId { get; set; }
        public DateTime Time { get; set; }
    }
}
