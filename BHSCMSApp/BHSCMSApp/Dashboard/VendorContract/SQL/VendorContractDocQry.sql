Declare @contractid int={0}

Select
T.Title,
T.Description,
C.Category,
I.ProductDescription,
T.ContractPrice,
 T.StartDate, 
 T.EndDate
 
 from BHSCMS.dbo.ContractTable T inner join BHSCMs.dbo.RFPTable P on T.RFP_ID=P.RFP_ID
 inner join BHSCMS.dbo.RFITable I on I.RFI_ID=P.RFI_ID inner join BHSCMS.dbo.CategoryTable
 C on C.CategoryID=I.CategoryID
 where T.ContractID=@contractid 