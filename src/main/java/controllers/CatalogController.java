package controllers;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.data.web.SortDefault;
import org.springframework.data.web.config.EnableSpringDataWebSupport;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;

import data.entities.Book;
import data.services.CategoriesService;

@Controller
@EnableSpringDataWebSupport
public class CatalogController {

	@Autowired CategoriesService service;
	
	List<String> firstCategories = new ArrayList<>(Arrays.asList(new String[] {
			"all",
			"newArrivals",
			"bestsellers"
	}));
	
	
	@ModelAttribute
	public void showAllCategories(Model model) {
		model.addAttribute("categories",service.showAllCategories());	
	}
	
	@GetMapping(value = "catalog", params = "genre")
	public String goCatalogAgain(Model model, 
			@PageableDefault(size = 15) Pageable pageable,
			@SortDefault(sort = "bookId")Sort sort,
			@RequestParam(value = "genre", defaultValue = "all") String genre) {
		
		Page<Book> page = Page.empty();
		
		if( firstCategories.contains(genre)) {
			model.addAttribute("filter",genre);
			switch(genre) {
			case "all":
				page = service.getAllBooks(pageable);
				model.addAttribute("page",page);
				model.addAttribute("showName", "Все книги");
				break;
			case "newArrivals":
				page = service.getNewArrivals(true, pageable);
				model.addAttribute("showName", "Новинки");
				break;
			case "bestsellers":
				page = service.getBestSellers(true, pageable);
				model.addAttribute("showName", "Бестселлеры");
				break;
			default:
				page = service.getAllBooks(pageable);
				model.addAttribute("showName", "Все книги");
				break;
			}
			model.addAttribute("page", page);
		}
		else {
			page = service.getBooksByGenre(genre, pageable, pageable.getSort().and(sort));
			model.addAttribute("page",page);
			model.addAttribute("filter",genre);
			model.addAttribute("showName", genre);
			if(service.getGenreOneByGenreTwo(genre) != null) {
				model.addAttribute("genreOne",service.getGenreOneByGenreTwo(genre));
			}
		}
		
		int currentpage = pageable.getPageNumber();
		int startpage = (int)(currentpage - 3 > 0? currentpage - 3:0);
		int endpage = (int)(page.getTotalPages() <= 3? page.getTotalPages()-1:startpage + 3);
		
		
		model.addAttribute("startpage", startpage);
		model.addAttribute("endpage", endpage);
		
		model.addAttribute("sort", sort.iterator().next().getProperty());
		model.addAttribute("direction", sort.iterator().next().getDirection());			

		Map<String,String> sortMenuItems = new LinkedHashMap<String, String>();
		sortMenuItems.put("сначала новые", "bookId,asc");
		sortMenuItems.put("по названию А-Я", "title,asc");
		sortMenuItems.put("по названию Я-А", "title,desc");
		sortMenuItems.put("по автору А-Я", "author,asc");
		sortMenuItems.put("по автору Я-А", "author,desc");
		sortMenuItems.put("по году выхода (по возрастанию)", "publishYear,asc");
		sortMenuItems.put("по году выхода (по убыванию)", "publishYear,desc");
		sortMenuItems.put("по цене (по возрастанию)", "price,asc");
		sortMenuItems.put("по цене (по убыванию)", "price,desc");
		
		model.addAttribute("sortMenuItems",sortMenuItems);

		String sortAndDirection = sort.iterator().next().getProperty()+","+sort.iterator().next().getDirection();
		sortMenuItems.forEach((key, value) -> {
			if(sortAndDirection.equalsIgnoreCase(sortMenuItems.get(key))) {
				model.addAttribute("activeSortItem",key);
			}
		});
		
		
		return "catalog";
	}
	
	@GetMapping("catalog")
	public String goCatalog() {				
		return "redirect:/catalog?genre=all";
	}
	
}
