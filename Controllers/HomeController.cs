using Assessment.Web.BusinessServices;
using Assessment.Web.ViewModel;
using System.Web.Mvc;

namespace Assessment.Web.Controllers
{
    public class HomeController : Controller
    {
        private readonly TeamServices _teamService;

        public HomeController()
        {
            this._teamService = new TeamServices();
        }

        public ActionResult Index()
        {
            return View(_teamService.GetTeam());
        }

        public ActionResult AddEditTeam( int? teamId)
        {
            var team = new TeamViewModel();
            try
            {
                if (teamId != null)
                {
                    return View(_teamService.GetTeamById(teamId.Value));
                }

                team.TeamMembers.Insert(0, new TemaMemberModel());

                return View(team);
            }
            catch (System.Exception)
            {
                throw;
            }
        }

        [HttpPost]
        public ActionResult AddEditTeam(TeamViewModel model)
        {
            if (ModelState.IsValid)
            {
                _teamService.AddEditTeam(model);
            }

            return RedirectToAction("/");
        }
    }
}