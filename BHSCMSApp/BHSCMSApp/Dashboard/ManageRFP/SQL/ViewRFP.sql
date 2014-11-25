Select 
R.RFP_ID,
U.UserID,
MAX(E.FirstName + ' ' + E.LastName) As Name,
R.StartDate,
R.EndDate,
I.ProductDescription,
I.CurrentPrice,
R.CreatedDate,
Count(case when IsCompleted=1 then 0 end) as Responses
from BHSCMS.dbo.RFPTable R inner join BHSCMS.dbo.RFITable I on r.RFI_ID=i.RFI_ID inner join BHSCMS.dbo.VendorRFPTable
VP on R.RFP_ID=VP.RFP_ID inner join BHSCMS.dbo.SysUserTable U on R.UserID=U.UserID inner join BHSCMS.dbo.EmployeeTable 
E on E.UserID=R.UserID 
Group by R.RFP_ID, U.UserID, R.StartDate, R.EndDate, I.ProductDescription, I.CurrentPrice, R.CreatedDate