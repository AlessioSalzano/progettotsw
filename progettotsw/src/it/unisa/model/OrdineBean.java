package it.unisa.model;

import java.io.Serializable;

public class OrdineBean implements Serializable {
	private static final long serialVersionUID = 1L;
	private int id;
	private String username;
	private double prezzo;
	private String stato;
	
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
}
