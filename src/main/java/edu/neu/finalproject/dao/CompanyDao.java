package edu.neu.finalproject.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;

import edu.neu.finalproject.model.Category;
import edu.neu.finalproject.model.Chocolate;

public class CompanyDao extends DAO{
	
	public List<Category> getCategories() throws Exception{

		
		try {
        	
//        	begin();
            Session session = getSession();
            session.beginTransaction();
            
            Query q = session.createQuery("from Category");
            
            List<Category> categories = new ArrayList<Category>();
            categories=q.list();
            
            
            session.getTransaction().commit();
            session.close();
    		return categories;
            
//            commit();
        } catch (HibernateException e) {
        	
            rollback();
            throw new Exception("Could not....supp!");
        }
	}
	
	

	public void addChocolate(String category, String name, Float price, String desc, String path, String companyName, int quantity) throws Exception{
		Session session=null;
		try {
        	
//        	begin();
            session = getSession();
            session.beginTransaction();
            
            Query q = session.createQuery("from Category where categoryName = :category");
            q.setString("category", category);
            Category categoryObj = (Category)q.list().get(0);
            
            Chocolate chocolate = new Chocolate();

            chocolate.setChocolateName(name);;
            chocolate.setPrice(price);
            chocolate.setQuantity(quantity);
    		chocolate.setDescription(desc);
    		chocolate.setPath(path);
//    		chocolate.setSample(sample);
    		chocolate.setCompanyName(companyName);
    		//set fileuploadPath//

            
    		chocolate.setCategory(categoryObj);
            
            session.save(chocolate);
            
            session.getTransaction().commit();
            
//            commit();
        } catch (HibernateException e) {
        	
            rollback();
            throw new Exception(e);
        }
		finally {
			session.close();
		}
		
	}
	
}
