package it.unisa;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.Date;
import java.util.LinkedList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class OrdineDAO 	
{
   private static final String TABLE_NAME = "ordine";
   static Date x=new Date();
   static int g=x.getDay();
   static int m=x.getMonth();
   static int y=x.getYear();
   private static DataSource ds;
   static ResultSet rs = null; 
   static Connection connection = null;
   static {
		try {
			Context initCtx = new InitialContext();
			Context envCtx = (Context) initCtx.lookup("java:comp/env");

			ds = (DataSource) envCtx.lookup("jdbc/alemarsport");

		} catch (NamingException e) {
			System.out.println("Error:" + e.getMessage());
		}
	}
   
   
   public static OrdineBean doRetrieveByKey(String x) throws SQLException {   
	   Connection connection = null;
	   PreparedStatement preparedStatement = null;
		
	   OrdineBean bean = new OrdineBean();
	   String selectSQL = "SELECT * FROM " + OrdineDAO.TABLE_NAME + " WHERE IDOrdine= ?";
	   try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setString(1, x);
			

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				bean.setIDOrdine(rs.getString("IDORDINE"));
				bean.setDataSpedizione(rs.getDate("DATASPEDIZIONE"));
				bean.setNumProdotti(rs.getInt("DESCRIZIONEPRODOTTO"));
				bean.setDescrizioneProdotti(rs.getString("DESCRIZIONEPRODOTTI"));
				bean.setStatoOrdine(rs.getString("STATOORDINE"));
				bean.setDataConsegna(rs.getDate("DATACONSEGNA"));
				bean.setDataOrdine(rs.getDate("DATAORDINE"));
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

   
   
   public synchronized static void doSave(Cart c,AccountBean user) throws SQLException {

		Connection connection = null;
		PreparedStatement preparedStatement = null;
		String insertSQL = "INSERT INTO " + OrdineDAO.TABLE_NAME
				+ "( DataSpedizione,NumProdotti, DescrizioneProdotti, StatoOrdine ,DataConsegna, DataOrdine, IDAccount,PrezzoFinaleOrdine) VALUES (?,?,?,?,?,?,?,?)";
		
		try {
			
			java.sql.Date DataOrdine = new java.sql.Date(y, m, g);
			java.sql.Date DataConsegna = new java.sql.Date(y, m, g+6);
			java.sql.Date DataSpedizione = new java.sql.Date(y, m, g+2);
			connection = ds.getConnection();

				preparedStatement = connection.prepareStatement(insertSQL);
				preparedStatement.setDate(1, DataSpedizione);
				preparedStatement.setInt(2, c.DammiNumeroTotaleProdotti());
				preparedStatement.setString(3, c.DammiTutteLeDescrizioni());
				preparedStatement.setString(4, "Ordinato");
				preparedStatement.setDate(5,DataConsegna);
				preparedStatement.setDate(6,DataOrdine);
				preparedStatement.setInt(7,user.getIDAccount());
				preparedStatement.setFloat(8,c.DammiCostoTotaleCarrello());
				preparedStatement.executeUpdate();
				preparedStatement.close();
			      
		    																				
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
   public synchronized static Collection<OrdineBean> doRetrieveAll(Cart c) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		Collection<OrdineBean> ordini = new LinkedList<OrdineBean>();

		String selectSQL = "SELECT * FROM " + OrdineDAO.TABLE_NAME;

		
		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				OrdineBean bean = new OrdineBean();

				bean.setIDOrdine(rs.getString("IDORDINE"));
				bean.setNumProdotti(c.DammiNumeroTotaleProdotti());
				bean.setDescrizioneProdotti(rs.getString("DESCRIZIONEPRODOTTI"));
				bean.setStatoOrdine(rs.getString("STATOORDINE"));
				bean.setDataSpedizione(rs.getDate("DATASPEDIZIONE"));
				bean.setDataConsegna(rs.getDate("DATACONSEGNA"));
				bean.setDataOrdine(rs.getDate("DATAORDINE"));
				bean.setPrezzoFinale(c.DammiCostoTotaleCarrello());
				ordini.add(bean);
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
		return ordini;
	}


}

