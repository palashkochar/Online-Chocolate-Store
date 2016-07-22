package edu.neu.finalproject;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Validator;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.neu.finalproject.dao.AdminDao;
import edu.neu.finalproject.dao.CompanyDao;
import edu.neu.finalproject.dao.CustomerDao;
import edu.neu.finalproject.dao.Insert;
import edu.neu.finalproject.dao.SearchDao;
import edu.neu.finalproject.dao.UserDao;
import edu.neu.finalproject.model.Category;
import edu.neu.finalproject.model.Company;
import edu.neu.finalproject.model.Customer;
import edu.neu.finalproject.model.User;
import edu.neu.finalproject.model.UserRole;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	@Autowired
	@Qualifier("userValidator")
	private Validator validator;

	@Autowired
	private Insert insert;

	@Autowired
	private AdminDao adminDao;

	@Autowired
	private UserDao userDao;

	@Autowired
	private CompanyDao companyDao;

	@Autowired
	private SearchDao searchDao;

	@Autowired
	private CustomerDao customerDao;

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@InitBinder
	private void initBinder(WebDataBinder binder) {
		binder.setValidator(validator);
	}

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String initUserLoginForm(Locale locale, Model model,
			HttpServletRequest request, HttpSession session) throws Exception {
		adminDao.checkAdmin();
		Cookie[] cookies = request.getCookies();
		String userName = null;
		String password = null;

		// boolean foundCookie = false;
		if (cookies != null) {
			for (int i = 0; i < cookies.length; i++) {
				Cookie c = cookies[i];
				if (c.getName().equals("userid")) {
					userName = c.getValue();
					model.addAttribute("userName", userName);
				}
				if (c.getName().equals("pwd")) {
					password = c.getValue();
					model.addAttribute("password", password);
				}
				// User user = new User();
				// model.addAttribute("user", user);
				// insert.insert();
				// foundCookie = true;
				User u = userDao.queryUserByNameAndPassword(userName, password);
				if (u != null) {

					if (u.getRole().equals(UserRole.ROLE_ADMIN)) {
						session.setAttribute("user", u);
						return "adminWorkArea";
					}

					if (u.getRole().equals(UserRole.ROLE_SUPPLIER)) {

						session.setAttribute("user", u);
						List<Category> categories = companyDao.getCategories();
						model.addAttribute("categories", categories);
						model.addAttribute("company", u);
						return "supplierworkarea";
					}

					if (u.getRole().equals(UserRole.ROLE_CUSTOMER)) {
						List<Category> categories = companyDao.getCategories();
						session.setAttribute("user", u);
						List<String> companyList = customerDao.getCompanyList();
						Customer customer = (Customer) u.getPerson();
						long customerID = customer.getPersonID();
						model.addAttribute("customerID", customerID);
						model.addAttribute("categories", categories);
						model.addAttribute("companyList", companyList);
						return "home";
					}
				}
			}

			User userAccount = new User();
			model.addAttribute("user", userAccount);
			return "login";
		} else {
			User userAccount = new User();
			model.addAttribute("user", userAccount);
			model.addAttribute("foundCookie", false);
			return "login";
		}
	}

	@RequestMapping(value = "login.go", method = RequestMethod.POST)
	public String submitForm(Model model, @Validated User user,
			BindingResult result, HttpSession session,
			HttpServletRequest request, HttpServletResponse response) {
		model.addAttribute("user", user);
		String returnVal = "home";
		if (result.hasErrors()) {
			return "login";
		} else {
			try {
				User u = userDao.queryUserByNameAndPassword(user.getUsername(),
						user.getPassword());
				if (u != null) {
					model.addAttribute("user", u);
					boolean remember_me_is_checked;
					if (request.getParameter("rememberme") != null) {
						remember_me_is_checked = true;
						if (remember_me_is_checked) {
							Cookie c1 = new Cookie("userid", user.getUsername());
							Cookie c2 = new Cookie("pwd", user.getPassword());
							c1.setMaxAge(7 * 24 * 60 * 60);
							c2.setMaxAge(7 * 24 * 60 * 60);
							response.addCookie(c1);
							response.addCookie(c2);
						}
					}

					if (u.getRole().equals(UserRole.ROLE_ADMIN)) {
						session.setAttribute("user", u);
						return "adminWorkArea";
					}

					if (u.getRole().equals(UserRole.ROLE_SUPPLIER)) {

						session.setAttribute("user", u);
						List<Category> categories = companyDao.getCategories();
						model.addAttribute("categories", categories);
						model.addAttribute("company", u);
						return "supplierworkarea";
					}

					if (u.getRole().equals(UserRole.ROLE_CUSTOMER)) {
						List<Category> categories = companyDao.getCategories();
						session.setAttribute("user", u);
						List<String> companyList = customerDao.getCompanyList();
						Customer customer = (Customer) u.getPerson();
						long customerID = customer.getPersonID();
						model.addAttribute("customerID", customerID);
						model.addAttribute("categories", categories);
						model.addAttribute("companyList", companyList);
						return returnVal;
					}
				} else
					return "login";
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return "login";
	}

	@RequestMapping(value = "goToSignUp.go")
	public String gotToSignUpPage() {
		// return "adminWorkArea";
		// return "supplierworkarea";
		return "signup";
	}

	@RequestMapping(value = "signup.do", method = RequestMethod.POST)
	public String signUpUser(Model model, HttpServletRequest request,
			HttpSession session) throws Exception {
		Customer customer = new Customer();
		customer.setFirstName(request.getParameter("firstName"));
		customer.setLastName(request.getParameter("lastName"));
		customer.setAddress(request.getParameter("address"));
		customer.setDateOfBirth(request.getParameter("dob"));
		customer.setEmail(request.getParameter("email"));
		customer.setGender(request.getParameter("gender"));
		customer.setPhoneNo(Long.parseLong(request.getParameter("phoneNo")));

		User userAccount = new User();
		userAccount.setUsername(request.getParameter("username"));
		userAccount.setPassword(request.getParameter("password"));
		userAccount.setRole(UserRole.ROLE_CUSTOMER);

		userAccount.setPerson(customer);

		userDao.addCustomer(userAccount);
		session.setAttribute("user", userAccount);
		model.addAttribute("user", userAccount);

		return "login";
	}

	@RequestMapping(value = "addChocolate.do", method = RequestMethod.POST)
	public String addChocolate(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		User user = (User) request.getSession().getAttribute("user");
		if (user == null || !user.getRole().equals("supplier")) {
			return "deny";
		}
		String category = request.getParameter("category");
		String name = request.getParameter("chocolateName");
		String desc = request.getParameter("desc");
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		Float price = Float.parseFloat(request.getParameter("price"));
		String companyName = request.getParameter("companyName");

		System.out.println(companyName);
		// int quantity = Integer.parseInt(request.getParameter("quantity"));
		// String path = request.getParameter("upload");
		String path = request.getParameter("upload");
		// UPLOAD PICTURE CODE//
		// String sample = "sample";
		// UPLOAD MUSIC SAMPLE//

		companyDao.addChocolate(category, name, price, desc, path, companyName,
				quantity);
		return "chocolateAdded";
	}

	@RequestMapping(value = "addCompany.do", method = RequestMethod.POST)
	public String addCompany(Model model, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		User user = (User) request.getSession().getAttribute("user");
		if (user == null || !user.getRole().equals("admin")) {
			return "deny";
		}
		// Company company = new Company();
		String firstname = request.getParameter("companyName");
		// String lastname = request.getParameter("lastname");

		String username = request.getParameter("username");
		String password = request.getParameter("password");

		adminDao.addCompany(firstname, username, password);

		return "companyAdded";
	}

	@RequestMapping(value = "addCategory.do", method = RequestMethod.POST)
	public String addCategory(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		User user = (User) request.getSession().getAttribute("user");
		if (user == null || !user.getRole().equals("admin")) {
			return "deny";
		}
		String category = request.getParameter("categoryName");

		// Category categoryObj = new Category();
		// categoryObj.setCategoryName(category);
		adminDao.addCategory(category);

		return "categoryAdded";
	}

	@RequestMapping(value = "checkforusername.do", method = RequestMethod.POST)
	public void checkUserName(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		String username = request.getHeader("username");

		PrintWriter out = response.getWriter();
		boolean b = userDao.checkUserName(username);
		if (b)

			out.print("true");
		else
			out.print("false");
	}

	@RequestMapping(value = "logout.go", method = RequestMethod.GET)
	public void logout(HttpSession session, HttpServletResponse response)
			throws IOException {
		try {
			session.removeAttribute("user");
			Cookie c1 = new Cookie("userName", null);
			Cookie c2 = new Cookie("password", null);
			c1.setMaxAge(7 * 24 * 60 * 60);
			c2.setMaxAge(7 * 24 * 60 * 60);
			response.addCookie(c1);
			response.addCookie(c2);
			// response.sendRedirect("");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.sendRedirect("");
	}

	@RequestMapping(value = "gohome.do", method = RequestMethod.GET)
	public String goToHomePage(HttpSession session, Model model)
			throws Exception {

		User u = (User) session.getAttribute("user");

		List<Category> categories = companyDao.getCategories();
		List<String> companyList = customerDao.getCompanyList();
		Customer customer = (Customer) u.getPerson();
		long customerID = customer.getPersonID();
		model.addAttribute("customerID", customerID);
		model.addAttribute("categories", categories);
		model.addAttribute("companyList", companyList);
		return "home";
	}

	@RequestMapping(value = "gosupplierhome.do", method = RequestMethod.GET)
	public String goToSupplierHomePage(HttpSession session, Model model)
			throws Exception {
		User u = (User) session.getAttribute("user");
		// Company company = (Company) u.getPerson();
		// String companyName = company.getCompanyName();
		model.addAttribute("company", u);

		List<Category> categories = companyDao.getCategories();
		model.addAttribute("categories", categories);

		session.setAttribute("user", u);
		return "supplierworkarea";
	}

	@RequestMapping(value = "goadminhome.do", method = RequestMethod.GET)
	public String goToAdminHomePage(HttpSession session, Model model)
			throws Exception {
		User u = (User) session.getAttribute("user");
		session.setAttribute("user", u);
		return "adminWorkArea";
	}
}
