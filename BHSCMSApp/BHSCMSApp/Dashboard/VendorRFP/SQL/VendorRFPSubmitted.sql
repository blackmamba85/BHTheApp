Declare @rfpid int={0}

Select

 C.Category,
 I.ProductDescription,
 VR.ProposedPrice,
 P.StartDate,
 P.EndDate
  
 from BHSCMS.dbo.RFPTable P join BHSCMS.dbo.VendorRFPTable VR on P.RFP_ID=VR.RFP_ID
 inner join BHSCMS.dbo.RFITable I on P.RFI_ID=I.RFI_ID
 inner join BHSCMS.dbo.CategoryTable C on I.CategoryID=C.CategoryID
 Where P.RFP_ID=@rfpid