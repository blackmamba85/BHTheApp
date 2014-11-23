
Declare @id int={0}

Select
I.RFI_ID,
VI.VendorID,
U.UserID,
V.CompanyName,
U.PrimaryEmail,
V.PhoneNumber,
VI.Note,
VI.SubmittedDate


from BHSCMS.dbo.RFITable I inner join BHSCMS.dbo.VendorRFITable VI on I.RFI_ID=VI.RFI_ID
inner join BHSCMS.dbo.VendorTable V on V.VendorID=VI.VendorID inner join BHSCMS.dbo.SysUserTable U
on U.UserID=V.UserID 

Where I.RFI_ID=@id and VI.IsCompleted=1