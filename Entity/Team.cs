using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Assessment.Web.Entity
{
    public class Team
    {
        [Key]
        public int TeamId { get; set; }
        [Required]
        public string TeamName { get; set; }

        [Required]
        public string Description { get; set; }

        public ICollection<TeamMember> TeamMembers { get; set; }
     }
}