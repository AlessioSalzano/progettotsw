package it.unisa.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class OrdiniDAO {

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
	public static synchronized ListaOrdiniBean doRetrieveByKey(String username) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		ListaOrdiniBean lista=new ListaOrdiniBean();
		

		String selectSQL = "SELECT * FROM " + "ordine" + " WHERE username = ?";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setString(1, username);

			ResultSet rs = preparedStatement.executeQuery();
			
			while (rs.next()) {
				OrdineBean ordine= new OrdineBean();
				ordine.setId(rs.getInt("numordine"));
				ordine.setPrezzo(rs.getDouble("prezzo"));
				ordine.setStato(rs.getString("stato"));
				ordine.setUsername(rs.getString("username"));
				lista.addOrdine(ordine);
		}} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}
		return lista;
	}
}
