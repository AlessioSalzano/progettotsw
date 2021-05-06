package it.unisa.model;

public class ProductCart {
private ProductBean product;
private int numProduct;

public ProductCart() {
	
}
public ProductCart(ProductBean product) {
	setProduct(product);
	setNumProduct(1);
}
public ProductBean getProduct() {
	return product;
}
public void setProduct(ProductBean product) {
	this.product = product;
}
public int getProductID() {
	return(getProduct().getCode());
}
public String getDescription() {
	return(getProduct().getDescription());
}
public int getNumProduct() {
	return numProduct;
}
public int getPrice() {
	return(getProduct().getPrice());
}
public int getQuantity() {
	return(getProduct().getQuantity());
}
public void setNumProduct(int n) {
	this.numProduct=n;
}
public void incrementNumProduct() {
	setNumProduct(getNumProduct()+1);
}
public void cancelOrder() {
	setNumProduct(0);
}
public double getTotalCost() {
	return(getNumProduct()*getPrice());
}
public void decrementNumProduct() {
	setNumProduct(getNumProduct()-1);
}
public String getName() {
	return(getProduct().getName());
}
}
