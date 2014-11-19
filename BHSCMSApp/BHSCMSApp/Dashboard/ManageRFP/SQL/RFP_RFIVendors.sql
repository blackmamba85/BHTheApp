Declare @rfi int={0}

Select V.VendorID,
       V.CompanyName,
	   V.PhoneNumber, 
       V.State,	   	   
	   U.PrimaryEmail,
	   U.SecondaryEmail
	   
from BHSCMS.dbo.VendorTable V inner join BHSCMS.dbo.SysUserTable U on V.UserID=U.UserID 
    inner join BHSCMS.dbo.StatusTable S on S.StatusID=V.StatusID inner join BHSCMS.dbo.VendorRFITable R
	on R.VendorID=V.VendorID
where R.RFI_ID=@rfi

