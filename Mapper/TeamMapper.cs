using Assessment.Web.Entity;
using Assessment.Web.ViewModel;
using System.Collections;
using System.Collections.Generic;
using System.Linq;

namespace Assessment.Web.Mapper
{
    public static class TeamMapper
    {
        public static Team ToTeamEntity(TeamViewModel model)
        {
            Team team = new Team();
            team.TeamName = model.Name;
            team.Description = model.Description;

            team.TeamMembers = new List<TeamMember>();

            foreach(var member in model.TeamMembers)
            {
                team.TeamMembers.Add(new TeamMember()
                {
                    DOB = member.DOB,
                    ContactNumber = member.ContactNumber,
                    Name = member.Name,
                    Gender = member.Gender
                }) ;
            }

            return team;
        }


        public static TeamMember ToTeamMemberEntity(TemaMemberModel model, int teamId)
        {
            TeamMember member = new TeamMember();

            member.DOB = model.DOB;
            member.ContactNumber = model.ContactNumber;
            member.Name = model.Name;
            member.Gender = model.Gender;
            member.TeamId = teamId;

            return member;
        }

        public static TeamViewModel ToTeamModel(Team model)
        {
            TeamViewModel team = new TeamViewModel();
            team.TeamId = model.TeamId;
            team.Name = model.TeamName;
            team.Description = model.Description;

            team.TeamMembers = new List<TemaMemberModel>();

            if (model.TeamMembers != null)
            {
                foreach (var member in model.TeamMembers)
                {
                    team.TeamMembers.Add(new TemaMemberModel()
                    {
                        TeamMemberId = member.TeamMemberId,
                        DOB = member.DOB,
                        ContactNumber = member.ContactNumber,
                        Name = member.Name,
                        Gender = member.Gender
                    });
                }
            }

            return team;
        }


    }
}