package edu.neu.finalproject;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import edu.neu.finalproject.dao.OrderDao;
import edu.neu.finalproject.model.Order;
import edu.neu.finalproject.model.Payment;
import edu.neu.finalproject.model.User;

@Controller
public class OrderController {
	@Autowired
	private OrderDao orderDao;

	@RequestMapping(value = "addToCart.do", method = RequestMethod.POST)
	public String addProductToCart(Model model, HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		User user = (User) request.getSession().getAttribute("user");
		if (user == null || !user.getRole().equals("customer")) {
			return "deny";
		}
		HttpSession session = request.getSession();
		long productID = Long.parseLong(request.getParameter("productID"));
		int productQuantity = Integer
				.parseInt(request.getParameter("quantity"));
		Order customerOrder = orderDao.addProductToCart(productID,
				productQuantity, session);
		model.addAttribute("cart", customerOrder);
		return "shoppingCart";
	}

	@RequestMapping(value = "deleteOrderItem.do", method = RequestMethod.GET)
	public String deleteOrderItemFromCart(Model model,
			HttpServletRequest request) {
		User user = (User) request.getSession().getAttribute("user");
		if (user == null || !user.getRole().equals("customer")) {
			return "deny";
		}
		// HttpSession session=request.getSession();
		long orderItemID = Long.parseLong(request.getParameter("orderItemid"));
		long orderID = Long.parseLong(request.getParameter("orderID"));
		Order customerOrder = orderDao.deleteOrderItem(orderItemID, orderID);
		model.addAttribute("cart", customerOrder);
		return "shoppingCart";
	}

	@RequestMapping(value = "checkforquantity.do", method = RequestMethod.POST)
	public void checkQuantity(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		String quant = request.getHeader("quantity");
		int quantity = Integer.parseInt(request.getHeader("quantity"));
		String productId = request.getHeader("productId");
		PrintWriter out = response.getWriter();
		if (quant == "") {
			out.print("false");
		}
		if (quantity <= 0) {
			out.print("false");
		} else if (orderDao.checkQuantity(productId, quantity)) {
			out.print("true");
		} else {
			out.print("false");
		}
	}

	@RequestMapping(value = "proceedforpayment.do", method = RequestMethod.POST)
	public String proceedForPayment(HttpServletRequest request, Model model) {
		User user = (User) request.getSession().getAttribute("user");
		if (user == null || !user.getRole().equals("customer")) {
			return "deny";
		}
		String orderId = request.getParameter("orderId");
		model.addAttribute("orderId", orderId);
		if (orderDao.checkOrderForPayment(orderId)) {
			String result = orderDao.checkForQuantity(orderId);
			if (result.equals("true")) {
				return "makePayment";
			} else {
				model.addAttribute("productNotAvailable", result);
				return "NotSufficientQuantity";
			}
		} else {
			return "paymentalreadymade";
		}
	}

	@RequestMapping(value = "makepayment.do", method = RequestMethod.POST)
	public String makePayement(HttpServletRequest request, Model model) {
		User user = (User) request.getSession().getAttribute("user");
		if (user == null || !user.getRole().equals("customer")) {
			return "deny";
		}
		String orderId = request.getParameter("orderId");
		if (orderDao.checkOrderForPayment(orderId)) {
			String name = request.getParameter("name");
			String[] card = request.getParameterValues("cardNumber");
			String cardNumber = "";
			for (String c : card) {
				cardNumber = cardNumber + c;
			}
			String month = request.getParameter("month");
			String year = request.getParameter("year");

			String date = year + "/" + month;
			int cvv = Integer.parseInt(request.getParameter("cvv"));

			Payment payment = new Payment();
			payment.setCvv(cvv);
			payment.setDate(date);
			payment.setNumber(cardNumber);
			orderDao.makePayment(payment, orderId);
			String paymentID = String.valueOf(payment.getPaymentId());

			model.addAttribute("paymentID", orderId);
			model.addAttribute("orderID", orderId);

			return "paymentsuccessful";
		} else {
			return "paymentalreadymade";
		}
	}

	@RequestMapping(value = "viewPdf.do", method = RequestMethod.POST)
	public ModelAndView home(Locale locale, ModelMap model,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String orderId = request.getParameter("orderId");
		String paymentId = request.getParameter("paymentId");
		Order order = (Order) orderDao.getOrderObj(orderId);
		model.addAttribute("order", order);

		Payment payment = (Payment) orderDao.getPaymentObj(paymentId);
		model.addAttribute("payment", payment);

		float orderTotal = order.getOrderTotal();
		model.addAttribute("total", orderTotal);
		return new ModelAndView(new PDFView(), model);
	}

	@RequestMapping(value = "viewcart.do", method = RequestMethod.POST)
	public String viewMyCart(HttpSession session, Model model,
			HttpServletResponse response) throws IOException {
		User user = (User) session.getAttribute("user");
		if (user == null) {
			response.sendRedirect("");
		}
		if (!user.getRole().equals("customer")) {
			return "deny";
		}
		String personId = String.valueOf(user.getPerson().getPersonID());
		Order cartitems = orderDao.getCartItem(personId);
		model.addAttribute("cart", cartitems);
		return "shoppingCart";
	}

}
