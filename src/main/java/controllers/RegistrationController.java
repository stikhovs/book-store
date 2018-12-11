package controllers;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MaxUploadSizeExceededException;
import org.springframework.web.multipart.MultipartFile;

import components.CurrentUserComponent;
import components.FileBucketComponent;
import components.RegisterUserComponent;
import data.entities.Cart;
import data.entities.User;
import data.repositories.CartRepository;
import data.repositories.UserRepository;
import data.services.UserService;

@Controller
@PropertySource("classpath:img.properties")
public class RegistrationController {

	@Autowired
	UserRepository userRepository;
	
	@Autowired 
	UserService userService;
	
	@Autowired
	CurrentUserComponent currentUser;
	
	@Autowired
	CartRepository cartRepository;

	@Resource
	Environment env;

	@GetMapping("/registration")
	public String goRegistration(HttpServletRequest request) {
		// model.addAttribute("newUser", new RegisterUserComponent());
		System.out.println("GET");
		System.out.println(env.getProperty("img.upload"));
		System.out.println(request.getServletContext().getRealPath(env.getProperty("img.upload")));
		
		String uploadRootPath = Paths.get(request.getServletContext().getRealPath(env.getProperty("img.rootPath"))).getParent().getParent() + env.getProperty("img.upload") + File.separator + 123;
		System.out.println("uploadRootPath= " + uploadRootPath);
		return "registration";
	}

	@ModelAttribute("newUser")
	public RegisterUserComponent createNewUserModel() {
		return new RegisterUserComponent();
	}

	@ModelAttribute("fileBucket")
	public FileBucketComponent createFileBucket() {
		return new FileBucketComponent();
	}

	@PostMapping("/registration")
	public String doRegistration(@ModelAttribute("newUser") @Valid RegisterUserComponent newUser,
			BindingResult result, Model model,
			HttpServletRequest request, HttpServletResponse response) throws IOException {

		
		if(userService.findByEmail(newUser.getEmail()) != null) {
			result.rejectValue("email", "userAlreadyExists", "Пользователь с таким e-mail уже существует");
		}
		
		if (!newUser.getPassword().equals(newUser.getPasswordConfirm())) {
			result.rejectValue("password", "passwordNoMatch", "Пароли не совпадают");
			result.rejectValue("passwordConfirm", "passwordNoMatch", "Пароли не совпадают");
		}
		
		MultipartFile myFile = newUser.getFile();
		if(!myFile.isEmpty()) {

			//System.out.println("Content Type: " + myFile.getContentType());
			try {
				if(!myFile.getContentType().contains("image")) {
					throw new ClassCastException();
				}
				if(myFile.getSize() > newUser.getMaxImageSize()) {
					throw new MaxUploadSizeExceededException(newUser.getMaxImageSize());
				}
				String newUserCreationTime = newUser.getDateOfCreation();
				
				String uploadRootPath = Paths.get(request.getServletContext().getRealPath(env.getProperty("img.rootPath"))).getParent().getParent() + env.getProperty("img.upload") + File.separator + newUserCreationTime;
				System.out.println("uploadRootPath= " + uploadRootPath);

				File uploadRootDir = new File(uploadRootPath);

				// Create directory if it not exists.
				if (!uploadRootDir.exists()) {
					uploadRootDir.mkdirs();
				}

				FileCopyUtils.copy(myFile.getBytes(),
						new File(uploadRootDir.getAbsolutePath() + File.separator + myFile.getOriginalFilename()));
				
				
				model.addAttribute("avatar", newUserCreationTime + File.separator + myFile.getOriginalFilename());
				newUser.setAvatarPath(newUserCreationTime + File.separator + myFile.getOriginalFilename());
				
			}
			catch (ClassCastException e) {
				result.rejectValue("file", "file.not.image", "Файл не является изображением");
			}
			catch (MaxUploadSizeExceededException e) {
				result.rejectValue("file", "file.to.big.size", "Размер файла не должен превышать 1 Mb");
			}
		}
		else {
			newUser.setAvatarPath(env.getProperty("img.default.avatar"));
			model.addAttribute("avatar", env.getProperty("img.default.avatar"));
		}
			
		
		
		if (result.hasErrors()) {
			System.out.println("ошибка");
			result.getAllErrors().forEach(e -> System.out.println(e));
			System.out.println("newUser: " + newUser);

			return "registration";
		}

		
		
		
		System.out.println(newUser);
		model.addAttribute(newUser);
		
		User user = new User();
		
		user.setFirstName(newUser.getFirstName());
		user.setLastName(newUser.getLastName());
		user.setPhone(newUser.getPhone());
		user.setEmail(newUser.getEmail());
		user.setPassword(newUser.getPassword());
		user.setAvatarPath(newUser.getAvatarPath());
		user.setRights("User");
		
		userRepository.saveAndFlush(user);
		currentUser.setUserId(user.getUserId());
		
		Cart cart = new Cart();
		
		cart.setUserId(user.getUserId());
		cart.setBooks(currentUser.getBooksInCart());
		cart.setTotalItems(currentUser.getTotalItemsInCart());
		cart.setTotalSum(currentUser.getTotalSum());
		cartRepository.saveAndFlush(cart);
		
		
		model.addAttribute("user", user);
		
		Cookie userIdCookie = new Cookie("userId", String.valueOf(user.getUserId()));
		userIdCookie.setMaxAge(300);
		userIdCookie.setPath("/");
		response.addCookie(userIdCookie);
		
		currentUser.setAnonymUser(false);
		
		return "redirect:/";
	}

	
}
