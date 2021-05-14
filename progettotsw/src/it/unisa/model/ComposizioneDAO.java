package it.unisa.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class ComposizioneDAO {
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
	public static synchronized ListaComposizione doRetrieveByKey(int codice) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		ListaComposizione lista=new ListaComposizione();
		

		String selectSQL = "SELECT * FROM " + "composizione" + " WHERE numordine = ?";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setInt(1, codice);

			ResultSet rs = preparedStatement.executeQuery();
			
			while (rs.next()) {
				ComposizioneBean composizione= new ComposizioneBean();
				composizione.setCodice(rs.getInt("codice"));
				composizione.setNumeroordine(rs.getInt("numordine"));
				composizione.setQuantità(rs.getInt("quantita"));
				composizione.setIva(rs.getInt("iva"));
				composizione.setPrezzosingolopezzo(rs.getInt("prezzosingolopezzo"));
				composizione.setPrezzototale(rs.getDouble("prezzototale"));
				lista.addOrdine(composizione);
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
