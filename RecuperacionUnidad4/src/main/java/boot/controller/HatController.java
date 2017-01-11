package boot.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import boot.model.Hat;
import boot.service.HatService;

@Controller
public class HatController {
	
	@Autowired
	private HatService hatService;

	@GetMapping("/hats")
	public String home(HttpServletRequest request) {
		request.setAttribute("mode", "MODE_HOME");
		return "hats";
	}

	@GetMapping("/all-hats")
	public String allShoes(HttpServletRequest request) {
		request.setAttribute("hats", hatService.findAll());
		request.setAttribute("mode", "MODE_HATS");
		return "hats";
	}

	@GetMapping("/new-hat")
	public String newShoe(HttpServletRequest request) {
		request.setAttribute("mode", "MODE_NEW");
		return "hats";
	}

	
	@PostMapping("/save-hat")
	public String saveShoe(@ModelAttribute Hat shoe, 
			BindingResult bindingResult, HttpServletRequest request) {
		hatService.save(shoe);
		request.setAttribute("hats", hatService.findAll());
		request.setAttribute("mode", "MODE_HATS");		
		return "hats";
	}
	
	@GetMapping("/update-hat")
	public String updateShoe(@RequestParam int id, HttpServletRequest request) {
	request.setAttribute("hat", hatService.finOne(id));
		request.setAttribute("mode", "MODE_UPDATE");
		return "hats";
	}	
	
	
	@GetMapping("/delete-hat")
	public String deleteShoe(@RequestParam int id, HttpServletRequest request) {
		hatService.delete(id);
	request.setAttribute("hats", hatService.findAll());
		request.setAttribute("mode", "MODE_HATS");
		return "hats";
	}	


}
