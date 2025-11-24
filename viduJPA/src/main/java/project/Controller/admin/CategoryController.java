package project.Controller.admin;

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
    "/admin/addCategory",
    "/admin/editCategory",
    "/admin/deleteCategory"
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
            case "/admin/addCategory" -> 
                req.getRequestDispatcher("/views/admin/addCategory.jsp").forward(req, resp);

            case "/admin/editCategory" -> {
                int id = Integer.parseInt(req.getParameter("id"));
                Category cat = categoryService.findById(id);
                req.setAttribute("category", cat);
                req.getRequestDispatcher("/views/admin/editCategory.jsp").forward(req, resp);
            }

            case "/admin/deleteCategory" -> {
                int id = Integer.parseInt(req.getParameter("id"));
                categoryService.deleteById(id);  
                resp.sendRedirect(req.getContextPath() + "/admin/home");
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String path = req.getServletPath();
        User admin = (User) req.getSession().getAttribute("user");

        switch (path) {
            case "/admin/addCategory" -> {
                String name = req.getParameter("name");
                Category cat = new Category();
                cat.setName(name);
                cat.setUser(admin);
                categoryService.save(cat);
                resp.sendRedirect(req.getContextPath() + "/admin/home");
            }

            case "/admin/editCategory" -> {
                int id = Integer.parseInt(req.getParameter("id"));
                String name = req.getParameter("name");

                Category cat = categoryService.findById(id);
                if (cat != null) {
                    cat.setName(name);
                    categoryService.update(cat);
                }
                resp.sendRedirect(req.getContextPath() + "/admin/home");
            }
        }
    }
}
