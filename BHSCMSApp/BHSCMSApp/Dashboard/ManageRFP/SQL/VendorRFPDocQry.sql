Declare @rfpid int={0}

Select
 P.StartDate, 
 P.EndDate, 
 C.Category,
 I.ProductDescription,
 I.CurrentPrice,
 P.GatewayPrice
  
 from BHSCMS.dbo.RFPTable P join BHSCMS.dbo.RFITable I on P.RFI_ID=I.RFI_ID
 inner join BHSCMS.dbo.CategoryTable C on I.CategoryID=C.CategoryID
 Where P.RFP_ID=@rfpid