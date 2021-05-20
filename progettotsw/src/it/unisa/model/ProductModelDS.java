package it.unisa.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class ProductModelDS implements ProductModel {

	private static DataSource ds;

	static {
		try {
			Context initCtx = new InitialContext();
			Context envCtx = (Context) initCtx.lookup("java:comp/env");

			ds = (DataSource) envCtx.lookup("jdbc/mydb");

		} catch (NamingException e) {
			System.out.println("Error:" + e.getMessage());
		}
	}

	private static final String TABLE_NAME = "product";

	@Override
	public synchronized void doSave(ProductBean product) throws SQLException {

		Connection connection = null;
		PreparedStatement preparedStatement = null;

		String insertSQL = "INSERT INTO " + ProductModelDS.TABLE_NAME
				+ " (NAME, DESCRIPTION, PRICE, QUANTITY, IVA, RICONDIZIONATO, SCONTO) VALUES (?, ?, ?, ?, ?, ?, ?)";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setString(1, product.getName());
			preparedStatement.setString(2, product.getDescription());
			preparedStatement.setInt(3, product.getPrice());
			preparedStatement.setInt(4, product.getQuantity());
			preparedStatement.setInt(5, product.getIva());
			preparedStatement.setString(6, product.getRicondizionato());
			preparedStatement.setInt(7, product.getSconto());

			preparedStatement.executeUpdate();

			connection.commit();
		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}
	}

	@Override
	public synchronized ProductBean doRetrieveByKey(int code) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		ProductBean bean = new ProductBean();

		String selectSQL = "SELECT * FROM " + ProductModelDS.TABLE_NAME + " WHERE CODE = ?";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setInt(1, code);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				bean.setCode(rs.getInt("CODE"));
				bean.setName(rs.getString("NAME"));
				bean.setDescription(rs.getString("DESCRIPTION"));
				bean.setPrice(rs.getInt("PRICE"));
				bean.setQuantity(rs.getInt("QUANTITY"));
				bean.setSconto(rs.getInt("SCONTO"));
				bean.setRicondizionato(rs.getString("RICONDIZIONATO"));
				bean.setIva(rs.getInt("IVA"));
			}

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}
		return bean;
	}

	@Override
	public synchronized boolean doDelete(int code) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		int result = 0;

		String deleteSQL = "DELETE FROM " + ProductModelDS.TABLE_NAME + " WHERE CODE = ?";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(deleteSQL);
			preparedStatement.setInt(1, code);

			result = preparedStatement.executeUpdate();

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}
		return (result != 0);
	}

	@Override
	public synchronized Collection<ProductBean> doRetrieveAll(String order) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		Collection<ProductBean> products = new LinkedList<ProductBean>();

		String selectSQL = "SELECT * FROM " + ProductModelDS.TABLE_NAME;

		if (order != null && !order.equals("")) {
			selectSQL += " ORDER BY " + order;
		}

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				ProductBean bean = new ProductBean();

				bean.setCode(rs.getInt("CODE"));
				bean.setName(rs.getString("NAME"));
				bean.setDescription(rs.getString("DESCRIPTION"));
				bean.setPrice(rs.getInt("PRICE"));
				bean.setQuantity(rs.getInt("QUANTITY"));
				bean.setSconto(rs.getInt("SCONTO"));
				bean.setRicondizionato(rs.getString("RICONDIZIONATO"));
				bean.setIva(rs.getInt("IVA"));
				products.add(bean);
			}

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}
		return products;
	}
	
	public synchronized void doUpdate(ProductCart prod)throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		String sql= "UPDATE " + ProductModelDS.TABLE_NAME + " SET quantity = quantity - ? WHERE CODE=?";
		
			try {
				
				connection = ds.getConnection();
				preparedStatement = connection.prepareStatement(sql);
				preparedStatement.setInt(1, prod.getNumProduct());
				preparedStatement.setInt(2, prod.getProductID());
				preparedStatement.executeUpdate();
		}
		
			finally {
				try {
					if (preparedStatement != null)
						preparedStatement.close();
				} finally {
					if (connection != null)
						connection.close();
				}
			}
			
		}
	public synchronized void doSave(UserBean user, Cart cart)throws SQLException {
		double totale=0;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		String sql=  "INSERT INTO " + "ordine"
				+ " (numordine, USERNAME, PREZZO) VALUES (?, ?, ?)";
		String sss= "SELECT MAX(numordine) FROM ordine";
		
		String aaa=  "INSERT INTO " + "composizione"
				+ " (codice, numordine, quantita, iva, prezzototale, prezzosingolopezzo) VALUES (?, ?, ?, ?, ?, ?)";
		for(int i=0;i<cart.size();i++) {
			totale=totale+cart.getindex(i).getTotalCost();
			
		}
		ProductCart prod=new ProductCart();
		int i=0;
			try { 
				connection = ds.getConnection();
				preparedStatement = connection.prepareStatement(sss);
				ResultSet rs = preparedStatement.executeQuery();
				while (rs.next()) {
				i=rs.getInt(1)+1;}
				preparedStatement.close();
				preparedStatement = connection.prepareStatement(sql);
				preparedStatement.setInt(1,i);
				preparedStatement.setString(2, user.getUsername());
				preparedStatement.setDouble(3,totale);
				preparedStatement.executeUpdate();
				preparedStatement.close();
				
				for(int x=0; x<cart.size();x++) {
					preparedStatement = connection.prepareStatement(aaa);
					prod=cart.getindex(x);
					preparedStatement.setInt(1,prod.getProductID());
					preparedStatement.setInt(2, i);
					preparedStatement.setInt(3,prod.getNumProduct());
					preparedStatement.setInt(4,prod.getIva());
					preparedStatement.setDouble(5, totale);
					preparedStatement.setInt(6,prod.getPrice());
					preparedStatement.executeUpdate();
					preparedStatement.close();
				}
		}
		
			finally {
				try {
					if (preparedStatement != null)
						preparedStatement.close();
				} finally {
					if (connection != null)
						connection.close();
				}
			}
		
			
		}
		
	public synchronized void doSave(ProductCart productcart, int codice)throws SQLException {
		
	}
	
	}


