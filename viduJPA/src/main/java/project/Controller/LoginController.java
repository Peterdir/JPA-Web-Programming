package project.Controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import project.entity.User;
import project.repository.impl.UserRepositoryImpl;
import project.service.UserService;
import project.service.impl.UserServiceImpl;

@WebServlet ("/login")
public class LoginController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	private UserService userService;

    @Override
    public void init() {
        this.userService = new UserServiceImpl(new UserRepositoryImpl());
    }
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	}
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String userName = req.getParameter("username");
		String password = req.getParameter("password");
		
		User user = userService.login(userName, password);
		
		if(user != null) {
			req.getSession().setAttribute("user", user);

            switch (user.getRoleId()) {
                case 1: resp.sendRedirect(req.getContextPath() + "/user/home"); break;
                case 2: resp.sendRedirect(req.getContextPath() + "/manager/home"); break;
                case 3: resp.sendRedirect(req.getContextPath() + "/admin/home"); break;
            }

		} else {
            req.setAttribute("error", "Sai tài khoản hoặc mật khẩu");
            req.getRequestDispatcher("/views/Login.jsp").forward(req, resp);
		}
	}
	
}
