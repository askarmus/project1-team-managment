using System.Collections.Generic;

namespace Assessment.Web.LookupModel
{
    public class Gender
    {
        public int Id { get; set; }
        public string Value { get; set; }
        public Gender(int Code, string Description)
        {
            this.Id = Code;
            this.Value = Description;
        }

        public static IEnumerable<Gender> GetGender()
        {
            return new List<Gender> {
                new Gender(0, "Male"),
                new Gender(1, "Female"),
            };
        }
    }

    public class JobPosition
    {
        public int Code { get; set; }
        public string Position { get; set; }
        public JobPosition(int Code, string Position)
        {
            this.Code = Code;
            this.Position = Position;
        }

        public static IEnumerable<JobPosition> GetJobPositions()
        {
            return new List<JobPosition> { 
                new JobPosition(1,"Applications Engineer"),
                new JobPosition(2,"Chief Technology Officer"),
                new JobPosition(3,"Chief Information Officer"),
                new JobPosition(4,"Computer and Information Systems Manager"),
                new JobPosition(5,"Database Administrator"),
                new JobPosition(6,"Help Desk Technician"),
                new JobPosition(7,"Information Technology Director"),
                new JobPosition(8,"Information Technology Manager"),
                new JobPosition(9,"Management Information Systems Director"),
                new JobPosition(10,"Network Architect"),
                new JobPosition(11,"Network Engineer"),
                new JobPosition(12,"Network System Administrator"),
                new JobPosition(13,"Programmer"),
                new JobPosition(14,"Programmer Analyst"),
                new JobPosition(15,"Security Specialist"),
                new JobPosition(16,"Senior Applications Engineer"),
                new JobPosition(17,"Senior Database Administrator"),
                new JobPosition(18,"Senior Network Architect"),
                new JobPosition(19,"Senior Network Engineer"),
                new JobPosition(20,"Senior Network System Administrator"),
                new JobPosition(21,"Senior Programmer"),
                new JobPosition(22,"Senior Programmer Analyst"),
                new JobPosition(23,"Senior Security Specialist"),
                new JobPosition(24,"Senior Software Engineer"),
                new JobPosition(25,"Senior Support Specialist"),
                new JobPosition(26,"Senior System Administrator"),
                new JobPosition(27,"Senior System Analyst"),
                new JobPosition(28,"Senior System Architect"),
                new JobPosition(29,"Senior System Designer"),
                new JobPosition(30,"Senior Systems Analyst"),
                new JobPosition(31,"Senior Systems Software Engineer"),
                new JobPosition(32,"Senior Web Administrator"),
                new JobPosition(33,"Senior Web Developer"),
                new JobPosition(34,"Software Engineer"),
                new JobPosition(35,"Software Quality Assurance Analyst"),
                new JobPosition(36,"Support Specialist"),
                new JobPosition(37,"System Administrator"),
                new JobPosition(38,"System Analyst"),
                new JobPosition(39,"System Architect"),
                new JobPosition(40,"System Designer"),
                new JobPosition(41,"Systems Analyst"),
                new JobPosition(42,"Systems Software Engineer"),
                new JobPosition(43,"Technical Specialist"),
                new JobPosition(44,"Telecommunications Specialist"),
                new JobPosition(45,"Web Administrator"),
                new JobPosition(46,"Web Developer"),
                new JobPosition(47,"Webmaster")
            };
        }
    }
}