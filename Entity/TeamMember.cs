using System.ComponentModel.DataAnnotations;

namespace Assessment.Web.Entity
{
    public class TeamMember
    {
        [Key]
        public int TeamMemberId { get; set; }
        [Required]
        public string Name { get; set; }

        [Required]
        public string Gender { get; set; }

        [Required]
        public string ContactNumber { get; set; }

        [Required]
        public string DOB { get; set; }
        public Team Team { get; set; }
        public int TeamId { get; set; }

    }
}