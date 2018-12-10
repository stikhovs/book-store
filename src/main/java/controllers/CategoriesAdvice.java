package controllers;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import data.repositories.BookRepository;

@ControllerAdvice("controllers")
public class CategoriesAdvice {

	@Autowired
	BookRepository repository;


	@ModelAttribute
	public void showOuterCategories(Model model) {
		model.addAttribute("outerGenres",repository.getDistinctGenreOne());
		Map<String, String> firstCategories = new HashMap<String, String>();
		firstCategories.put("all", "��� �����");
		firstCategories.put("newArrivals", "�������");
		firstCategories.put("bestsellers", "�����������");
		model.addAttribute("firstCategories",firstCategories);
		//System.out.println("���������");
	}

}
