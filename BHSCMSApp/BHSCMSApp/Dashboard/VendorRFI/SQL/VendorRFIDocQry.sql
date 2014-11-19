Declare @rfiid int={0}

Select
 R.StartDate, 
 R.EndDate, 
 C.Category,
 R.ProductDescription

  
 from BHSCMS.dbo.RFITable R join BHSCMS.dbo.CategoryTable C on R.CategoryID=C.CategoryID
 inner join BHSCMS.dbo.DocumentTable D on R.RFI_ID=D.ReferenceID
 Where R.RFI_ID=@rfiid