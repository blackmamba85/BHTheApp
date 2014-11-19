Declare @userid int={0}

Select 
R.RFP_ID,
VR.IsCompleted,
V.VendorID,
VR.PermissionID,
R.StartDate,
R.EndDate,
C.Category,
I.ProductDescription,
R.GatewayPrice


from BHSCMS.dbo.RFPTable R inner join BHSCMS.dbo.VendorRFPTable VR on R.RFP_ID=VR.RFP_ID inner join BHSCMS.dbo.RFITable I
on R.RFI_ID=I.RFI_ID inner join BHSCMS.dbo.CategoryTable C on I.CategoryID=C.CategoryID inner join BHSCMS.dbo.VendorTable V on V.VendorID=VR.VendorID
inner join BHSCMS.dbo.SysUserTable U on V.UserID=U.UserID 
where U.UserID=@userid and VR.PermissionID=1
