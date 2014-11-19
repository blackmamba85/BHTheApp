Select 
RFP_ID,
U.UserID,
(E.FirstName + ' ' + E.LastName) As Name,
R.StartDate,
R.EndDate,
I.ProductDescription,
I.CurrentPrice,
R.CreatedDate
from BHSCMS.dbo.RFPTable R inner join BHSCMS.dbo.RFITable I on r.RFI_ID=i.RFI_ID
inner join BHSCMS.dbo.SysUserTable U on R.UserID=U.UserID inner join BHSCMS.dbo.EmployeeTable 
E on E.UserID=R.UserID 