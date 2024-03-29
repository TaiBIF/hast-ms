USE [HASTDB]
GO
/****** Object:  StoredProcedure [dbo].[prOrders]    Script Date: 03/12/2018 15:40:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[prOrders]	
	
	@trachID INT = NULL
AS
	
SELECT 
	
	orderID
	, orderE
	, orderC
	, orderE + 
		CASE 
			WHEN orderC IS NULL THEN '' 
			ELSE ' ' + orders.orderC 
		END AS orderExpr
	--, informal
	, orders.trachID
	, tracheophyte
	, tracheophyteC

						
FROM            
	orders
	INNER JOIN tracheophyte on orders.trachID = tracheophyte.trachID
WHERE
	--classID = @classID
	(COALESCE(orders.trachID, ISNULL(orders.trachID,1)) = COALESCE(NULLIF(@trachID,0), ISNULL(orders.trachID,1)))
GO
