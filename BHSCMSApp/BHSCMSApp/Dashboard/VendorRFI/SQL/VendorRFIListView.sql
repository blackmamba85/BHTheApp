Declare @userid int={0}


Select 
R.RFI_ID,
V.VendorID,
PermissionID,
R.StartDate,
R.EndDate,
C.Category,
R.ProductDescription,
VR.IsCompleted


from BHSCMS.dbo.RFITable R inner join BHSCMS.dbo.VendorRFITable VR on R.RFI_ID=VR.RFI_ID inner join
BHSCMS.dbo.CategoryTable C on R.CategoryID=C.CategoryID inner join BHSCMS.dbo.VendorTable V on V.VendorID=VR.VendorID
inner join BHSCMS.dbo.SysUserTable U on V.UserID=U.UserID 
where U.UserID=@userid and VR.PermissionID=2


