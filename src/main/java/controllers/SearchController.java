package controllers;

import java.util.LinkedHashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.data.web.SortDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;

import data.entities.Book;
import data.repositories.BookRepository;
import data.services.CategoriesService;
import data.services.SeachService;

@Controller
public class SearchController {

	@Autowired
	SeachService service;
	
	@Autowired
	BookRepository repo;
	
	@Autowired
	CategoriesService categoriesService;
	
	@ModelAttribute
	public void showAllCategories(Model model) {
		model.addAttribute("categories",categoriesService.showAllCategories());	
	}
	
	@GetMapping("search")
	public String goSearch(Model model, 
			@PageableDefault(size = 15) Pageable pageable,
			@SortDefault(sort = "bookId")Sort sort,
			@RequestParam(name="search") String searchWord) {
		System.out.println(searchWord);
		
		//service.findBooks("%"+searchWord+"%").forEach(e -> System.out.println(e));
		
		Page<Book> page = service.findBooks(searchWord, pageable);
		
		model.addAttribute("page",page);
		model.addAttribute("searchWord",searchWord);
		
		int currentpage = pageable.getPageNumber();
		int startpage = (int)(currentpage - 3 > 0? currentpage - 3:0);
		int endpage = (int)(page.getTotalPages() <= 3? page.getTotalPages()-1:startpage + 3);
		
		
		model.addAttribute("startpage", startpage);
		model.addAttribute("endpage", endpage);
		
		model.addAttribute("sort", sort.iterator().next().getProperty());
		model.addAttribute("direction", sort.iterator().next().getDirection());			

		Map<String,String> sortMenuItems = new LinkedHashMap<String, String>();
		sortMenuItems.put("������� �����", "bookId,asc");
		sortMenuItems.put("�� �������� �-�", "title,asc");
		sortMenuItems.put("�� �������� �-�", "title,desc");
		sortMenuItems.put("�� ������ �-�", "author,asc");
		sortMenuItems.put("�� ������ �-�", "author,desc");
		sortMenuItems.put("�� ���� ������ (�� �����������)", "publishYear,asc");
		sortMenuItems.put("�� ���� ������ (�� ��������)", "publishYear,desc");
		sortMenuItems.put("�� ���� (�� �����������)", "price,asc");
		sortMenuItems.put("�� ���� (�� ��������)", "price,desc");
		
		model.addAttribute("sortMenuItems",sortMenuItems);

		String sortAndDirection = sort.iterator().next().getProperty()+","+sort.iterator().next().getDirection();
		sortMenuItems.forEach((key, value) -> {
			if(sortAndDirection.equalsIgnoreCase(sortMenuItems.get(key))) {
				model.addAttribute("activeSortItem",key);
			}
		});
		
		return "search";
	}
	
}
