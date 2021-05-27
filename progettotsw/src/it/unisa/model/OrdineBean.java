package it.unisa.model;

import java.io.Serializable;
import java.util.Date;
public class OrdineBean implements Serializable {
	private static final long serialVersionUID = 1L;
	private int id;
	private String username;
	private double prezzo;
	private String stato;
	private Date data;
	public OrdineBean() {
		
	}
	public int getId() {
		return id;
	}
	public double getPrezzo() {
		return prezzo;
	}
	public String getStato() {
		return stato;
	}public String getUsername() {
		return username;
	}public void setId(int id) {
		this.id = id;
	}public void setPrezzo(double prezzo) {
		this.prezzo = prezzo;
	}public void setStato(String stato) {
		this.stato = stato;
	}public void setUsername(String username) {
		this.username = username;
	}
	public Date getData() {
		return data;
	}public void setData(Date data) {
		this.data = data;
	}
}
