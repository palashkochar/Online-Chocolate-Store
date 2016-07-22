package edu.neu.finalproject;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.neu.finalproject.dao.ChocolateDao;
import edu.neu.finalproject.dao.CompanyDao;
import edu.neu.finalproject.model.Chocolate;
import edu.neu.finalproject.model.User;

@Controller
public class ProductController {
	@Autowired
	private ChocolateDao productDao;
	
	@Autowired
	private CompanyDao companyDao;

	@RequestMapping(value = "showProductDetails.do", method = RequestMethod.GET)
	public String showProductDetails(Model model, HttpServletRequest request)
			throws Exception {
		User user = (User)request.getSession().getAttribute("user");
		if(user==null||!user.getRole().equals("customer")){
			return "deny";
		}
		long productID = Long.parseLong(request.getParameter("productID"));
		Chocolate product = productDao.getSelectedProduct(productID);
		model.addAttribute("categories", companyDao.getCategories());
		model.addAttribute("product", product);
		return "productdetails";
	}

	@RequestMapping(value = "checkforproduct.do", method = RequestMethod.POST)
	public void productSuggestion(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		String category = request.getHeader("category");
		String productName = request.getHeader("productName");

		String suggestion = productDao.getProductSuggestions(category,
				productName);
		PrintWriter out = response.getWriter();
		out.print(suggestion);
	}
}
