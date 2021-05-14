package it.unisa.model;

import java.util.ArrayList;
import java.util.List;

public class ListaOrdiniBean {
	private List<OrdineBean> ordini;
	
	public ListaOrdiniBean() {
		ordini=new ArrayList<OrdineBean>();
	}
	 public synchronized void addOrdine(OrdineBean ordine) {
		 getOrdini().add(ordine);
	 }
	 public List<OrdineBean> getOrdini() {
		return ordini;
	}
	 @Override
	public String toString() {
		// TODO Auto-generated method stub
		return super.toString();
	}
}
