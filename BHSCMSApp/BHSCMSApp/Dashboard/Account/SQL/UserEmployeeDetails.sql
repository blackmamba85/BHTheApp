Declare @userId int

Select E.EmpID, E.LastName, E.FirstName, R.Name, U.UserID,
U.UserName, U.Password, U.PrimaryEmail, U.SecondaryEmail	

from BHSCMS.dbo.EmployeeTable E join BHSCMS.dbo.SysUserTable U on
	e.UserID=u.UserID join BHSCMS.dbo.RoleTable R on E.RoleID=R.RoleID

Where u.UserID={0}

