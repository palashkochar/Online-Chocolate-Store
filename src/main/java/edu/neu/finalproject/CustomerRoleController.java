package edu.neu.finalproject;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.neu.finalproject.dao.CompanyDao;
import edu.neu.finalproject.dao.CustomerDao;
import edu.neu.finalproject.model.Category;
import edu.neu.finalproject.model.Chocolate;
import edu.neu.finalproject.model.Customer;
import edu.neu.finalproject.model.Order;
import edu.neu.finalproject.model.User;

@Controller
public class CustomerRoleController {
	@Autowired
	private CustomerDao customerDao;

	@Autowired
	private CompanyDao companyDao;

	@RequestMapping(value = "getProducts.do", method = RequestMethod.POST)
	public String getproducts(Model model, HttpServletRequest request,HttpServletResponse response)
			throws Exception {
		User user = (User)request.getSession().getAttribute("user");
		if(user==null||!user.getRole().equals("customer")){
			return "deny";
		}
		String category = request.getParameter("category");
		String searchProduct = request.getParameter("productName");
		List<Chocolate> productList;
		if (searchProduct == null) {
			productList = customerDao.getProductList(category);
			model.addAttribute("companyList", customerDao.getCompanyList());
			model.addAttribute("categories", companyDao.getCategories());
			model.addAttribute("searchResult", productList);
		} else {
			productList = customerDao.getProduct(category, searchProduct);
			model.addAttribute("companyList", customerDao.getCompanyList());
			model.addAttribute("categories", companyDao.getCategories());
			model.addAttribute("searchResult", productList);
		}
		return "productdisplay";

	}

	@RequestMapping(value = "quickSearch.do", method = RequestMethod.POST)
	public String quickSearch(Model model, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		User user = (User)request.getSession().getAttribute("user");
		if(user==null||!user.getRole().equals("customer")){
			return "deny";
		}
		String chocolateName = request.getParameter("chocolateName");
		float priceFrom;
		float priceTo;
		String pricef = request.getParameter("priceFrom");
		if (pricef.equals("")) {
			priceFrom = 0;
		} else {
			priceFrom = Float.parseFloat(pricef);
		}
		String pricet = request.getParameter("priceTo");
		if (pricet.equals("")) {
			priceTo = 0;
		} else {
			priceTo = Float.parseFloat(pricet);
		}
		String category = request.getParameter("category");

		String companyName = request.getParameter("company");
		System.out.println(companyName);
		// searchDao.quickSearch(chocolateName, category, priceFrom, priceTo,
		// companyName);
		model.addAttribute("companyList", customerDao.getCompanyList());
		model.addAttribute("categories", companyDao.getCategories());
		List<Chocolate> searchResult = customerDao.quickSearch(chocolateName,
				category, priceFrom, priceTo, companyName);
		model.addAttribute("searchResult", searchResult);
		return "productdisplay";
	}
	
	@RequestMapping(value = "getOrderHistory.go", method = RequestMethod.POST)
	public String getOrderHistory(Model model,HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		User user = (User)request.getSession().getAttribute("user");
		if(user==null||!user.getRole().equals("customer")){
			return "deny";
		}
		String customerID=request.getParameter("customerID");
		List<Order>orderList=customerDao.getCustomerOrderHistory(customerID);
		model.addAttribute("orderList", orderList);
		if(orderList.size()==0)
		{
			return "NoOrderHistory";
		}
		return "OrderHistory";
		
	}
	
	
	@RequestMapping(value = "goToChangePassword.do", method = RequestMethod.POST)
	public String goToChangePassword()
	{
		return "ChangePassword";		
	}
	
	@RequestMapping(value = "changePassword.do", method = RequestMethod.POST)
	public String updatePassword(HttpServletRequest request, HttpSession session)
	{
		User userAccount = (User)session.getAttribute("user");
		long id = userAccount.getUserID();
		String newPassword = request.getParameter("newPwdTF");
		customerDao.updatePassword(id, newPassword);
		return "passwordSuccessful";		
	}
	
	@RequestMapping(value = "checkPassword.do", method = RequestMethod.POST)
	public void verifyPassword(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException{
		PrintWriter out = response.getWriter();
		User userAccount = (User)session.getAttribute("user");
		
		String userName = userAccount.getUsername();
		
		String oldPassword = request.getHeader("oldPassword");
		if(customerDao.queryByPassword(userName, oldPassword)){	
			out.print("true");
		}
		else
		{
			out.print("false");
		}
}
	
	@RequestMapping(value="logout.go", method=RequestMethod.POST)
	public void logout(HttpSession session, HttpServletResponse response) throws IOException
	{
		session.removeAttribute("user");
		Cookie c1 = new Cookie("userid", null);
		Cookie c2 = new Cookie("pwd", null);
		c1.setMaxAge(0);
		c2.setMaxAge(0);
		response.addCookie(c1);
		response.addCookie(c2);
		response.sendRedirect("");
	}
	
	@RequestMapping(value="gotohomepage.htm", method=RequestMethod.GET)
	public String goToHomePage(HttpSession session, Model model) throws Exception{
		
		User u = (User)session.getAttribute("user");
		List<Category> categoryList = companyDao.getCategories();
		model.addAttribute("categories", categoryList);
		
		List<String> companyList = customerDao.getCompanyList();
		model.addAttribute("companyList", companyList);
		
		Customer customer=(Customer)u.getPerson();
		long customerID=customer.getPersonID();
		model.addAttribute("customerID",customerID);
		
		return "home";
		
	}
}
