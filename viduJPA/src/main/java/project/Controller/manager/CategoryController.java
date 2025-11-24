package project.Controller.manager;

import java.io.IOException;

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

@WebServlet({
    "/manager/addCategory",
    "/manager/editCategory",
    "/manager/deleteCategory"
})
public class CategoryController extends HttpServlet{
	private static final long serialVersionUID = 1L;
    private CategoryService categoryService;
    
    @Override
    public void init() {
        this.categoryService = new CategoryServiceImpl(new CategoryRepositoryImpl());
    }
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String path = req.getServletPath();

        switch (path) {
            case "/manager/addCategory" -> req.getRequestDispatcher("/views/manager/addCategory.jsp").forward(req, resp);

            case "/manager/editCategory" -> {
                int id = Integer.parseInt(req.getParameter("id"));
                Category cat = categoryService.findById(id);
                req.setAttribute("category", cat);
                req.getRequestDispatcher("/views/manager/editCategory.jsp").forward(req, resp);
            }

            case "/manager/deleteCategory" -> {
                int id = Integer.parseInt(req.getParameter("id"));
                categoryService.deleteById(id);
                resp.sendRedirect(req.getContextPath() + "/manager/home");
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String path = req.getServletPath();
        User user = (User) req.getSession().getAttribute("user");

        switch (path) {
            case "/manager/addCategory" -> {
                String name = req.getParameter("name");
                Category cat = new Category();
                cat.setName(name);
                cat.setUser(user);
                categoryService.save(cat);
                resp.sendRedirect(req.getContextPath() + "/manager/home");
            }

            case "/manager/editCategory" -> {
                int id = Integer.parseInt(req.getParameter("id"));
                String name = req.getParameter("name");

                Category cat = categoryService.findById(id);
                if (cat != null && cat.getUser().getId() == user.getId()) {
                    cat.setName(name);
                    categoryService.update(cat);
                }
                resp.sendRedirect(req.getContextPath() + "/manager/home");
            }
        }
    }
}
