package project.Controller;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpSession;

@WebServlet("/logout")
public class LogoutController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	@Override
	protected void doGet(jakarta.servlet.http.HttpServletRequest request, jakarta.servlet.http.HttpServletResponse response)
			throws jakarta.servlet.ServletException, java.io.IOException {
		HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate(); 
        }

        request.getRequestDispatcher("/views/Login.jsp").forward(request, response);
	}
}
