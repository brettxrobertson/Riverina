package controllers;

import java.util.List;

import model.Customer;
import spark.Request;

public interface CustomerController {

	String addCustomer(Request req);

	List<Customer> getAllCustomers();

}