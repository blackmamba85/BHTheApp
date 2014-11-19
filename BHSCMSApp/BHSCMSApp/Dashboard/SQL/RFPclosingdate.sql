declare @thismonth int = {0}
declare @nextmonth int = {1}
declare @year int = {2}

Select P.RFP_ID,
		R.EndDate,
		I.ProductDescription

from BHSCMS.dbo.RFPTable P inner join BHSCMS.dbo.RFITable I on P.RFI_ID=I.RFI_ID
where (DATEPART(mm, P.EndDate)=@thismonth and DATEPART(yy, P.EndDate)=@year)
       or (DATEPART(mm, P.EndDate)=@nextmonth and DATEPART(yy, P.EndDate)=@year)
