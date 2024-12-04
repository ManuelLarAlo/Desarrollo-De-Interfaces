CREATE PROCEDURE sp_Pedidos#
@identificador CHAR(10),@abonados BIT,@cantidad SMALLINT OUTPUT
AS
	SELECT @cantidad=(SELECT COUNT(*) 
	                  FROM   Pedidos 
	                  WHERE  idCliente=@identificador
 	    	                 AND abonado=@abonados)
	IF @@ERROR !=0
	 RETURN -1

