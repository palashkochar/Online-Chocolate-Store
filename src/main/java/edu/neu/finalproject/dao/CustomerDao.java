package edu.neu.finalproject.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

import edu.neu.finalproject.model.Category;
import edu.neu.finalproject.model.Chocolate;
import edu.neu.finalproject.model.Order;

public class CustomerDao extends DAO {

	public List<Chocolate> getProduct(String category, String chocolate)
			throws Exception {
		Session session = getSession();
		try {

			session.beginTransaction();
			Query q = session
					.createQuery("from Category where categoryName = :categoryname");
			q.setString("categoryname", category);

			Category dbCategory = (Category) q.list().get(0);
			long categoryId = dbCategory.getCategoryId();

			Query q1 = session
					.createQuery("from Chocolate where category =:categoryId and chocolateName= :chocolate ");
			q1.setString("categoryId", String.valueOf(categoryId));
			q1.setString("chocolate", chocolate);
			session.getTransaction().commit();
			return q1.list();

		} catch (HibernateException e) {

			rollback();
			throw new Exception(e);
		}

		finally {
			session.close();
		}
	}

	public List<String> getCompanyList() throws Exception {
		Session session=null;
		try{
		session = getSession();
		session.beginTransaction();
		Query q = session.createQuery("select distinct companyName from Chocolate");
		session.getTransaction().commit();
		return q.list();
		}
		catch (HibernateException e) {

			rollback();
			throw new Exception(e);
		}

		finally {
			session.close();
		}
	}

	public List<Chocolate> getProductList(String categoryName) throws Exception {
		Session session = getSession();
		try {

			session.beginTransaction();
			Query q = session
					.createQuery("from Category where categoryName = :categoryName");
			q.setString("categoryName", categoryName);

			Category dbCategory = (Category) q.list().get(0);
			long categoryId = dbCategory.getCategoryId();

			Query q1 = session
					.createQuery("from Chocolate where category =:categoryId ");
			q1.setString("categoryId", String.valueOf(categoryId));
			List<Chocolate> productList = new ArrayList<Chocolate>();
			productList = q1.list();
			return productList;
		}

		catch (HibernateException e) {

			rollback();
			throw new Exception(e);
		}

		finally {
			session.close();
		}
	}

	public List<Chocolate> quickSearch(String chocolateName, String category,
			float priceFrom, float priceTo, String companyName)
			throws Exception {
		Session session=null;
		try {
			// begin();
			session = getSession();
			session.beginTransaction();
			int categoryId=0;
			if (category != "") {
				Query q = session
						.createQuery("from Category where categoryName = :categoryName");
				q.setString("categoryName", category);
//				Category dbCategory = (Category) q.list();
//				categoryId = dbCategory.getCategoryId();
			}
//				Criteria cr = session.createCriteria(Chocolate.class);
//				cr.add(Restrictions.like("companyName", companyName + "%"));
//				cr.add(Restrictions.like("category", category + "%"));
				Criteria cr;
				if (chocolateName.equals("") 
						&& priceFrom == 0 && priceTo == 0
						&& companyName.equals("")) {
					cr = session.createCriteria(Chocolate.class);
				} else {
					cr = session.createCriteria(Chocolate.class);
					if (chocolateName != "") {
						cr.add(Restrictions.like("chocolateName", chocolateName
								+ "%"));
					}
//					if (category != "") {
//						cr.add(Restrictions.like("category", categoryId));
//					}
					if (companyName != "") {
						cr.add(Restrictions.like("companyName", companyName
								+ "%"));
					}
					if (priceFrom == 0 && priceTo == 0) {
						cr.add(Restrictions.gt("price", priceFrom));
					}
					if (priceFrom == 0 && priceTo != 0) {
						cr.add(Restrictions
								.between("price", priceFrom, priceTo+1));
					}
					if(priceFrom != 0 && priceTo != 0){
						cr.add(Restrictions
								.between("price", priceFrom-1, priceTo+1));
					}
				}
			
			session.getTransaction().commit();
			List<Chocolate> chocolateList = cr.list();
			System.out.println("erdswfe");
			return chocolateList;
		} catch (HibernateException e) {
			// rollback();
			throw new Exception("Problem getting contacts!", e);
		}
		finally {
			session.close();
		}
	}
	
	
	public List getCustomerOrderHistory(String customerID) throws Exception
	{
		Session session = getSession();
		try 
		{
        	session.beginTransaction();
            Query q = session.createQuery("from Order where customer = :customerID");
            q.setString("customerID", customerID);
            List<Order>orderList=q.list();
            session.getTransaction().commit();
            return orderList;
		}
			catch (HibernateException e) 
			{
	
				rollback();
				throw new Exception(e);
			}
		finally 
		{
			session.close();
		}
}
	
	public void updatePassword(long id, String newpassword)
	{
		Session session = getSession();
		session.beginTransaction();
		Query q = session.createQuery("update User set password = :newpwd where userID = :id");
		q.setString("newpwd", newpassword);
		q.setLong("id", id);
		int i = q.executeUpdate();
		session.getTransaction().commit();
		session.close();
		
	}
	
public boolean queryByPassword(String userName, String pwd)
{
		
		Query q = getSession().createQuery("from User where username= :username and password = :password");
        q.setString("username", userName);
        q.setString("password", pwd);
        
        List list = q.list();
        if(list.size()==1){
        	return true;
        }else{
        	return false;
        }
	}
	
	
}
