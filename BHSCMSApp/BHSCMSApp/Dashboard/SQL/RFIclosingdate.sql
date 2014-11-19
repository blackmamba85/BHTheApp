declare @thismonth int = {0}
declare @nextmonth int = {1}
declare @year int = {2}

Select RFI_ID,
		EndDate,
		ProductDescription

from BHSCMS.dbo.RFITable
where (DATEPART(mm, EndDate)=@thismonth and DATEPART(yy, EndDate)=@year)
       or (DATEPART(mm, EndDate)=@nextmonth and DATEPART(yy, EndDate)=@year)
