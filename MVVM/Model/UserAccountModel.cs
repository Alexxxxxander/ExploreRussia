namespace ExploreRussia.MVVM.Model
{
    /// <summary>
    /// Класс модели аккаунтов пользователя
    /// </summary>
    internal class UserAccountModel
    {
        public string Username { get; set; }
        public string DisplayName { get; set; }
        public string FName { get; set; }
        public string LName { get; set; }
        public byte[] ProfilePicture { get; set; }
    }
}
