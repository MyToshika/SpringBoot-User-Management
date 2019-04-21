/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.abeer.digiteach.dao;

import com.abeer.digiteach.model.UserModel;
import java.util.List;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("userDao")
public class UserDaoImp implements UserDao{
    
     @Autowired
    private SessionFactory sessionFactory;

    @Override
    public void addUser(UserModel userModel) {
         sessionFactory.getCurrentSession().saveOrUpdate(userModel);
    }

    @Override
    public UserModel getUser(String uid) {
         return (UserModel) sessionFactory.getCurrentSession().createCriteria(UserModel.class).add(Restrictions.eq("uid", uid)).uniqueResult();
    }

    @Override
    public List<UserModel> getUserList() {
        return (List<UserModel>) sessionFactory.getCurrentSession().createCriteria(UserModel.class).list();
    }

    
     @Override
     public UserModel getlogin(String username, String password) {
        return (UserModel) sessionFactory.getCurrentSession().createCriteria(UserModel.class).add(Restrictions.eq("name", username)).add(Restrictions.eq("password", password)).uniqueResult();
    }

    @Override
    public void updateUser(UserModel userModel) {
      sessionFactory.getCurrentSession().update(userModel);
    }

    @Override
    public UserModel getId(int id) {
         String Status = "Active";
       return (UserModel) sessionFactory.getCurrentSession().createCriteria(UserModel.class).add(Restrictions.eq("status", Status)).add(Restrictions.eq("id", id)).uniqueResult();
    }    

    @Override
    public void editImage(UserModel userModel) {
        sessionFactory.getCurrentSession().update(userModel);
    }

    @Override
    public List<UserModel> getListOffemaleStudent() {
       String Gender = "Female";
        return (List<UserModel>) sessionFactory.getCurrentSession().createCriteria(UserModel.class).add(Restrictions.eq("gender", Gender)).addOrder(Order.desc("marks")).list();
    }

    @Override
    public List<UserModel> getListOfMaleStudent() {
        String Gender = "male";
        return (List<UserModel>) sessionFactory.getCurrentSession().createCriteria(UserModel.class).add(Restrictions.eq("gender", Gender)).addOrder(Order.desc("marks")).list();
    }
}
 
