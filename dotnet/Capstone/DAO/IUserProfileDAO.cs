using Capstone.Models;

namespace Capstone.DAO
{
    public interface IUserProfileDAO
    {
        UserProfile GetUserProfile(int id);
        void UpdateUserProfile(int id, UserProfile profile);
    }
}