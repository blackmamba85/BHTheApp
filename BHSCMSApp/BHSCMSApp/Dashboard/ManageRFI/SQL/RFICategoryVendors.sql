Declare @categoryid int={0}

Select L.VendorID,
       V.CompanyName,
	   V.PhoneNumber, 
       V.State,	   
	   S.Status,
	   U.PrimaryEmail,
	   U.SecondaryEmail
	   
from BHSCMS.dbo.VendorTable V inner join BHSCMS.dbo.SysUserTable U on V.UserID=U.UserID 
    inner join BHSCMS.dbo.StatusTable S on S.StatusID=V.StatusID inner join BHSCMS.dbo.SellTable L
	on L.VendorID=V.VendorID
where L.ID=@categoryid and S.StatusID=1


