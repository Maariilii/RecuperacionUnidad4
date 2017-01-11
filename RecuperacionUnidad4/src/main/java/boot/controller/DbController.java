package boot.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import boot.model.Db;

import boot.service.DbService;


@Controller
public class DbController {
	@Autowired
	private DbService dbService;

	@GetMapping("/dbs")
	public String home(HttpServletRequest request) {
		request.setAttribute("mode", "MODE_HOME");
		return "dbs";
	}

	@GetMapping("/all-dbs")
	public String allDbs(HttpServletRequest request) {
		request.setAttribute("dbs", dbService.findAll());
		request.setAttribute("mode", "MODE_DBS");
		return "dbs";
	}

	@GetMapping("/new-db")
	public String newDb(HttpServletRequest request) {
		request.setAttribute("mode", "MODE_NEW");
		return "dbs";
	}

	
	@PostMapping("/save-db")
	public String saveDb(@ModelAttribute Db db, 
			BindingResult bindingResult, HttpServletRequest request) {
		dbService.save(db);
		request.setAttribute("dbs", dbService.findAll());
		request.setAttribute("mode", "MODE_DBS");		
		return "dbs";
	}
	
	@GetMapping("/update-db")
	public String updateDb(@RequestParam int id, HttpServletRequest request) {
	request.setAttribute("db",dbService.finOne(id));
		request.setAttribute("mode", "MODE_UPDATE");
		return "dbs";
	}	
	
	
	@GetMapping("/delete-db")
	public String deleteDb(@RequestParam int id, HttpServletRequest request) {
		dbService.delete(id);
	request.setAttribute("dbs", dbService.findAll());
		request.setAttribute("mode", "MODE_DBS");
		return "dbs";
	}	
}
