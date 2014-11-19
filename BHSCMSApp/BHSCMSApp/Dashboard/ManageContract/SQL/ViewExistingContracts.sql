Declare @todayDate Datetime={0}

Select
ContractID,
Title,
(E.FirstName + ' ' + E.LastName) As Name,
C.StartDate,
C.EndDate,
C.VendorID,
V.CompanyName,
C.ContractPrice,
C.CreatedDate
from BHSCMS.dbo.ContractTable C inner join BHSCMS.dbo.VendorTable V on C.VendorID=V.VendorID
inner join BHSCMS.dbo.SysUserTable U on U.UserID=C.UserID inner join BHSCMS.dbo.EmployeeTable E
on E.UserID=U.UserID
Where C.EndDate>@todayDate