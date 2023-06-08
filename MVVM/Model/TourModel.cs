using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ExploreRussia.MVVM.Model
{
    internal class TourModel
    {
        public int Id { get; set; }
        public string Title { get; set; }
        public DateTime DateStart { get; set; }
        public DateTime DateEnd { get; set; }
        public Decimal Cost { get; set; }
        public Single Rate { get; set; }
        public string ImageMain { get; set; }
        public string Route { get; set; }
        public int PeopleMin { get; set; }
        public int PeopleMax { get; set; }
        public int Lenght { get; set; }
        public int DifficultyId { get; set; }
        public int AgeMin { get; set; }
        public bool Actual { get; set; }
        public int RegionId { get; set; }
        public string Description { get; set; }
    }
}
