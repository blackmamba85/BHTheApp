Declare @startdate datetime = '{0}'
Declare @enddate datetime= '{1}'

Select P.RFP_ID,
	   I.ProductDescription	

from BHSCMS.dbo.RFPTable P inner join BHSCMS.dbo.RFITable I 
on P.RFI_ID=I.RFI_ID
Where (P.CreatedDate>=@startdate and P.CreatedDate<=@enddate)