package controllers;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import components.CurrentUserComponent;
import data.entities.Preorder;
import data.entities.User;
import data.services.BookService;
import data.services.PreorderService;
import data.services.UserService;

@Controller
public class PreorderController {

	@Autowired
	PreorderService preorderService;
	
	@Autowired
	BookService bookService;
	
	@Autowired
	CurrentUserComponent currentUser;
	
	
	
	@GetMapping("catalog/{id}/preorder")
	public String goPreorder(Model model, @PathVariable("id") long bookId) {
		
		// Если книга уже доступна для покупки, то редирект на страницу этой книги
		if(!bookService.getBookById(bookId).isPreOrder()) return "redirect:/catalog/"+bookId;
		
		model.addAttribute("preorder",new Preorder());
		model.addAttribute("book",bookService.getBookById(bookId));
		
		
		return "preorder";
	}
	
	@PostMapping("catalog/{id}/preorder")
	public String makePreorder(@ModelAttribute("preorder") @Valid Preorder preorder, BindingResult result, @PathVariable("id") long bookId) {
		
		if(result.hasErrors()) {
			return "preorder";
		}
		
		Preorder newPreorder = new Preorder(bookId, currentUser.getUserId(), preorder.getComment() == null ? "" : preorder.getComment());
		
		preorderService.savePreorder(newPreorder);
		
		return "preorder-final";
	}
	
}
