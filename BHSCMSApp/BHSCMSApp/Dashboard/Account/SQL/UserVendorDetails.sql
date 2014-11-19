Declare @userId int={0}

Select V.VendorID, V.CompanyName, V.PhoneNumber, V.FaxNumber, V.AddressLine1, V.AddressLine2, V.City,
V.State, V.ZipCode, S.StatusID, V.TaxID, V.RegistrationDate, U.UserName, U.Password, U.PrimaryEmail, U.SecondaryEmail
from BHSCMS.dbo.VendorTable V inner join BHSCMS.dbo.SysUserTable U on V.UserID=U.UserID inner join BHSCMS.dbo.StatusTable S 
on S.StatusID=V.StatusID
Where U.UserID=@userId