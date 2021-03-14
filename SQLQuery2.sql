/****** Object:  Database [AssessmentUNDP]    Script Date: 3/14/2021 2:00:33 PM ******/
CREATE DATABASE [AssessmentUNDP]  (EDITION = 'Basic', SERVICE_OBJECTIVE = 'Basic', MAXSIZE = 2 GB) WITH CATALOG_COLLATION = SQL_Latin1_General_CP1_CI_AS;
GO
ALTER DATABASE [AssessmentUNDP] SET COMPATIBILITY_LEVEL = 140
GO
ALTER DATABASE [AssessmentUNDP] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AssessmentUNDP] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AssessmentUNDP] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AssessmentUNDP] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AssessmentUNDP] SET ARITHABORT OFF 
GO
ALTER DATABASE [AssessmentUNDP] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AssessmentUNDP] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AssessmentUNDP] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AssessmentUNDP] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AssessmentUNDP] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AssessmentUNDP] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AssessmentUNDP] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AssessmentUNDP] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AssessmentUNDP] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AssessmentUNDP] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AssessmentUNDP] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [AssessmentUNDP] SET  MULTI_USER 
GO
ALTER DATABASE [AssessmentUNDP] SET ENCRYPTION ON
GO
ALTER DATABASE [AssessmentUNDP] SET QUERY_STORE = ON
GO
ALTER DATABASE [AssessmentUNDP] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 100, QUERY_CAPTURE_MODE = ALL, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 3/14/2021 2:00:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TeamMembers]    Script Date: 3/14/2021 2:00:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TeamMembers](
	[TeamMemberId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Gender] [nvarchar](max) NOT NULL,
	[ContactNumber] [nvarchar](max) NOT NULL,
	[DOB] [datetime] NOT NULL,
	[TeamId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.TeamMembers] PRIMARY KEY CLUSTERED 
(
	[TeamMemberId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teams]    Script Date: 3/14/2021 2:00:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teams](
	[TeamId] [int] IDENTITY(1,1) NOT NULL,
	[TeamName] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_dbo.Teams] PRIMARY KEY CLUSTERED 
(
	[TeamId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'202103131041131_init', N'Assessment.Web.Migrations.Configuration', 0x1F8B0800000000000400D559CB6EE33614DD17E83F105AB545C64A329B36B067907192C2E8240EA264DA5D404BD70E518A5245CAB051F4CBBAE827F5177AA9B748F99DC714DED824EFE17D1EF2D2FFFEFD4FFFE322E4640E896491183827BD638780F0A38089D9C049D5F4DD8FCEC70FDF7ED3BF0CC205F952AE7BAFD7A1A49003E749A9F8CC75A5FF042195BD90F94924A3A9EAF951E8D220724F8F8F7F724F4E5C400807B108E9DFA542B110B21FF87318091F6295527E1D05C065318E335E864A6E680832A63E0C9C732941CA1084EAFD0A93DE0555D48364CE7C900E39E78CA24A1EF0A943A81091A20A153E7B90E0A92412332FC601CAEF9731E0BA29E5120A43CEEAE5DBDA747CAA6D726BC112CA4FA58AC21D014FDE174E724DF1BD5CED544E44375EA2BBD5525B9DB972E0DC030D1D626E7436E4895E64793997EF69A923D29E3BAAB20293477F8EC830E52A4D6020205509E547E4369D70E6FF02CBFBE87710039172DE540F15C4B9D6000EDD26510C895ADEC1B4A1F4287088DB96754DE14AD490CB4D1B09F5FED42137A8049D70A8B2A0E1064F4509FC0C0212AA20B8A54A4182411C0590F9C1D2A0633FFDADDC11530FCBC921D774F119C44C3D0D1CFCEA902BB680A01C29B478100CAB0F855492428796EB77BE00E9272CCE93E6C537BFA17336CB3CD6E1806B082798180EB9039EAD914F2CCE4BB357CF3FE689789544E15DC45BA2D9D4E33D4D66A0D098A87BDE8BD2C43754EBBB75BE6FAC821C6CBF5AC865DFB8227225F6AD8B5AFAB5AAE36D2A03F50D74985F7B5F3CDA14F5D54D9A67D9AB13C2F8D3EB6FBA1DDFEE422687B248C912AB58A464996D58048B3DF259A68C5547B9226DC32E4540366895C7A76D13060A4983C54813A8C4C0F9C1F2D86AE08A34DBC026E4896332CC585C000705E4DCCFEF2D432A7D1AD8D142DF04ED112425483403508E392F91E69850368331E1B398F2F58A1B623B5C06B46AD526E6CC05C49A05845A1F8FC376AF36311CB6C93F7DB79158F6A995F10843CE2D14A88F1C3D030BD57182E1ADB738C46451C9660269640F54ABD2EAAC6FA58E957CB66C99B89D08E5A481D330BA0BACA8ECC6AA15C56FC66173D55516B495B722BAB9CC0C24BB58DA4676704C15DDBAF371F3D6A76C91DC153D52FF9AC631F27AA3672A468897374CC377DEEE0D449863B8BEECE8232A6DAB9DF046406760CCEAC32F802B9648A5BBB409D5AC3F0C426B999DCB2B72ADDCAF91AE76B4CADC2B17EBEF66CD58AD63AF0BACF6E5159AA7E5324BC18CB7259635AE94D364C5C1388C781A8AF54CB21E25BF449938F9E8F648AD76A109D69AB0F1FAAEE1178B05AD3058C7473BA45B07BC28D3E70C7B37E496C15F25BC2E78F59DDB0CE0AABBFC3A443B15764D83F26EDCC428C7B647316EBA4D30636A8704D5D7D75662EA81DD4A65FB827BD1B4B6A8DE5C52ED5E51BE41EDFD826637BF9159BC9B2F7108BA67CE02CDB9DE522A08B362E8797FF02167686FBDE09A0A3605A9F2F6D4393D3E39355ED7BE9E972E57CA806FF1DCF5662F4E4C7B7663D7BC4793D56CA5C59C26FE134DBE0BE9E2FBE77838DA05709F1797AFE2B9E34542F37C6169BF5A1C86D5F9127160D6D4AF0B870175D48BD5CD8CD0158B81F36726724646BF3DE65247649CA093CEC831F96BCF343DACA57FDD3EBBAB1DD9FB0961EFA6FDF55BF4FF475B6E773C07B4DCF9A93D7082498411CEB35ACFC8E7EBC6576D51BDDEBF49BBBEB1A55E59075B35F5CFD390DBB731CCA6C6FF9A98CB92CD6A08FD2FA700BF9547D59A919846653A1B1A954B0CCABC0645034CB2F344B129F23A4E634323B327DE2F94A7B8E4128D0F46629CAA3855BA0B0A27BCF53CAFCB62DDFED9AB435BE7FE38BB24C8E73001D56468028CC5A794F1A0D2FBAA83B95740E87A2B4E6E1D4BA54FF0D9B242BA89C4964085FB2A9AB88730E60826C7C2A373D847B707099F6146FD6579A95E0DB239106DB7F72F189D25C80405462D8F3F31878370F1E13F8C6CB896DE1F0000, N'6.4.4')
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'202103140757533_dbchnage', N'Assessment.Web.Migrations.Configuration', 0x1F8B0800000000000400D559DB6EE336107D2FD07F10F4D416592B97976D60EF22EB2485D14D1C44C9B66F012D8D1DA214A5925460B7E897F5A19FD45FE8507791F23D972DFC62939CC3E1CC992167FCEFDFFFF43FCE23E63C819034E603F7A877E83AC08338A47C367053357DF7DEFDF8E1DB6FFA17613477BE94EB4EF43A94E472E03E2A959C7A9E0C1E2122B217D140C4329EAA5E10471E0963EFF8F0F047EFE8C803847011CB71FAB729573482EC07FE1CC63C8044A5845DC52130598CE38C9FA13AD7240299900006EE99942065045CF57E8149EF9C28E28378A20148D7396394A04A3EB0A9EB10CE6345142A7C7A2FC15722E6333FC101C2EE1609E0BA2961128A839CD6CB373DD3E1B13E93570B9650412A551C6D0978745218C933C57732B55B1911CD7881E6560B7DEACC9403F70E48E43AE646A74326F422CBCAB97C4F4B1D38EDB9838A15481EFD3970862953A98001875409C20E9C9B74C268F0332CEEE2DF800F78CA58533D5410E75A03387423E204845ADCC2B4A1F428741DAF2DEB99C295A821971F6DC4D5C9B1EB5CA31264C2A06241C30CBE8A05FC041C045110DE10A540A01347216476B034E8D84F7F2B7744EA6138B9CE15997F063E538F0317BFBACE259D43588E145ADC738AD187424AA4D0A1E5EA9DCF4106822639695E7CF36BF2446799C53A0C7005D10489E13AB7C0B235F291267968F6EAF9879C8897228E6E63D612CDA61EEE889881C2C3C4DDF37E9C8AC050ADEFD57C5F1B0539D86EB190CBBE7144E44AEC1A17B5F46B45C7DB4406EA1B6A37BFF6BE78B52912A8EB3467D9AB2784F1A77253BC29E18E46DB636C963EB7C90DFB268532E897258532696C92143076E38066CA5861912BD23ED8050F9D355AE53E6E9F099D8D39802618F5A8C4C0FDC1B2D872E02A07B6814DC823D74C18637E0E0C14386741FE0C19121990D0F616DA266C8F608E01A1039A30A4B0C4AC45B9B21312E5014D085BADB821B6C5DDAE55AB363167CE21D141CDD56A7FECB77BB58961B075F6E97B0D62D99750961628A6D04281FA06D13330571D17123E628B3B4916D9C0249046F641B522AD667D8B3A16F96CD992B89D08E5A481D33874175811D98D554B82DFF4C3FAA8AB4ED056DEF2E8FA303390EC60691FB223C754DEAD0B192FAF64CA8AC75B52F2F4AF4892E0DDD028818A11C7CFEB9FE13B7FFB7A20CA31BC4076940595B6D54E78C1931918B3FA2E0BE1920AA974D135213AEB0FC3C85A66737909D7CAFD1A74B5BD5572AF5CACBF9B31635582BD2EB0DA9697783C2D979D144C7F5B62591D4A18114B2EC661CCD288AFCE24AB51F2379189938F6E8ED47AFD37C15A13365EDF33EC626541CB0DD6F5D176E9C60E2FC2F439DDDE0DB9A1F39709AF725EFD84361DB8EC69BE0AD1A6C2B634289FBA4D8C726C7314E3E1DA0433A6B620A87E8DB688A907B60B95CD03EE45696DA57A7349B57B95F28DD4DE2FD2ECFA96979577F325AE83E679A2A1CEB9FE422A88B260E8F9BFB321A378DE7AC115E1740A52E5D5A67B7C7874DC3BFB032B52A365F6F5B4AF3C2943B6410FEBCDDA4854DB776D29BC43A9D5AC8FF91311C12311DF4564FEFD737483B601DCA58DF255F4305EC435CFE796762B623FACCEF6C29EACA95B06219A4EEDDF32C8FC61953323B4C27CE0FE99899C3AA35F1F72A903672CD03EA7CEA1F3D78E0CDDAFA67FDD42BBAB1ED9B987B073D5FEFA35FAFFA32EB74B9E3D6AEEFCDAC6B09AC4E8E19CD57A463E5F39BE6C8BAA1BFF26F5FADA9A7A691C6C54D53F4F456E3FC7904D8DFF2991CB92CE6A08FDAF2587A0C5A36ACD884FE392CE8646E51223655E8122986FC99950748A291DA7B1A291599FF80B61292EB9C0C387233E4E55922A5D064513D66AB7EBB058B57FD67668EBDC1F67EF03F91C474035A9BE32C6FC534A5958E97DD991B99740E8782B2E6DED4BA52FEFD9A242BA8EF9864085F9AA34710751C2104C8EB94F9E6017DDEE257C86190916E5AB7A39C87A47B4CDDE3FA7642630131418B53CFE440E87D1FCC37FEB3FAE3AAE1F0000, N'6.4.4')
GO
SET IDENTITY_INSERT [dbo].[TeamMembers] ON 
GO
INSERT [dbo].[TeamMembers] ([TeamMemberId], [Name], [Gender], [ContactNumber], [DOB], [TeamId]) VALUES (1, N'Alex', N'1', N'0779059394', CAST(N'1979-02-10T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[TeamMembers] ([TeamMemberId], [Name], [Gender], [ContactNumber], [DOB], [TeamId]) VALUES (2, N'Jhone', N'0', N'0779059394', CAST(N'1979-02-10T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[TeamMembers] ([TeamMemberId], [Name], [Gender], [ContactNumber], [DOB], [TeamId]) VALUES (15, N'Phlip', N'1', N'0779059394', CAST(N'1979-02-10T00:00:00.000' AS DateTime), 2)
GO
INSERT [dbo].[TeamMembers] ([TeamMemberId], [Name], [Gender], [ContactNumber], [DOB], [TeamId]) VALUES (16, N'Menjeop', N'0', N'0779059394', CAST(N'1979-02-10T00:00:00.000' AS DateTime), 2)
GO
INSERT [dbo].[TeamMembers] ([TeamMemberId], [Name], [Gender], [ContactNumber], [DOB], [TeamId]) VALUES (17, N'hornet', N'1', N'0779059394', CAST(N'1979-03-10T00:00:00.000' AS DateTime), 3)
GO
INSERT [dbo].[TeamMembers] ([TeamMemberId], [Name], [Gender], [ContactNumber], [DOB], [TeamId]) VALUES (18, N'Banusang', N'0', N'0779059394', CAST(N'1979-02-10T00:00:00.000' AS DateTime), 3)
GO
SET IDENTITY_INSERT [dbo].[TeamMembers] OFF
GO
SET IDENTITY_INSERT [dbo].[Teams] ON 
GO
INSERT [dbo].[Teams] ([TeamId], [TeamName], [Description]) VALUES (1, N'Team 1', N'Team description')
GO
INSERT [dbo].[Teams] ([TeamId], [TeamName], [Description]) VALUES (2, N'Team 2', N'Team description')
GO
INSERT [dbo].[Teams] ([TeamId], [TeamName], [Description]) VALUES (3, N'Team 2', N'Team description')
GO
SET IDENTITY_INSERT [dbo].[Teams] OFF
GO
/****** Object:  Index [IX_TeamId]    Script Date: 3/14/2021 2:00:40 PM ******/
CREATE NONCLUSTERED INDEX [IX_TeamId] ON [dbo].[TeamMembers]
(
	[TeamId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TeamMembers]  WITH CHECK ADD  CONSTRAINT [FK_dbo.TeamMembers_dbo.Teams_TeamId] FOREIGN KEY([TeamId])
REFERENCES [dbo].[Teams] ([TeamId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TeamMembers] CHECK CONSTRAINT [FK_dbo.TeamMembers_dbo.Teams_TeamId]
GO
ALTER DATABASE [AssessmentUNDP] SET  READ_WRITE 
GO
