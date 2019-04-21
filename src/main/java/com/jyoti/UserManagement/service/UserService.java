/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.abeer.digiteach.service;

import com.abeer.digiteach.model.UserModel;
import java.util.List;

/**
 *
 * @author Abeer
 */
public interface UserService {

    public void addUser(UserModel userModel);

    public UserModel getUser(String uid);
     
    public UserModel getId(int id);

    public List<UserModel> getUserList();

    public UserModel getlogin(String username, String password);

    public void updateUser(UserModel userModel);
    
    public void editImage(UserModel userModel);

    public List<UserModel> getListOffemaleStudent();

    public List<UserModel> getListOfMaleStudent();
   

    

}
