package it.unisa.model;

import java.util.ArrayList;
import java.util.List;



public class Cart {

	private List<ProductCart> products;
	
	public Cart() {
		products = new ArrayList<ProductCart>();
	}
	
	  public synchronized void addProduct(ProductCart cart) {
		    ProductCart order;
		    for(int i=0; i<products.size(); i++) {
		      order = products.get(i);
		      if (order.getProductID()==cart.getProductID()) {
		    	  if(order.getNumProduct()<cart.getQuantity())
		        order.incrementNumProduct();
		        return;
		      }

	  }
		    products.add(cart);
	  }
	
	public void deleteProduct(ProductCart cart) {
		 ProductCart order;
		    for(int i=0; i<products.size(); i++) {
		      order = products.get(i);
		      if (order.getProductID()==cart.getProductID()) {
		    	  if(order.getNumProduct()>0)
		        order.decrementNumProduct();
		    	  else
		    		  order.cancelOrder();
		        return;
		      }
		
	}
	}
	public List<ProductCart> getProducts() {
		return  products;
	}
	public ProductCart getindex(int i) {
		return products.get(i);
	}
	public int size() {
		return products.size();
	}
	
}
