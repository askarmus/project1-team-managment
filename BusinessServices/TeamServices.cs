using Assessment.Web.DataServices;
using Assessment.Web.Mapper;
using Assessment.Web.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Assessment.Web.BusinessServices
{
	public class TeamServices
	{
		private readonly AssessmentContext _dbContext;

		public TeamServices()
		{
			this._dbContext = new AssessmentContext();
		}

		public List<TeamViewModel> GetTeam()
		{
            try
            {
				var team = new List<TeamViewModel>();
				var teamResult = this._dbContext.Team.OrderByDescending(o=>o.TeamId).ToList();

				return teamResult.Select(s => TeamMapper.ToTeamModel(s)).ToList();
			}
            catch (Exception)
            {

                throw;
            }
			
		}

        public void AddEditTeam(TeamViewModel model)
        {
            try
            {
                var teamEntity = TeamMapper.ToTeamEntity(model);

                if (model.TeamId == 0) // ADD MEMBER
                {
                    _dbContext.Team.Add(teamEntity);
                    _dbContext.SaveChanges();
                }

                else // EDIT MEMBER
                {
                    var teamResult = this._dbContext.Team.Include("TeamMembers").FirstOrDefault(w => w.TeamId == model.TeamId);

                    teamResult.TeamName = model.Name;
                    teamResult.Description = model.Description;

                    foreach (var dbMmeber in teamResult.TeamMembers.ToList())
                    {
                        var member2Update = model.TeamMembers.FirstOrDefault(w => w.TeamMemberId == dbMmeber.TeamMemberId);
                        if (member2Update == null)
                        {
                            _dbContext.TeamMember.Remove(dbMmeber); //Deleted from UI
                        }
                        else //update member
                        {
                            dbMmeber.Gender = member2Update.Gender;
                            dbMmeber.ContactNumber = member2Update.ContactNumber;
                            dbMmeber.DOB = member2Update.DOB;
                            dbMmeber.Name = member2Update.Name;
                        }
                    }

                    //new item 
                    foreach (var dbMmeber in model.TeamMembers.Where(w => w.TeamMemberId == null).ToList())
                    {
                        var teamMeber = TeamMapper.ToTeamMemberEntity(dbMmeber, model.TeamId);
                        _dbContext.TeamMember.Add(teamMeber);
                    }

                    _dbContext.SaveChanges();
                }
            }
            catch (System.Exception)
            {
                throw;
            }
        }


        public TeamViewModel GetTeamById( int teamId)
        {
            var team = new TeamViewModel();
            try
            {
                var teamResult = this._dbContext.Team.Include("TeamMembers").FirstOrDefault(w => w.TeamId == teamId);
                if (teamResult != null) ;

                return TeamMapper.ToTeamModel(teamResult);
            }
            catch (System.Exception)
            {
                throw;
            }
        }
	}
}