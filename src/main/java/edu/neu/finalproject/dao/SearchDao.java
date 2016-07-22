package edu.neu.finalproject.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

import edu.neu.finalproject.model.Chocolate;
import edu.neu.finalproject.model.Person;
import edu.neu.finalproject.model.User;

public class SearchDao extends DAO {

	public List<Chocolate> quickSearch(String chocolateName, String category,
			float priceFrom, float priceTo, String companyName)
			throws Exception {
		try {
			// begin();
			Session session = getSession();
			session.beginTransaction();
//			long companyId;
//			if(!companyName.equals("")){
//			Query q = session
//					.createQuery("from Company where companyName = :companyName");
//			q.setString("companyName", companyName);
//			Person p = (Person)q.list().get(0);
//			companyId = p.getPersonID();
//			}
			Criteria cr;
			if (chocolateName.equals("") && category.equals("")
					&& priceFrom == 0 && priceTo == 0 && companyName.equals("")) {
				cr = session.createCriteria(Chocolate.class);
			} else {
				cr = session.createCriteria(Chocolate.class);
				if (chocolateName != "" || chocolateName != null) {
					cr.add(Restrictions.like("chocolateName", chocolateName
							+ "%"));
				}
				if (category != "" || category != null) {
					cr.add(Restrictions.like("category", category + "%"));
				}
				if (companyName != "" || companyName != null) {
					cr.add(Restrictions.like("companyName", companyName + "%"));
				}
				if (priceFrom == 0 && priceTo == 0) {
					cr.add(Restrictions.gt("price", priceFrom));
				}
				if (priceFrom == 0 && priceTo != 0) {
					cr.add(Restrictions.between("price", priceFrom, priceTo));
				}
			}
			session.getTransaction().commit();
			session.close();
			// List<Chocolate> chocolateList = cr.list();
			return cr.list();
		} catch (HibernateException e) {
			// rollback();
			throw new Exception("Problem getting contacts!", e);
		}
	}
}
