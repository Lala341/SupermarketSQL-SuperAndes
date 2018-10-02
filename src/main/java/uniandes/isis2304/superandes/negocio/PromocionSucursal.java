package uniandes.isis2304.superandes.negocio;

import java.util.ArrayList;
import java.util.Date;

/**
 * @version 1.0
 * @created 30-sep-2018 10:00:43
 */
public class PromocionSucursal implements VOPromocionSucursal{

	private long promocion;
	private long sucursal;
	
	public PromocionSucursal(){

	}
	public PromocionSucursal(long promocion,long sucursal){
		this.promocion=promocion;
		this.sucursal=sucursal;
	}

	/**
	 * @return the promocion
	 */
	public long getPromocion() {
		return promocion;
	}

	/**
	 * @param promocion the promocion to set
	 */
	public void setPromocion(long promocion) {
		this.promocion = promocion;
	}

	/**
	 * @return the sucursal
	 */
	public long getSucursal() {
		return sucursal;
	}

	/**
	 * @param sucursal the sucursal to set
	 */
	public void setSucursal(long sucursal) {
		this.sucursal = sucursal;
	}

	

	@Override
	/**
	 * @return Una cadena de caracteres con todos los atributos de Consumidor
	 */
	public String toString() 
	{
		return "PromocionSucursal [promocion=" + promocion + ", sucursal=" + sucursal +  "]";
	}

}