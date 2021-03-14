using Assessment.Web.Entity;
using System.Data.Entity;

namespace Assessment.Web.DataServices
{
    public class AssessmentContext : DbContext
    {
        public AssessmentContext():base("assessment")
        {
        }
        public DbSet<Team> Team { get; set; }
        public DbSet<TeamMember> TeamMember { get; set; }
    }
}