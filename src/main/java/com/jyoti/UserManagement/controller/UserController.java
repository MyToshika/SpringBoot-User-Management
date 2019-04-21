/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.abeer.digiteach.controller;
import com.abeer.digiteach.model.UserModel;
import com.abeer.digiteach.service.UserService;
import com.abeer.digiteach.util.Constant;
import com.abeer.digiteach.util.FileUploaderHelper;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.messaging.MessagingException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UserController {

    @Autowired
    private UserService userService;
    @Autowired
    private JavaMailSender mailSender;

    @RequestMapping(value = "/dashboard.htm", method = RequestMethod.GET)
    public ModelAndView dashboard(HttpServletRequest request, HttpSession session, ModelMap model) {
        List< UserModel> femaleList = userService.getListOffemaleStudent();
        model.put("femaleList", femaleList);

        List<UserModel> maleList = userService.getListOfMaleStudent();
        model.put("maleList", maleList);

        return new ModelAndView("dashboard");

    }

    @RequestMapping(value = "/logout.htm", method = RequestMethod.GET)
    public ModelAndView logout(HttpServletRequest request, HttpSession session) {
        if (session != null) {
            session.invalidate();
        }
        return new ModelAndView("login");

    }
    
      @RequestMapping(value = "/registeruserlist.htm", method = RequestMethod.GET)
    public ModelAndView usermanagement(ModelMap model, HttpServletRequest request, HttpSession session) {
        List<UserModel> userList = userService.getUserList();
        model.put("list", userList);
        return new ModelAndView("registeruserlist");
    }
    
    
     @RequestMapping(value = "/updateDetails.htm", method = RequestMethod.GET)
    public ModelAndView updatedetails(HttpServletRequest request, HttpSession session, ModelMap model) {
        int id = Integer.parseInt(request.getParameter("id"));
        model.put("id", id);
        return new ModelAndView("updateDetails", model);

    }
    
    @RequestMapping(value = "/registration.htm", method = RequestMethod.GET)
    public ModelAndView registrationGet(HttpServletRequest request, HttpSession session, ModelMap model) throws MessagingException, javax.mail.MessagingException {
        return new ModelAndView("registration");
    }

    @RequestMapping(value = "/registration.htm", method = RequestMethod.POST)
    public ModelAndView registrationPost(HttpServletRequest request, HttpSession session, ModelMap model, @RequestParam CommonsMultipartFile coverPhoto) throws IOException, MessagingException, javax.mail.MessagingException {

        UserModel userModel = new UserModel();
        String uid = UUID.randomUUID().toString();
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String gender = request.getParameter("gender");
        int marks = Integer.parseInt(request.getParameter("marks"));
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        String status = request.getParameter("status");
        String currentDate = request.getParameter("currentDate");
        UserModel user = userService.getUser(uid);
        try {
            if (user == null && coverPhoto != null && coverPhoto.getSize() > 0) {
                File file = new File(uid + "." + FileUploaderHelper.getFileExtension(coverPhoto.getFileItem().getName()));
                coverPhoto.transferTo(new File(Constant.REGISTRATION_IMAGE_PATH + file));
                String poster_url = uid + "." + FileUploaderHelper.getFileExtension(coverPhoto.getFileItem().getName());
                userModel.setCoverPhoto(poster_url);
                userModel.setFileName(coverPhoto.getOriginalFilename());
                userModel.setName(name);
                userModel.setMarks(marks);
                userModel.setPhone(phone);
                userModel.setGender(gender);
                userModel.setCurrentDate(currentDate);
                userModel.setEmail(email);
                userModel.setUid(uid);
                userModel.setPassword(password);
                userModel.setConfirmPassword(confirmPassword);
                userModel.setStatus(status);
                userService.addUser(userModel);
                String msg = "Dear " + name + " your registration is successful we will notify you for further Action .";
                //System.out.println("mail process");
                sendEmail(email, msg);
                //System.out.println("mail sent");
                return new ModelAndView("redirect:/registeruserlist.htm", model);

            } else {
                model.put("message", "You are already registered.");
                return new ModelAndView("registration", model);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            model.put("message", ex.getMessage());
            return new ModelAndView("login", model);
        }
    }

    public void sendEmail(String email, String message) throws MessagingException, javax.mail.MessagingException {
        
           // System.out.println("This done 1");
            MimeMessage mimeMessage = mailSender.createMimeMessage();
            //System.out.println("This done 2");
            MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, false, "utf-8");
            mimeMessage.setContent(message, "text/html");
            helper.setSubject("Digitech Registration");
            helper.setTo(email);
             try {
            mailSender.send(mimeMessage);
        } catch (Exception ex) {
            
            ex.printStackTrace();
        }
       
    }
      
    @RequestMapping(value = "/login.htm", method = RequestMethod.GET)
    public ModelAndView login(HttpServletRequest request, HttpSession session) {
        return new ModelAndView("login");
        
    }

    @RequestMapping(value = "/login.htm", method = RequestMethod.POST)
    public ModelAndView Postlogin(HttpServletRequest request, HttpSession session, ModelMap model) {
        String name = request.getParameter("name");
        String password = request.getParameter("password");
        UserModel userModel = userService.getlogin(name, password);
        if (userModel != null) {
            model.put("message", "Login successful!");
            session.setAttribute("user", userModel);
            System.out.println("SessionData::" + session.getAttribute("user"));
            model.put("username", userModel.getName());
            model.put("message", "login sucessfully");
            session.setAttribute("username", userModel.getName());
            model.put("username", userModel.getId());
            return new ModelAndView("redirect:/dashboard.htm", model);
        } else {
            model.put("message", "Invalid login details");
            return new ModelAndView("login");
        }

    }

    @RequestMapping(value = "/edituser.htm", method = RequestMethod.GET)
    public ModelAndView getedituserId(HttpServletRequest request, HttpSession session, ModelMap model) {
        int id = Integer.parseInt(request.getParameter("id"));
        UserModel userModel = userService.getId(id);
        model.put("user", userModel);
        return new ModelAndView("edituser", model);
    }

    @RequestMapping(value = "/edituser.htm", method = RequestMethod.POST)
    public ModelAndView update(HttpServletRequest request, HttpSession session, ModelMap model) {

        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String uid = request.getParameter("uid");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        String status = request.getParameter("status");
        String currentDate = request.getParameter("currentDate");
        UserModel user = userService.getId(id);
        if (user == null) {
            model.put("message", "Enter correct Id");
            return new ModelAndView("edituser", model);
        } else {
            user.setName(name);
            user.setPhone(phone);
            user.setCurrentDate(currentDate);
            user.setEmail(email);
            user.setUid(uid);
            user.setPassword(password);
            user.setConfirmPassword(confirmPassword);
            user.setStatus(status);
            userService.updateUser(user);
            model.put("message", " update sucess.");
            return new ModelAndView("redirect:/registeruserlist.htm", model);
        }
    }
    
     @RequestMapping(value = "/add_picture.htm", method = RequestMethod.GET)
    public ModelAndView addpic(HttpServletRequest request, HttpSession session, ModelMap model) {
        int id = Integer.parseInt(request.getParameter("id"));
        model.put("id", id);
        return new ModelAndView("add_picture", model);

    }
    @RequestMapping(value = "/add_picture.htm", method = RequestMethod.POST)
    public ModelAndView getEditGalleryImages(HttpServletRequest request, ModelMap model, @RequestParam CommonsMultipartFile coverPhoto) {
        int id = Integer.parseInt(request.getParameter("id").trim());
        UserModel userModel = userService.getId(id);
        try {
            String uid = UUID.randomUUID().toString();
            if (coverPhoto != null && coverPhoto.getSize() > 0) {
                File file = new File(uid + "." + FileUploaderHelper.getFileExtension(coverPhoto.getFileItem().getName()));
                coverPhoto.transferTo(new File(Constant.REGISTRATION_IMAGE_PATH + file));
                String poster_url = uid + "." + FileUploaderHelper.getFileExtension(coverPhoto.getFileItem().getName());
                userModel.setCoverPhoto(poster_url);
            }
            userService.editImage(userModel);
            return new ModelAndView("redirect:/registeruserlist.htm");
        } catch (Exception ex) {
            ex.printStackTrace();
            model.put("message", ex.getMessage());

        }

        return new ModelAndView("redirect:/registeruserlist.htm", model);
    }

}
