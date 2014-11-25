Select 
R.RFI_ID,
U.UserID,
Max(E.FirstName + ' ' + E.LastName) As Name,
StartDate,
EndDate,
C.Category,
R.ProductDescription,
CreatedDate,
ModifiedDate,
Count(case when IsCompleted=1 then 0 end) as Responses
from BHSCMS.dbo.RFITable R inner join BHSCMS.dbo.VendorRFITable VI on R.RFI_ID=VI.RFI_ID inner join
BHSCMS.dbo.CategoryTable C on R.CategoryID=C.CategoryID inner join BHSCMS.dbo.SysUserTable U on R.UserID=U.UserID inner join BHSCMS.dbo.EmployeeTable 
E on E.UserID=R.UserID 
Group by R.RFI_ID, U.UserID, StartDate, EndDate, C.Category, R.ProductDescription, CreatedDate, ModifiedDate 