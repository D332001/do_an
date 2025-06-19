package com.portal.controller.admin;


import com.portal.entities.Category;
import com.portal.entities.Role;
import com.portal.entities.User;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;

@Controller
public class UserController {
    RestTemplate restTemplate = new RestTemplate();

    @GetMapping(value = "/manager/users")
    public String users(Model model){
        String url = "http://localhost:8081/admin/users";
        ResponseEntity<User[]> users = restTemplate.getForEntity(url,User[].class);
        model.addAttribute("users", users.getBody());
        return "admin/list-user";
    }

    @RequestMapping(value = "/register")
    public String register(Model model){
        String url = "http://localhost:8081/admin/users";
        ResponseEntity<User[]> users = restTemplate.getForEntity(url,User[].class);
        model.addAttribute("users", users.getBody());
        return "users/register";
    }

    @PostMapping(value = "/save-user")
    public String saveUser(@RequestBody User data){
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder(16);
        data.setPassword(encoder.encode(data.getPassword()));
        String url = "http://localhost:8081/save-user";
        restTemplate.postForObject(url, data, User.class);
        return "users/login";
    }

    @GetMapping(value = "/admin/delete-user/{id}")
    public String delUser(@PathVariable int id){
        String url = "http://localhost:8081/admin/delete-user/"+id;
        restTemplate.delete(url);
        return "redirect:/manager/users";
    }

    @PutMapping(value = "/admin/update-user/{id}")
    public String update(@PathVariable Integer id, @RequestBody User data){
        String url = "http://localhost:8081/update-user/"+id;
        restTemplate.postForObject(url, data, User.class);
        return "admin/list-user";
    }

    @GetMapping("/admin/edit-user/{id}")
    public String editUser(@PathVariable Integer id, final ModelMap model
    )
            throws Exception {
        ResponseEntity<Role[]> roles = restTemplate.getForEntity("http://localhost:8081/admin/list-role", Role[].class);
        model.addAttribute("roles", roles.getBody());
        ResponseEntity<User> user = restTemplate.getForEntity("http://localhost:8081/admin/edit-user/"+id, User.class);
        model.addAttribute("user", user.getBody());
        return "admin/edit-user";
    }

    @PostMapping("/admin/save-user")
    public  String saveUserRole(@ModelAttribute User user){
        restTemplate.postForObject("http://localhost:8081/admin/save-user",user, User.class);
        return "redirect:/manager/users";
    }

}
