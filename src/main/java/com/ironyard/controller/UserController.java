package com.ironyard.controller;

import com.ironyard.data.MovieUser;
import com.ironyard.repo.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;

/**
 * Created by jasonskipper on 2/6/17.
 */
@Controller
public class UserController {

    @Autowired
    private UserRepo userRepo;

    @RequestMapping(path = "/open/authenticate", method = RequestMethod.POST)
    public String login(HttpSession session, Model data, @RequestParam(name = "username") String usr, @RequestParam String password){
        MovieUser found = userRepo.findByUsernameAndPassword(usr, password);
        String destinationView = "home";
        if(found == null){
            // no user found, login must fail
            destinationView = "login";
            data.addAttribute("message", "User/Pass combination not found.");
        }else{
            session.setAttribute ("user", found);
            destinationView = "redirect:/secure/movies";
        }
        return destinationView;
    }
        @RequestMapping(path = "/secure/user/delete", method = RequestMethod.GET)
        public String deleteUser(Model mapOfDataForJsp, @RequestParam Long id){
        userRepo.delete(id);
        // find by
        mapOfDataForJsp.addAttribute("delete_success", "user Deleted.");
        return "forward:/open/homeusers";
    }
        @RequestMapping(path = "/secure/user/select", method = RequestMethod.GET)
        public String selectUserForEdit(Model mapOfDataForJsp, @RequestParam Long id){
        MovieUser selectedUser = userRepo.findOne(id);
        mapOfDataForJsp.addAttribute("selectedUser", selectedUser);
        String dest = "/open/createuser";
        return dest;
    }
        @RequestMapping(path = "/open/createuser", method = RequestMethod.POST)
        public String createUser(Model dataToJsp, MovieUser newUser){
        String dest = "/open/login";
        // save to database
       userRepo.save(newUser);

        // if successful save, add message
        if(newUser.getId()>0) {
            dataToJsp.addAttribute("succes_user_create_msg",
                    String.format("User '%s' was created!", newUser.getUsername()));
        }
        return dest;

    }
        @RequestMapping(path = "/open/homeusers")
        public String listUsers(Model xyz){
        String destination = "homeusers";
        Iterable found = userRepo.findAll();
        // put list into model
        xyz.addAttribute("uList", found);

        // go to jsp
        return destination;
    }

}

