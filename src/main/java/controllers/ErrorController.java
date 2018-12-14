package controllers;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ErrorController {

	@GetMapping(value = "errors")
    public String renderErrorPage(Model model, HttpServletRequest httpRequest) {
         
       
        String errorMsg = "";
        int httpErrorCode = getErrorCode(httpRequest);
 
        switch (httpErrorCode) {
            case 400: {
                errorMsg = "Http Error Code: 400. Bad Request";
                model.addAttribute("errorCode", 400);
                break;
            }
            case 401: {
                errorMsg = "Http Error Code: 401. Unauthorized";
                model.addAttribute("errorCode", 401);
                break;
            }
            case 404: {
                errorMsg = "Извините, такой страницы не существует...";
                model.addAttribute("errorCode", 404);
                break;
            }
            case 500: {
                errorMsg = "Http Error Code: 500. Internal Server Error";
                model.addAttribute("errorCode", 500);
                break;
            }
        }
       model.addAttribute("errorMsg", errorMsg);
        return "error-page";
    }
     
    private int getErrorCode(HttpServletRequest httpRequest) {
        return (Integer) httpRequest
          .getAttribute("javax.servlet.error.status_code");
    }
	
}
