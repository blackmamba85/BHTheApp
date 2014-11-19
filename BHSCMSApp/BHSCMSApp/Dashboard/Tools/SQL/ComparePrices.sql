Declare @rfpid int = {0}

Select P.RFP_ID,
	   I.ProductDescription,
	   p.GatewayPrice,
	   VendorRFPTable.ProposedPrice,
	   V.CompanyName,
	   V.VendorID

	   

from BHSCMS.dbo.RFPTable P inner join BHSCMS.dbo.VendorRFPTable on P.RFP_ID=VendorRFPTable.RFP_ID inner join BHSCMS.dbo.RFITable I on P.RFI_ID=I.RFI_ID
inner join BHSCMS.dbo.VendorRFITable on P.RFI_ID=VendorRFITable.RFI_ID inner join
BHSCMS.dbo.VendorTable V on VendorRFITable.VendorID=V.VendorID 
where P.RFP_ID=@rfpid