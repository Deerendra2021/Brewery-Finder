using Capstone.Models;

namespace Capstone.DAO
{
    public interface IUserProfileDAO
    {
        void AddUserProfile(UserProfile newProfile);
        UserProfile GetUserProfile(int id);
        UserProfile UpdateUserProfile(int id, UserProfile profile);
    }
}