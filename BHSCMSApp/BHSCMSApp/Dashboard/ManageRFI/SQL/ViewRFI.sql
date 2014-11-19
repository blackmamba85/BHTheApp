Select 
RFI_ID,
U.UserID,
(E.FirstName + ' ' + E.LastName) As Name,
StartDate,
EndDate,
C.Category,
R.ProductDescription,
CreatedDate,
ModifiedDate
from BHSCMS.dbo.RFITable R inner join BHSCMS.dbo.CategoryTable C on R.CategoryID=C.CategoryID 
inner join BHSCMS.dbo.SysUserTable U on R.UserID=U.UserID inner join BHSCMS.dbo.EmployeeTable 
E on E.UserID=R.UserID 