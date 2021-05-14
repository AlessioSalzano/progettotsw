package it.unisa.model;

import java.util.ArrayList;
import java.util.List;

public class ListaComposizione {
	private List<ComposizioneBean> composizioni;
	
	public ListaComposizione() {
		composizioni=new ArrayList<ComposizioneBean>();
	}
	 public synchronized void addOrdine(ComposizioneBean composizione) {
		 getOrdini().add(composizione);
	 }
	 public List<ComposizioneBean> getOrdini() {
		return composizioni;
	}
	 @Override
	public String toString() {
		// TODO Auto-generated method stub
		return super.toString();
	}
}