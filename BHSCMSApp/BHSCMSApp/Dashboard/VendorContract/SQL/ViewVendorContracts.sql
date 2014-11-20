Declare @userid int={0}

Select 
T.IsCompleted,
T.ContractID,
T.VendorID,
V.CompanyName,
T.Title,
T.StartDate,
T.EndDate,
T.CreatedDate

from BHSCMS.dbo.ContractTable T inner join BHSCMS.dbo.VendorTable V
on T.VendorID=V.VendorID inner join BHSCMS.dbo.SysUserTable u on
U.UserID=V.UserID
where U.UserID= @userid
