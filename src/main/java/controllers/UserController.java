package controllers;

import java.util.List;

import model.User;
import spark.Request;

public interface UserController {

	User getUser(String id);

	List<User> getUsers();

	String addUser(Request req);

}