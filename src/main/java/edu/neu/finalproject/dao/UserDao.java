package edu.neu.finalproject.dao;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;

import edu.neu.finalproject.model.Customer;
import edu.neu.finalproject.model.User;

public class UserDao extends DAO {

	public void addCustomer(User user) throws Exception {
		try {
			// begin();
			Session session = getSession();
			session.beginTransaction();
			Customer customer = (Customer) user.getPerson();
			session.save(customer);
			session.save(user);
			session.getTransaction().commit();
			session.close();
			// commit();
		} catch (HibernateException e) {
			rollback();
			throw new Exception("Could not....zvzx!");
		}
	}

	public User queryUserByNameAndPassword(String name, String password)
			throws Exception {
		Session session = null;
		try {
			// begin();
			session = getSession();
			Query q = session
					.createQuery("from User where username = :username and password = :password");
			q.setString("username", name);
			q.setString("password", password);
			User user = (User) q.uniqueResult();
			// commit();
			return user;
		} catch (HibernateException e) {
			// rollback();
			throw new Exception("Could not get user " + name, e);
		} finally {
			session.close();
		}
	}

	public boolean checkUserName(String userName) {
		Session session = getSession();
		Query q = session
				.createQuery("from User where username = :username");
		q.setString("username", userName);
		User ua = (User) q.uniqueResult();
		session.close();
		return (ua != null);
	}

}
