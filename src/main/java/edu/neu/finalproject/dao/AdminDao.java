package edu.neu.finalproject.dao;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;

import edu.neu.finalproject.model.Admin;
import edu.neu.finalproject.model.Category;
import edu.neu.finalproject.model.Company;
import edu.neu.finalproject.model.Person;
import edu.neu.finalproject.model.User;
import edu.neu.finalproject.model.UserRole;

public class AdminDao extends DAO {

	public void checkAdmin() throws Exception {

		try {
			// begin();
			Session session = getSession();
			Query q = session.createQuery("from Admin");
			if (q.list().size() == 0) {
				Admin admin = new Admin();
				admin.setFirstName("adminFname");
				admin.setLastName("adminLname");

				User user = new User();
				user.setUsername("p");
				user.setPassword("k");
				user.setPerson(admin);
				user.setRole(UserRole.ROLE_ADMIN);

				session.beginTransaction();
				session.save(admin);
				session.save(user);

				session.getTransaction().commit();
				session.close();

			}
			// commit();
		} catch (HibernateException e) {
			// rollback();
			throw new Exception("Could not get user" + e);
		}

	}

	public void addCompany(String firstname, String username, String password)
			throws Exception {
		try {

			// begin();
			Session session = getSession();
			session.beginTransaction();

			Company company = new Company();
			company.setCompanyName(firstname);

			User user = new User();
			user.setUsername(username);
			user.setPassword(password);
			user.setRole(UserRole.ROLE_SUPPLIER);
//			Person person = new Person();
//			person.setFirstName(firstname);
			user.setPerson(company);

//			session.save(person);
			session.save(user);
			session.save(company);

			session.getTransaction().commit();
			session.close();
			// commit();
		} catch (HibernateException e) {

			rollback();
			throw new Exception("Could not....supp!");
		}
	}

	public void addCategory(String  categoryName) throws Exception {
		try {

			// begin();
			Session session = getSession();
			session.beginTransaction();
			Category category=new Category();
			category.setCategoryName(categoryName);
			session.save(category);

			session.getTransaction().commit();
			session.close();

			// commit();
		} catch (HibernateException e) {

			rollback();
			throw new Exception(e);
		}
	}

}
