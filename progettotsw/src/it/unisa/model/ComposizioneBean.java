package it.unisa.model;

import java.io.Serializable;

public class ComposizioneBean implements Serializable {
	private static final long serialVersionUID = 1L; 
	private int codice;
	private int numeroordine;
	private int quantit�;
	private int iva;
	private double prezzototale;
	private int prezzosingolopezzo;
	
	public ComposizioneBean() {
		
	}
	public int getCodice() {
		return codice;
	}public int getIva() {
		return iva;
	}public int getNumeroordine() {
		return numeroordine;
	}public int getPrezzosingolopezzo() {
		return prezzosingolopezzo;
	}public double getPrezzototale() {
		return prezzototale;
	}public void setCodice(int codice) {
		this.codice = codice;
	}public int getQuantit�() {
		return quantit�;
	}public void setIva(int iva) {
		this.iva = iva;
	}public void setNumeroordine(int numeroordine) {
		this.numeroordine = numeroordine;
	}public void setPrezzosingolopezzo(int prezzosingolopezzo) {
		this.prezzosingolopezzo = prezzosingolopezzo;
	}public void setPrezzototale(double prezzototale) {
		this.prezzototale = prezzototale;
	}public void setQuantit�(int quantit�) {
		this.quantit� = quantit�;
	}public static long getSerialversionuid() {
		return serialVersionUID;
	}
}
