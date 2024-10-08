USE [SchoolManagement]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 9/17/2024 7:29:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Age] [int] NOT NULL,
	[Image] [nvarchar](max) NULL,
	[Standard] [int] NULL,
	[RoolNo] [int] NOT NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subject]    Script Date: 9/17/2024 7:29:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subject](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Standard] [int] NOT NULL,
	[Language] [nvarchar](50) NULL,
 CONSTRAINT [PK_Subject] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subject_Student_Teacher]    Script Date: 9/17/2024 7:29:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subject_Student_Teacher](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [int] NULL,
	[TeacherId] [int] NULL,
	[SubjectId] [int] NULL,
 CONSTRAINT [PK_Subject_Student_Teacher] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teacher]    Script Date: 9/17/2024 7:29:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teacher](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Image] [nvarchar](max) NULL,
	[Age] [int] NOT NULL,
	[Sex] [nvarchar](50) NOT NULL,
	[StudentId] [int] NULL,
 CONSTRAINT [PK_Teacher] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Student] ON 

INSERT [dbo].[Student] ([Id], [Name], [Age], [Image], [Standard], [RoolNo]) VALUES (1, N'Raja', 20, N'Nagpur', 12, 123)
INSERT [dbo].[Student] ([Id], [Name], [Age], [Image], [Standard], [RoolNo]) VALUES (2, N'Tipu', 17, N'Pune', 11, 124)
INSERT [dbo].[Student] ([Id], [Name], [Age], [Image], [Standard], [RoolNo]) VALUES (3, N'raheem', 16, N'Mumbai', 10, 111)
INSERT [dbo].[Student] ([Id], [Name], [Age], [Image], [Standard], [RoolNo]) VALUES (4, N'Sameer', 19, N'~/image/studentt.jpg', 11, 121)
INSERT [dbo].[Student] ([Id], [Name], [Age], [Image], [Standard], [RoolNo]) VALUES (5, N'tipu', 16, N'~/image/std.jpg', 10, 222)
SET IDENTITY_INSERT [dbo].[Student] OFF
GO
SET IDENTITY_INSERT [dbo].[Subject] ON 

INSERT [dbo].[Subject] ([Id], [Name], [Standard], [Language]) VALUES (1, N'Commerce', 11, N'Urdu,Arabi')
INSERT [dbo].[Subject] ([Id], [Name], [Standard], [Language]) VALUES (2, N'Finance', 11, N'Punjabi,Urdu')
SET IDENTITY_INSERT [dbo].[Subject] OFF
GO
SET IDENTITY_INSERT [dbo].[Subject_Student_Teacher] ON 

INSERT [dbo].[Subject_Student_Teacher] ([Id], [StudentId], [TeacherId], [SubjectId]) VALUES (1, 2, 1, 1)
SET IDENTITY_INSERT [dbo].[Subject_Student_Teacher] OFF
GO
SET IDENTITY_INSERT [dbo].[Teacher] ON 

INSERT [dbo].[Teacher] ([Id], [Name], [Image], [Age], [Sex], [StudentId]) VALUES (1, N'Kaleem', N'~/image/teacherr.jpg', 34, N'Male', 1)
SET IDENTITY_INSERT [dbo].[Teacher] OFF
GO
ALTER TABLE [dbo].[Subject_Student_Teacher]  WITH CHECK ADD  CONSTRAINT [FK_Subject_Student_Teacher_Student] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Student] ([Id])
GO
ALTER TABLE [dbo].[Subject_Student_Teacher] CHECK CONSTRAINT [FK_Subject_Student_Teacher_Student]
GO
ALTER TABLE [dbo].[Subject_Student_Teacher]  WITH CHECK ADD  CONSTRAINT [FK_Subject_Student_Teacher_Subject] FOREIGN KEY([SubjectId])
REFERENCES [dbo].[Subject] ([Id])
GO
ALTER TABLE [dbo].[Subject_Student_Teacher] CHECK CONSTRAINT [FK_Subject_Student_Teacher_Subject]
GO
ALTER TABLE [dbo].[Subject_Student_Teacher]  WITH CHECK ADD  CONSTRAINT [FK_Subject_Student_Teacher_Teacher] FOREIGN KEY([TeacherId])
REFERENCES [dbo].[Teacher] ([Id])
GO
ALTER TABLE [dbo].[Subject_Student_Teacher] CHECK CONSTRAINT [FK_Subject_Student_Teacher_Teacher]
GO
ALTER TABLE [dbo].[Teacher]  WITH CHECK ADD  CONSTRAINT [FK_Teacher_Student] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Student] ([Id])
GO
ALTER TABLE [dbo].[Teacher] CHECK CONSTRAINT [FK_Teacher_Student]
GO
