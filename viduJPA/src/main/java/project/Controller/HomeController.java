package project.Controller;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import project.entity.Category;
import project.entity.User;
import project.repository.impl.CategoryRepositoryImpl;
import project.service.CategoryService;
import project.service.impl.CategoryServiceImpl;

@WebServlet({"/user/home", "/manager/home", "/admin/home"})
public class HomeController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	private CategoryService categoryService;

    @Override
    public void init() {
        // Inject repository vào service (manual DI)
        this.categoryService = new CategoryServiceImpl(new CategoryRepositoryImpl());
    }
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        User user = (User) req.getSession().getAttribute("user");

        if (user == null) {
            resp.sendRedirect(req.getContextPath() + "/Login.jsp");
            return;
        }

        
        List<Category> categories;

        if (user.getRoleId() == 2) {
            categories = categoryService.findByUserId(user.getId());
        } else {
            categories = categoryService.findAll();
        }

        req.setAttribute("categories", categories);

        switch (user.getRoleId()) {
            case 1 -> req.getRequestDispatcher("/views/user/home.jsp").forward(req, resp);
            case 2 -> req.getRequestDispatcher("/views/manager/home.jsp").forward(req, resp);
            case 3 -> req.getRequestDispatcher("/views/admin/home.jsp").forward(req, resp);
        }
    }
}
