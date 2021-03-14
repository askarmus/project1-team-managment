namespace Assessment.Web.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class init : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.Teams",
                c => new
                    {
                        TeamId = c.Int(nullable: false, identity: true),
                        TeamName = c.String(nullable: false),
                        Description = c.String(nullable: false),
                    })
                .PrimaryKey(t => t.TeamId);
            
            CreateTable(
                "dbo.TeamMembers",
                c => new
                    {
                        TeamMemberId = c.Int(nullable: false, identity: true),
                        Name = c.String(nullable: false),
                        Gender = c.String(nullable: false),
                        ContactNumber = c.String(nullable: false),
                        DOB = c.String(nullable: false),
                        TeamId = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.TeamMemberId)
                .ForeignKey("dbo.Teams", t => t.TeamId, cascadeDelete: true)
                .Index(t => t.TeamId);
            
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.TeamMembers", "TeamId", "dbo.Teams");
            DropIndex("dbo.TeamMembers", new[] { "TeamId" });
            DropTable("dbo.TeamMembers");
            DropTable("dbo.Teams");
        }
    }
}
