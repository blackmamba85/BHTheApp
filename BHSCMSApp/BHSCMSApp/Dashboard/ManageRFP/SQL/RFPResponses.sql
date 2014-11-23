
Declare @id int={0}

Select
P.RFP_ID,
VP.VendorID,
U.UserID,
V.CompanyName,
U.PrimaryEmail,
V.PhoneNumber,
VP.SubmittedDate


from BHSCMS.dbo.RFPTable P inner join BHSCMS.dbo.VendorRFPTable VP on P.RFP_ID=VP.RFP_ID
inner join BHSCMS.dbo.VendorTable V on V.VendorID=VP.VendorID inner join BHSCMS.dbo.SysUserTable U
on U.UserID=V.UserID 

Where p.RFP_ID=@id and VP.IsCompleted=1