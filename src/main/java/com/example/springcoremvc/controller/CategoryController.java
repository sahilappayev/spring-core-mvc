package com.example.springcoremvc.controller;

import com.example.springcoremvc.dto.CategoryResponseDto;
import com.example.springcoremvc.service.CategoryService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@RequiredArgsConstructor
@Controller
@RequestMapping("/categories")
public class CategoryController {

    private final CategoryService categoryService;

    @GetMapping
    protected String getAll(Model model) {
        List<CategoryResponseDto> categories = categoryService.getAll();
        model.addAttribute("categories", categories);
        return "/category";
    }

    @PostMapping
    protected void create(@RequestParam String categoryName,
                          HttpServletRequest request,
                          HttpServletResponse response) throws IOException {
        categoryService.create(categoryName);
        response.sendRedirect(request.getRequestURI());
    }

    @PostMapping("/delete")
    protected void delete(@RequestParam Integer id,
                          HttpServletRequest request,
                          HttpServletResponse response) throws IOException {
        categoryService.delete(id);

        String requestURI = request.getRequestURI();

        System.out.println("requestURI: " + requestURI); // categories/delete


        requestURI = requestURI.replace("/delete", "");

        System.out.println("requestURI 2: " + requestURI);

        response.sendRedirect(requestURI);
    }

}
