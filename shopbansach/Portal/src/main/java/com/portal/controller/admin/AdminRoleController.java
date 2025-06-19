package com.portal.controller.admin;


import com.portal.entities.Role;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;

@Controller
@RequestMapping("/admin")
public class AdminRoleController {
    RestTemplate restTemplate = new RestTemplate();

    @GetMapping("/list-role")
    public String roleHome(Model model){
        ResponseEntity<Role[]> role = restTemplate.getForEntity("http://localhost:8081/admin/list-role", Role[].class);
        model.addAttribute("roles",role.getBody());
        return "admin/role/list-role";
    }

    @GetMapping("/add-role")
    public String addRole(Model model){
        model.addAttribute("role", new Role());
        return "admin/role/add-role";
    }

    @PostMapping("/save-role")
    public  String saveRole(@ModelAttribute Role role){
        restTemplate.postForObject("http://localhost:8081/admin/save-role",role,Role.class);
        return "redirect:/admin/list-role";
    }

    @GetMapping("/edit-role/{id}")
    public String editRole(@PathVariable int id, Model model){
        String url = "http://localhost:8081/admin/edit-role/"+id;
        Role role = restTemplate.getForObject(url, Role.class);
        model.addAttribute("role",role);
        return "admin/role/edit-role";
    }

    @GetMapping("/delete-role/{id}")
    public String delteRole(@PathVariable int id){
        restTemplate.delete("http://localhost:8081/admin/delete-role/"+id);
        return "redirect:/admin/list-role";
    }
}
