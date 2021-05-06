package it.unisa.model;

import java.io.Serializable;

public class ProductBean implements Serializable {

	private static final long serialVersionUID = 1L;
	
	int code;
	String name;
	String description;
	int price;
	int quantity;
	int iva;
	String ricondizionato;
	int sconto;
	

	public ProductBean() {
		code = -1;
		name = "";
		description = "";
		quantity = 0;
		
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	@Override
	public String toString() {
		return name + " (" + code + "), " + price + " " + quantity + ". " + description;
	}
	public int getIva() {
		return iva;
	}public String getRicondizionato() {
		return ricondizionato;
	}public int getSconto() {
		return sconto;
	}public void setIva(int iva) {
		this.iva = iva;
	}public void setRicondizionato(String ricondizionato) {
		this.ricondizionato = ricondizionato;
	}public void setSconto(int sconto) {
		this.sconto = sconto;
	}public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
