package it.unisa;

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

			ds = (DataSource) envCtx.lookup("jdbc/alemarsport");

		} catch (NamingException e) {
			System.out.println("Error:" + e.getMessage());
		}
	}

	private static final String PRODOTTO = "prodotto";

	
	public synchronized ProductBean doRetrieveByKey(String x) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		ProductBean bean = new ProductBean();
		
		String selectSQL = "SELECT * FROM " + ProductModelDS.PRODOTTO + " WHERE IDProdotto = ?";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setString(1, x);
			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				bean.setCode(rs.getString("IDPRODOTTO"));
				bean.setName(rs.getString("NOME"));
				bean.setDescription(rs.getString("DESCRIZIONEPRODOTTO"));
				bean.setPrice(rs.getFloat("PREZZONOIVA"));
				bean.setSconto(rs.getInt("SCONTO"));
				bean.setQuantity(rs.getInt("DISPONIBILITà"));
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
	public synchronized Collection<ProductBean> doRetrieveAll(String order) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		Collection<ProductBean> prodotti = new LinkedList<ProductBean>();

		String selectSQL = "SELECT * FROM " + ProductModelDS.PRODOTTO;

		if (order != null && !order.equals("")) {
            selectSQL += " ORDER BY " + order;
        }
		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				ProductBean bean = new ProductBean();

				bean.setCode(rs.getString("IDPRODOTTO"));
				bean.setName(rs.getString("NOME"));
				bean.setDescription(rs.getString("DESCRIZIONEPRODOTTO"));
				bean.setPrice(rs.getInt("PREZZONOIVA"));
				bean.setSconto(rs.getInt("SCONTO"));
				bean.setQuantity(rs.getInt("DISPONIBILITà"));
				prodotti.add(bean);
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
		return prodotti;
	}
	

}