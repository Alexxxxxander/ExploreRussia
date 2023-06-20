using System;

namespace ExploreRussia.MVVM.Model
{
    /// <summary>
    /// Модель заявки
    /// </summary>
    internal class ApplicationModel
    {
        public int Id { get; set; }
        public int TourId { get; set; }
        public string FName { get; set; }
        public string LName { get; set; }
        public string Patronymic { get; set; }
        public string Phone { get; set; }
        public string Email { get; set; }
        public DateTime DateCreated { get; set; }
    }
}
