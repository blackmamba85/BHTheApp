Declare @todayDate Datetime={0}

Select 
RFI_ID,
U.UserID,
(E.FirstName + ' ' + E.LastName) As Name,
StartDate,
EndDate,
C.Category,
CreatedDate,
ModifiedDate
from BHSCMS.dbo.RFITable R inner join BHSCMS.dbo.CategoryTable C on R.CategoryID=C.ID 
inner join BHSCMS.dbo.SysUserTable U on R.UserID=U.UserID inner join BHSCMS.dbo.EmployeeTable 
E on E.UserID=R.UserID 
Where EndDate < @todayDate