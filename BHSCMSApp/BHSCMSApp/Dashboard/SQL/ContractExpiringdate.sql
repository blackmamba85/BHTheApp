declare @thismonth int = {0}
declare @nextmonth int = {1}
declare @year int = {2}

Select ContractID,
		C.EndDate,
		I.ProductDescription

from BHSCMS.dbo.ContractTable C inner join BHSCMS.dbo.RFPTable P on P.RFP_ID=C.RFP_ID
inner join BHSCMS.dbo.RFITable I on I.RFI_ID=P.RFI_ID 
where (DATEPART(mm, C.EndDate)=@thismonth and DATEPART(yy, C.EndDate)=@year)
       or (DATEPART(mm, C.EndDate)=@nextmonth and DATEPART(yy, C.EndDate)=@year)
