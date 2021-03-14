using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Assessment.Web.ViewModel
{
    public class TeamViewModel
    {
        public int TeamId { get; set; }

        [Required(ErrorMessage = "Enter employee name!")]
        [Display(Name = "Employee name")]
        [StringLength(100, ErrorMessage = "The {0} must be at least {2} characters long.", MinimumLength = 6)]
        public string Name { get; set; }

        [Required(ErrorMessage = "Description is required!")]
        [Display(Name = "Job position")]
        public string  Description { get; set; }

        public List<TemaMemberModel> TeamMembers { get; set; }

        public TeamViewModel()
        {
            TeamMembers = new List<TemaMemberModel>();
        }
    }

    public class TemaMemberModel
    {
        public int? TeamMemberId { get; set; }
        

        [Required(ErrorMessage = "Enter name!")]
        public string Name { get; set; }

        [Required(ErrorMessage = "Select gender!")]
        public string Gender { get; set; }

        [Required(ErrorMessage = "Enter contact number!")]
        public string ContactNumber { get; set; }

        [Required(ErrorMessage = "Select date of birth!")]
        public string DOB { get; set; }
    }
}