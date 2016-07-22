package edu.neu.finalproject.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;

import edu.neu.finalproject.model.Category;
import edu.neu.finalproject.model.Chocolate;

public class ChocolateDao extends DAO {
	public Chocolate getSelectedProduct(long chocolateId) throws Exception {
		Session session = getSession();
		try {

			session.beginTransaction();
			Query q = session
					.createQuery("from Chocolate where chocolateId = :chocolateId");
			q.setString("chocolateId", String.valueOf(chocolateId));
			Chocolate selectedProduct = (Chocolate) q.list().get(0);
			session.getTransaction().commit();
			return selectedProduct;

		} catch (HibernateException e) {
			rollback();
			throw new Exception("Could not....supp!");
		}

		finally {
			session.close();
		}

	}
	
	public String getProductSuggestions(String category, String productName){
		
		Session session = getSession();
		session.beginTransaction();
		Query q = session.createQuery("from Category where categoryName = :category");
		q.setString("category", category);
		Category dc = (Category)q.uniqueResult();
		
		String ChocCatId = String.valueOf(dc.getCategoryId());
		
		Query q1 = session.createQuery("from Chocolate where category = :catId and chocolateName like '"+productName+"%'");
		q1.setString("catId", ChocCatId);
		List<Chocolate> products = q1.list();
		String suggestion = "";
		
		for(Chocolate dp : products){
			
			suggestion = suggestion + dp.getChocolateName() +"\r\n";
		}
		
		return suggestion;
	}

}
