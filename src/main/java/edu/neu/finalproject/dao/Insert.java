package edu.neu.finalproject.dao;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.hibernate.HibernateException;
import org.hibernate.Session;

import edu.neu.finalproject.model.Admin;
import edu.neu.finalproject.model.Customer;
import edu.neu.finalproject.model.Person;
import edu.neu.finalproject.model.User;

public class Insert extends DAO{

	public void insert() throws Exception{
		try {
			Session session = getSession(); 
			session.beginTransaction();
			
//			Customer customer = new Customer();
//			customer.setFirstName("palash");
//			customer.setLastName("kochar");
//			customer.setEmail("palash.kochar@");
//			User user = new User();
//			user.setUsername("palash");
//			user.setPassword("password");
//			user.setRole("customer");
//			user.setPerson((Person)customer);
//	        
//			session.save(user);
//			session.save(customer);
			
//			Admin admin = new Admin();
//			admin.setFirstName("Admin");
//			admin.setLastName("Admin");
//			
//			User user = new User();
//			user.setUsername("admin");
//			user.setPassword("admin");
//			user.setRole("admin");
//			user.setPerson((Person)admin);
//			
//			session.save(user);
//			session.save(admin);
			
			System.out.println("inserted");
			
			session.getTransaction().commit();
		} catch (HibernateException e) {
//			rollback();
			throw new Exception("Problem getting Messages!" , e);
		}
	}
}
