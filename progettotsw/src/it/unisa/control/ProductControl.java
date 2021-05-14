package it.unisa.control;

import java.io.IOException; 
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.unisa.model.ProductModel;

import it.unisa.model.ProductModelDS;
import it.unisa.model.UserBean;
import it.unisa.model.Cart;
import it.unisa.model.ComposizioneDAO;
import it.unisa.model.ListaComposizione;
import it.unisa.model.ListaOrdiniBean;
import it.unisa.model.OrdiniDAO;
import it.unisa.model.ProductBean;
import it.unisa.model.ProductCart;
/**
 * Servlet implementation class ProductControl
 */
public class ProductControl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// ProductModelDS usa il DataSource
	// ProductModelDM usa il DriverManager	
	static boolean isDataSource = true;
	
	static ProductModel model;
	
	static {
	
			model = new ProductModelDS();
	}
	
	public ProductControl() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Cart cart = (Cart)request.getSession().getAttribute("cart");
		if(cart == null) {
			cart = new Cart();
			request.getSession().setAttribute("cart", cart);
		}
		
		String action = request.getParameter("action");

		try {
			if (action != null) {
				if (action.equalsIgnoreCase("addC")) {
					int id = Integer.parseInt(request.getParameter("id"));
					cart.addProduct(new ProductCart(model.doRetrieveByKey(id)));
					request.getSession().setAttribute("cart", cart);
					request.setAttribute("cart", cart);
					RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/ProductCart.jsp");
					dispatcher.forward(request, response);
				} else if (action.equalsIgnoreCase("deleteC")) {
					int id = Integer.parseInt(request.getParameter("id"));
					cart.deleteProduct(new ProductCart(model.doRetrieveByKey(id)));
					request.getSession().setAttribute("cart", cart);
					request.setAttribute("cart", cart);
					RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/ProductCart.jsp");
					dispatcher.forward(request, response);
				} else if (action.equalsIgnoreCase("read")) {
					int id = Integer.parseInt(request.getParameter("id"));
					request.removeAttribute("product");
					request.setAttribute("product", model.doRetrieveByKey(id));
					RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/ProductDetails.jsp");
					dispatcher.forward(request, response);
				} else if (action.equalsIgnoreCase("delete")) {
					int id = Integer.parseInt(request.getParameter("id"));
					model.doDelete(id);
				} else if (action.equalsIgnoreCase("insert")) {
					String name = request.getParameter("name");
					String description = request.getParameter("description");
					int price = Integer.parseInt(request.getParameter("price"));
					int quantity = Integer.parseInt(request.getParameter("quantity"));

					ProductBean bean = new ProductBean();
					bean.setName(name);
					bean.setDescription(description);
					bean.setPrice(price);
					bean.setQuantity(quantity);
					model.doSave(bean);
				}
				else if (action.equalsIgnoreCase("checkout")) {
					Cart car=(Cart)request.getSession().getAttribute("cart");
					UserBean user= (UserBean) request.getSession().getAttribute("currentSessionUser");
					model.doSave(user,cart);
					for(ProductCart beancart: car.getProducts()) {
						
						model.doUpdate(beancart);
						int i=beancart.getNumProduct();
						for(int x=1;x<i;i++) {
							cart.deleteProduct(beancart);
						}
						
					}
					
					RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Checkout.jsp");
					dispatcher.forward(request, response);
				}
				else if (action.equalsIgnoreCase("vedicarrello")) {
					request.getSession().setAttribute("cart", cart);
					request.setAttribute("cart", cart);
					RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/ProductCart.jsp");
					dispatcher.forward(request, response);
				}
				else if(action.equalsIgnoreCase("vediordini")) {
					UserBean user= (UserBean) request.getSession().getAttribute("currentSessionUser");
					if(user!=null) {
					String username=user.getUsername();
					ListaOrdiniBean lista=OrdiniDAO.doRetrieveByKey(username);
					request.setAttribute("listaordini", lista);
					RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Listaordini.jsp");
					dispatcher.forward(request, response);
				}
					else
						System.out.println("devi loggare prima");
					RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/erroreprodotti.jsp");
					dispatcher.forward(request, response);
					}
				else if(action.equalsIgnoreCase("dettagliordine")) {
					int codice = Integer.parseInt(request.getParameter("codice"));
					ListaComposizione list=ComposizioneDAO.doRetrieveByKey(codice);
					System.out.println(list.getOrdini().size()+" prima di me ci devono essere il numero di ordini");
					request.setAttribute("listacomposizione", list);
					RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Listacomposizione.jsp");
					dispatcher.forward(request, response);
				}
			}			
		} catch (SQLException e) {
			System.out.println("Error:" + e.getMessage());
		}

		request.getSession().setAttribute("cart", cart);
		request.setAttribute("cart", cart);
		
		String sort = request.getParameter("sort");

		try {
			request.removeAttribute("products");
			request.setAttribute("products", model.doRetrieveAll(sort));
		} catch (SQLException e) {
			System.out.println("Error:" + e.getMessage());
		}

		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/ProductView.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
